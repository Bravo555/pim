// TODO check what adapter we should use in data repository or scrap that
// @DataRepository([ConfigureRepositoryLocalStorage], remote: false)
class Drug {
  final int id;
  String name;
  String dosage;
  String frequency;
  String notes;
  bool shouldNotify;

  Drug({
    required this.id,
    required this.name,
    required this.dosage,
    this.frequency = "Once a day",
    this.notes = "",
    this.shouldNotify = false,
  });

  Drug.from(Drug other)
      : id = other.id,
        name = other.name,
        dosage = other.dosage,
        frequency = other.frequency,
        notes = other.notes,
        shouldNotify = other.shouldNotify;
}
