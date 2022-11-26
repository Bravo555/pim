import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pim/drug_list_item.dart';

class DrugList extends StatelessWidget {
  const DrugList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrugListItem(
          drugName: "Espumisan",
          nextDoseDate: DateTime(2022, 11, 29, 8, 30),
          id: 1,
        ),
        DrugListItem(
          drugName: "Bianacid",
          nextDoseDate: DateTime(2022, 12, 1, 9, 0),
          id: 2,
        ),
      ],
    );
  }

  @override
  String toStringShort() {
    return "Drug List";
  }
}
