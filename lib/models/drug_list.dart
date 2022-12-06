import 'dart:collection';

import 'package:flutter/material.dart';

import 'drug.dart';

enum DrugTimeOfDay { morning, afternoon, evening }

class DrugList extends ChangeNotifier {
  /// Internal, private state of the drug list.
  final List<Drug> _items = [
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

  /// An unmodifiable view of the all the drugs
  UnmodifiableListView<Drug> get items => UnmodifiableListView(_items);

  /// Modifies item
  void editDrug(Drug other) {
    final idx = _items.indexWhere((element) => element.id == other.id);
    _items.removeAt(idx);
    _items.insert(idx, other);

    notifyListeners();
  }

  void deleteDrug(Drug drug) {
    _items.removeWhere((element) => element.id == drug.id);
    notifyListeners();
  }

  /// Adds [drug] to the drug list.
  void add(Drug drug) {
    _items.add(drug);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Iterable<Drug> drugsForTimeOfDay(DrugTimeOfDay timeOfDay) {
    switch (timeOfDay) {
      case DrugTimeOfDay.morning:
        return List.unmodifiable(_items);
      case DrugTimeOfDay.afternoon:
        return List.unmodifiable(_items.where(
          (drug) => drug.frequency == DosageFrequency.thriceADay,
        ));
      case DrugTimeOfDay.evening:
        return List.unmodifiable(_items.where(
          (drug) => drug.frequency != DosageFrequency.onceADay,
        ));
    }
  }
}
