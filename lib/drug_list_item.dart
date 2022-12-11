import 'package:flutter/material.dart';
import 'package:pim/drug_details_page.dart';
import 'package:pim/models/drug.dart';
import 'package:pim/time_utils.dart';
import 'package:provider/provider.dart';

import 'models/drug_list.dart';
import 'package:pim/models/times_of_day.dart';

class DrugListItem extends StatelessWidget {
  const DrugListItem({super.key, required this.drug});

  final Drug drug;

  DateTime _getDoseDate(Drug drug, BuildContext context) =>
      Provider.of<TimesOfDay>(context, listen: false).getDrugNextDoseDate(drug);

  DateTime _getTomorrowMorningDose() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
      9,
      0,
    );
  }

  _onSelected(BuildContext context, String value) {
    if (value == 'edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DrugDetailsPage(
            drug: drug,
          ),
        ),
      );
    } else if (value == 'delete') {
      Provider.of<DrugList>(context, listen: false).deleteDrug(drug);
    }
  }

// TODO Add list items interactions and drug details view
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      title: Text(drug.name),
      subtitle: Text(
          "Next dose ${_getDoseDate(drug, context).toString().substring(0, 16)}"),
      trailing: PopupMenuButton(
        onSelected: (value) => _onSelected(context, value),
        icon: const Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
            value: "edit",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Edit"),
                Icon(Icons.edit),
              ],
            ),
          ),
          PopupMenuItem(
            value: "delete",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
