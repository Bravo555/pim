// TODO check what adapter we should use in data repository or scrap that
// @DataRepository([ConfigureRepositoryLocalStorage], remote: false)

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

  @override
  String toString() => name;
}
