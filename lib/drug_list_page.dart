import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pim/drug_list_item.dart';
import 'package:pim/models/drug.dart';

class DrugList extends StatelessWidget {
  const DrugList({super.key});

  DateTime getTomorrowMorningDose() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
      9,
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrugListItem(
          drug: Drug(
            id: 1,
            name: "Espumisan",
            dosage: "20mg",
            shouldNotify: true,
          ),
          nextDoseDate: getTomorrowMorningDose(),
        ),
        DrugListItem(
          drug: Drug(
            id: 3,
            name: "Bianacid",
            dosage: "40mg",
            shouldNotify: true,
          ),
          nextDoseDate: getTomorrowMorningDose(),
        ),
      ],
    );
  }

  @override
  String toStringShort() {
    return "Drug List";
  }
}
