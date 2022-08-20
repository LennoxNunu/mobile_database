class Person {
  int id;
  String name;
  String surname;
  bool isMale;
  DateTime registration;

  Person(
      {required this.id,
      required this.name,
      required this.surname,
      required this.isMale,
      required this.registration});

  Person? copyWith(
      {bool? isMale, DateTime? registration, String? name, String? surname}) {
    return null;
  }
}
