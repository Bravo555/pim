import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pim/drug_list_item.dart';
import 'package:pim/models/drug.dart';

class DrugList extends StatefulWidget {
  const DrugList({super.key});

  @override
  State<StatefulWidget> createState() => _DrugListState();
}

class _DrugListState extends State<DrugList> {
  final List<Drug> drugList = <Drug>[
    Drug(id: 1, name: "Espumisan", dosage: "20mg", notes: ""),
    Drug(id: 2, name: "Bianacid", dosage: "40mg", notes: "")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: drugList.length,
        itemBuilder: (context, index) =>
            _getDrugListItem(index, drugList[index]));
  }

  Widget _getDrugListItem(int id, Drug drug) =>
      DrugListItem(drug: drug, onChanged: _onDrugChanged);

  void _onDrugChanged(Drug newDrug) {
    setState(() {});
  }

  @override
  String toStringShort() {
    return "Drug List";
  }
}
