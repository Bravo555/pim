// TODO check what adapter we should use in data repository or scrap that
// @DataRepository([ConfigureRepositoryLocalStorage], remote: false)

enum DosageFrequency { onceADay, twiceADay, thriceADay }

class Drug {
  final int id;
  String name;
  String dosage;
  DosageFrequency frequency;
  String notes;
  bool shouldNotify;

  Drug({
    required this.id,
    required this.name,
    required this.dosage,
    this.frequency = DosageFrequency.onceADay,
    this.notes = "",
    this.shouldNotify = true,
  });

  Drug.from(Drug other)
      : id = other.id,
        name = other.name,
        dosage = other.dosage,
        frequency = other.frequency,
        notes = other.notes,
        shouldNotify = other.shouldNotify;

  @override
  String toString() => name;
}
