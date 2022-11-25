import 'package:flutter/material.dart';

class DrugListItem extends StatelessWidget {
  const DrugListItem({
    super.key,
    required this.drugName,
    required this.nextDoseDate,
  });

  final String drugName;

  final DateTime nextDoseDate;

// TODO Add list items interactions and drug details view
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            drugName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Next dose ${nextDoseDate.toString().substring(0, 16)}",
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          )
        ],
      ),
    );
  }
}
