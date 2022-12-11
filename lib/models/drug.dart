import 'package:pim/time_utils.dart';

enum DosageFrequency { onceADay, twiceADay, thriceADay }

class Drug {
  static int nextId = 0;

  final int id;
  String name;
  String dosage;
  DosageFrequency frequency;
  String notes;
  bool shouldNotify;

  Drug({
    this.name = "",
    this.dosage = "",
    this.frequency = DosageFrequency.onceADay,
    this.notes = "",
    this.shouldNotify = true,
  }) : id = nextId {
    nextId += 1;
  }

  Drug.from(Drug other)
      : id = other.id,
        name = other.name,
        dosage = other.dosage,
        frequency = other.frequency,
        notes = other.notes,
        shouldNotify = other.shouldNotify;

  Drug.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        dosage = json['dosage'],
        frequency = DosageFrequency.values.byName(json['frequency']),
        notes = json['notes'],
        shouldNotify = json['shouldNotify'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dosage': dosage,
        'frequency': frequency.name,
        'notes': notes,
        'shouldNotify': shouldNotify,
      };

  Iterable<DrugTimeOfDay> toDrugTimesOfDay() {
    switch (frequency) {
      case DosageFrequency.onceADay:
        return [DrugTimeOfDay.morning];
      case DosageFrequency.twiceADay:
        return [DrugTimeOfDay.morning, DrugTimeOfDay.evening];
      case DosageFrequency.thriceADay:
        return [
          DrugTimeOfDay.morning,
          DrugTimeOfDay.afternoon,
          DrugTimeOfDay.evening
        ];
    }
  }

  @override
  String toString() => toJson().toString();
}
