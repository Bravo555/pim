import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'drug.dart';
import 'package:pim/time_utils.dart';

class DrugList extends ChangeNotifier {
  DrugList();
  DrugList.fromList(this._items);

  /// Internal, private state of the drug list.
  List<Drug> _items = [
    Drug(
        name: "Espumisan",
        dosage: "20mg",
        notes: "",
        frequency: DosageFrequency.thriceADay),
    Drug(
        name: "Bianacid",
        dosage: "40mg",
        notes: "",
        frequency: DosageFrequency.onceADay)
  ];

  void setItems(List<Drug> _items) {
    this._items = _items;
    notifyListeners();
  }

  static Future<String> get _localPath async =>
      (await getApplicationDocumentsDirectory()).path;

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/drugList.json');
  }

  Future<File> writeDrugList() async {
    final file = await _localFile;
    final drugListJson = jsonEncode(_items);
    return file.writeAsString(drugListJson);
  }

  static Future<List<Drug>> readDrugList() async {
    final file = await _localFile;
    final contents = await file.readAsString();

    final dynList = jsonDecode(contents) as List<dynamic>;
    final drugList =
        dynList.map((e) => Drug.fromJson(e as Map<String, dynamic>)).toList();

    Drug.nextId = drugList.fold(
        0,
        (previousValue, element) =>
            element.id > previousValue ? element.id : previousValue);

    return drugList;
  }

  /// An unmodifiable view of the all the drugs
  UnmodifiableListView<Drug> get items => UnmodifiableListView(_items);

  /// Modifies item
  void editDrug(Drug other) {
    final idx = _items.indexWhere((element) => element.id == other.id);
    _items.removeAt(idx);
    _items.insert(idx, other);

    writeDrugList();

    notifyListeners();
  }

  void deleteDrug(Drug drug) {
    _items.removeWhere((element) => element.id == drug.id);
    writeDrugList();
    notifyListeners();
  }

  /// Adds [drug] to the drug list.
  void add(Drug drug) {
    _items.add(drug);
    writeDrugList();
    notifyListeners();
  }

  Iterable<Drug> drugsForTimeOfDay(DrugTimeOfDay timeOfDay) =>
      _items.where((drug) => drug.toDrugTimesOfDay().contains(timeOfDay));
}
