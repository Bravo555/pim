import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  void onDateChanged(DateTime time) {
    // TODO Load scrollable list of drugs to take that day and show them below calendar
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.utc(1990),
          lastDate: DateTime.utc(2030),
          onDateChanged: onDateChanged,
        ),
        const Tab(
          text: "Placeholder for scrollable list",
        ),
      ],
    );
  }
}
