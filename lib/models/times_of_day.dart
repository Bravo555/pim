import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

import 'package:pim/time_utils.dart';
import 'drug.dart';

class TimesOfDay extends ChangeNotifier {
  Map<DrugTimeOfDay, TimeOfDay> _timesOfDay = {
    DrugTimeOfDay.morning: TimeOfDay(hour: 8, minute: 0),
    DrugTimeOfDay.afternoon: TimeOfDay(hour: 14, minute: 0),
    DrugTimeOfDay.evening: TimeOfDay(hour: 20, minute: 0),
  };

  void setTimesOfDay(Map<DrugTimeOfDay, TimeOfDay> timesOfDay) {
    _timesOfDay = timesOfDay;
    notifyListeners();
  }

  TimeOfDay getTimeOfDay(DrugTimeOfDay drugTimeOfDay) =>
      _timesOfDay[drugTimeOfDay]!;

  void setTimeOfDay(DrugTimeOfDay key, TimeOfDay value) {
    _timesOfDay[key] = value;
    writeTimesOfDay();
    notifyListeners();
  }

  Duration getTimeUntil(TimeOfDay other) {
    DateTime now = DateTime.now();
    DateTime timeOfDrug =
        DateTime(now.year, now.month, now.day, other.hour, other.minute);
    int day = now.isBefore(timeOfDrug) ? now.day : now.day + 1;
    DateTime until =
        DateTime(now.year, now.month, day, other.hour, other.minute);
    return until.difference(now);
  }

  DateTime getDrugNextDoseDate(Drug drug) {
    return DateTime.now().add(drug
        .toDrugTimesOfDay()
        .map((drugTimeOfDay) => getTimeUntil(getTimeOfDay(drugTimeOfDay)))
        .reduce((value, element) => value <= element ? value : element));
  }

  DrugTimeOfDay getNextDrugTimeOfDay() {
    var drugTimeOfDay = DrugTimeOfDay.values.first;
    var timeUntil = getTimeUntil(getTimeOfDay(DrugTimeOfDay.values.first));

    DrugTimeOfDay.values.skip(1).forEach((drugTimeOfDay) {
      final currTimeUntil = getTimeUntil(getTimeOfDay(drugTimeOfDay));
      if (currTimeUntil.compareTo(timeUntil) < 0) {
        drugTimeOfDay = drugTimeOfDay;
        timeUntil = currTimeUntil;
      }
    });

    return drugTimeOfDay;
  }

  static Future<String> get _localPath async =>
      (await getApplicationDocumentsDirectory()).path;

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/timesOfDay.json");
  }

  Future<File> writeTimesOfDay() async {
    final file = await _localFile;
    final timesOfDay = _timesOfDay.map((key, value) {
      // ah yes, convert TimeOfDay to DateTime so i can only format hour and minutes
      // i hate flutter
      final now = DateTime.now();
      final datetime =
          DateTime(now.year, now.month, now.day, value.hour, value.minute);
      return MapEntry(key.name, DateFormat.Hm().format(datetime));
    });
    final timesOfDayJson = jsonEncode(timesOfDay);
    return file.writeAsString(timesOfDayJson);
  }

  static Future<Map<DrugTimeOfDay, TimeOfDay>> readTimesOfDay() async {
    final file = await _localFile;
    final contents = await file.readAsString();

    final timesOfDay = jsonDecode(contents) as Map<String, dynamic>;
    return timesOfDay.map(
      (key, value) {
        final timeOfDay = DateFormat.Hm().parse(value);

        return MapEntry(DrugTimeOfDay.values.byName(key),
            TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute));
      },
    );
  }
}
