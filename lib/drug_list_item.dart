import 'package:flutter/material.dart';
import 'package:pim/drug_details_page.dart';
import 'package:pim/models/drug.dart';

class DrugListItem extends StatelessWidget {
  const DrugListItem({
    super.key,
    required this.drug,
    required this.nextDoseDate,
  });

  final Drug drug;
  final DateTime nextDoseDate;

  _onSelected(BuildContext context, String value) {
    if (value == 'edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DrugDetailsPage(id: drug.id),
        ),
      );
    } else {
      //TODO impelemt delete
    }
  }

// TODO Add list items interactions and drug details view
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      title: Text(drug.name),
      subtitle: Text("Next dose ${nextDoseDate.toString().substring(0, 16)}"),
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
