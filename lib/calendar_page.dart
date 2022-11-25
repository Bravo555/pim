import 'dart:math';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDay = DateTime.now();
// TODO Load scrollable list of drugs to take that day and show them below calendar
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime.utc(1990),
          lastDay: DateTime.utc(2030),
          calendarFormat: CalendarFormat.month,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
          ),
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(day, selectedDay),
        ),
        const Tab(
          text: "Placeholder for scrollable list",
        ),
      ],
    );
  }
}
