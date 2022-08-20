class PersonRecord {
  final DateTime appointment;
  final int? individualsId;
  final String? diagnosis;
  final String? treatment;
  final int? pulse;
  final String? bloodPressure;
  final int? respirationRate;
  final int? bodyTemperature;
  final int? weight;

  PersonRecord(
      {required this.appointment,
      this.individualsId,
      this.diagnosis,
      this.treatment,
      this.bloodPressure,
      this.bodyTemperature,
      this.pulse,
      this.respirationRate,
      this.weight});
}
