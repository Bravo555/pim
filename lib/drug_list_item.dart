import 'package:flutter/material.dart';
import 'package:pim/drug_details_page.dart';

class DrugListItem extends StatelessWidget {
  const DrugListItem({
    super.key,
    required this.drugName,
    required this.nextDoseDate,
    required this.id,
  });

  final String drugName;
  final DateTime nextDoseDate;
  final int id;

  _onSelected(BuildContext context, String value) {
    if (value == 'edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DrugDetailsPage(id: id),
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
      title: Text(drugName),
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
