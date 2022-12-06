import 'dart:collection';

import 'package:flutter/material.dart';

import 'drug.dart';

class DrugList extends ChangeNotifier {
  /// Internal, private state of the drug list.
  final List<Drug> _items = [
    Drug(id: 1, name: "Espumisan", dosage: "20mg", notes: ""),
    Drug(id: 2, name: "Bianacid", dosage: "40mg", notes: "")
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

  /// Adds [drug] to the drug list.
  void add(Drug drug) {
    _items.add(drug);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
