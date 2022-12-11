import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:pim/models/times_of_day.dart';
import 'package:pim/time_utils.dart';
import 'package:provider/provider.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Times of day settings",
            style: TextStyle(fontSize: 24),
          ),
          DateTimePicker(
              icon: const Icon(Icons.event),
              timeLabelText: "Morning time",
              type: DateTimePickerType.time,
              initialTime: TimeOfDay(hour: 8, minute: 0),
              initialValue: TimeOfDay(hour: 8, minute: 0).format(context),
              onChanged: (value) =>
                  Provider.of<TimesOfDay>(context, listen: false).setTimeOfDay(
                      DrugTimeOfDay.morning, timeOfDayFromString(value))),
          DateTimePicker(
            icon: const Icon(Icons.event),
            timeLabelText: "Afternoon time",
            type: DateTimePickerType.time,
            initialTime: TimeOfDay(hour: 14, minute: 0),
            initialValue: TimeOfDay(hour: 14, minute: 0).format(context),
            onChanged: (value) =>
                Provider.of<TimesOfDay>(context, listen: false).setTimeOfDay(
                    DrugTimeOfDay.afternoon, timeOfDayFromString(value)),
          ),
          DateTimePicker(
            icon: const Icon(Icons.event),
            timeLabelText: "Evening time",
            type: DateTimePickerType.time,
            initialTime: TimeOfDay(hour: 20, minute: 0),
            initialValue: TimeOfDay(hour: 20, minute: 0).format(context),
            onChanged: (value) =>
                Provider.of<TimesOfDay>(context, listen: false).setTimeOfDay(
                    DrugTimeOfDay.evening, timeOfDayFromString(value)),
          ),
        ]),
      );

  TimeOfDay timeOfDayFromString(String text) => TimeOfDay(
      hour: int.parse(text.split(":")[0]),
      minute: int.parse(text.split(":")[1]));

  @override
  String toStringShort() => "Preferences";
}
