// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Individual extends DataClass implements Insertable<Individual> {
  final int id;
  final String name;
  final String surname;
  final bool isMale;
  final DateTime registration;
  Individual(
      {@required this.id,
      @required this.name,
      @required this.surname,
      @required this.isMale,
      @required this.registration});
  factory Individual.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Individual(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      surname:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}surname']),
      isMale:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_male']),
      registration: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}registration']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    if (!nullToAbsent || isMale != null) {
      map['is_male'] = Variable<bool>(isMale);
    }
    if (!nullToAbsent || registration != null) {
      map['registration'] = Variable<DateTime>(registration);
    }
    return map;
  }

  IndividualsCompanion toCompanion(bool nullToAbsent) {
    return IndividualsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
      isMale:
          isMale == null && nullToAbsent ? const Value.absent() : Value(isMale),
      registration: registration == null && nullToAbsent
          ? const Value.absent()
          : Value(registration),
    );
  }

  factory Individual.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Individual(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
      isMale: serializer.fromJson<bool>(json['isMale']),
      registration: serializer.fromJson<DateTime>(json['registration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
      'isMale': serializer.toJson<bool>(isMale),
      'registration': serializer.toJson<DateTime>(registration),
    };
  }

  Individual copyWith(
          {int id,
          String name,
          String surname,
          bool isMale,
          DateTime registration}) =>
      Individual(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        isMale: isMale ?? this.isMale,
        registration: registration ?? this.registration,
      );
  @override
  String toString() {
    return (StringBuffer('Individual(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('isMale: $isMale, ')
          ..write('registration: $registration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(surname.hashCode,
              $mrjc(isMale.hashCode, registration.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Individual &&
          other.id == this.id &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.isMale == this.isMale &&
          other.registration == this.registration);
}

class IndividualsCompanion extends UpdateCompanion<Individual> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> surname;
  final Value<bool> isMale;
  final Value<DateTime> registration;
  const IndividualsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.isMale = const Value.absent(),
    this.registration = const Value.absent(),
  });
  IndividualsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String surname,
    @required bool isMale,
    @required DateTime registration,
  })  : name = Value(name),
        surname = Value(surname),
        isMale = Value(isMale),
        registration = Value(registration);
  static Insertable<Individual> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> surname,
    Expression<bool> isMale,
    Expression<DateTime> registration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (isMale != null) 'is_male': isMale,
      if (registration != null) 'registration': registration,
    });
  }

  IndividualsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> surname,
      Value<bool> isMale,
      Value<DateTime> registration}) {
    return IndividualsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      isMale: isMale ?? this.isMale,
      registration: registration ?? this.registration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (isMale.present) {
      map['is_male'] = Variable<bool>(isMale.value);
    }
    if (registration.present) {
      map['registration'] = Variable<DateTime>(registration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndividualsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('isMale: $isMale, ')
          ..write('registration: $registration')
          ..write(')'))
        .toString();
  }
}

class $IndividualsTable extends Individuals
    with TableInfo<$IndividualsTable, Individual> {
  final GeneratedDatabase _db;
  final String _alias;
  $IndividualsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _surnameMeta = const VerificationMeta('surname');
  GeneratedTextColumn _surname;
  @override
  GeneratedTextColumn get surname => _surname ??= _constructSurname();
  GeneratedTextColumn _constructSurname() {
    return GeneratedTextColumn('surname', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _isMaleMeta = const VerificationMeta('isMale');
  GeneratedBoolColumn _isMale;
  @override
  GeneratedBoolColumn get isMale => _isMale ??= _constructIsMale();
  GeneratedBoolColumn _constructIsMale() {
    return GeneratedBoolColumn(
      'is_male',
      $tableName,
      false,
    );
  }

  final VerificationMeta _registrationMeta =
      const VerificationMeta('registration');
  GeneratedDateTimeColumn _registration;
  @override
  GeneratedDateTimeColumn get registration =>
      _registration ??= _constructRegistration();
  GeneratedDateTimeColumn _constructRegistration() {
    return GeneratedDateTimeColumn(
      'registration',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, surname, isMale, registration];
  @override
  $IndividualsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'individuals';
  @override
  final String actualTableName = 'individuals';
  @override
  VerificationContext validateIntegrity(Insertable<Individual> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname'], _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    if (data.containsKey('is_male')) {
      context.handle(_isMaleMeta,
          isMale.isAcceptableOrUnknown(data['is_male'], _isMaleMeta));
    } else if (isInserting) {
      context.missing(_isMaleMeta);
    }
    if (data.containsKey('registration')) {
      context.handle(
          _registrationMeta,
          registration.isAcceptableOrUnknown(
              data['registration'], _registrationMeta));
    } else if (isInserting) {
      context.missing(_registrationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Individual map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Individual.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $IndividualsTable createAlias(String alias) {
    return $IndividualsTable(_db, alias);
  }
}

class IndividualsDetail extends DataClass
    implements Insertable<IndividualsDetail> {
  final int idPrimary;
  final DateTime appointment;
  final int individualsId;
  final String diagnosis;
  final String treatment;
  final String bloodPressure;
  final int pulse;
  final int bodyTemperature;
  final int respirationRate;
  final int weight;
  IndividualsDetail(
      {@required this.idPrimary,
      @required this.appointment,
      this.individualsId,
      this.diagnosis,
      this.treatment,
      this.bloodPressure,
      this.pulse,
      this.bodyTemperature,
      this.respirationRate,
      this.weight});
  factory IndividualsDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return IndividualsDetail(
      idPrimary:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_primary']),
      appointment: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}appointment']),
      individualsId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}individuals_id']),
      diagnosis: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}diagnosis']),
      treatment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}treatment']),
      bloodPressure: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}blood_pressure']),
      pulse: intType.mapFromDatabaseResponse(data['${effectivePrefix}pulse']),
      bodyTemperature: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}body_temperature']),
      respirationRate: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}respiration_rate']),
      weight: intType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idPrimary != null) {
      map['id_primary'] = Variable<int>(idPrimary);
    }
    if (!nullToAbsent || appointment != null) {
      map['appointment'] = Variable<DateTime>(appointment);
    }
    if (!nullToAbsent || individualsId != null) {
      map['individuals_id'] = Variable<int>(individualsId);
    }
    if (!nullToAbsent || diagnosis != null) {
      map['diagnosis'] = Variable<String>(diagnosis);
    }
    if (!nullToAbsent || treatment != null) {
      map['treatment'] = Variable<String>(treatment);
    }
    if (!nullToAbsent || bloodPressure != null) {
      map['blood_pressure'] = Variable<String>(bloodPressure);
    }
    if (!nullToAbsent || pulse != null) {
      map['pulse'] = Variable<int>(pulse);
    }
    if (!nullToAbsent || bodyTemperature != null) {
      map['body_temperature'] = Variable<int>(bodyTemperature);
    }
    if (!nullToAbsent || respirationRate != null) {
      map['respiration_rate'] = Variable<int>(respirationRate);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    return map;
  }

  IndividualsDetailsCompanion toCompanion(bool nullToAbsent) {
    return IndividualsDetailsCompanion(
      idPrimary: idPrimary == null && nullToAbsent
          ? const Value.absent()
          : Value(idPrimary),
      appointment: appointment == null && nullToAbsent
          ? const Value.absent()
          : Value(appointment),
      individualsId: individualsId == null && nullToAbsent
          ? const Value.absent()
          : Value(individualsId),
      diagnosis: diagnosis == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosis),
      treatment: treatment == null && nullToAbsent
          ? const Value.absent()
          : Value(treatment),
      bloodPressure: bloodPressure == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressure),
      pulse:
          pulse == null && nullToAbsent ? const Value.absent() : Value(pulse),
      bodyTemperature: bodyTemperature == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyTemperature),
      respirationRate: respirationRate == null && nullToAbsent
          ? const Value.absent()
          : Value(respirationRate),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
    );
  }

  factory IndividualsDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return IndividualsDetail(
      idPrimary: serializer.fromJson<int>(json['idPrimary']),
      appointment: serializer.fromJson<DateTime>(json['appointment']),
      individualsId: serializer.fromJson<int>(json['individualsId']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      treatment: serializer.fromJson<String>(json['treatment']),
      bloodPressure: serializer.fromJson<String>(json['bloodPressure']),
      pulse: serializer.fromJson<int>(json['pulse']),
      bodyTemperature: serializer.fromJson<int>(json['bodyTemperature']),
      respirationRate: serializer.fromJson<int>(json['respirationRate']),
      weight: serializer.fromJson<int>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPrimary': serializer.toJson<int>(idPrimary),
      'appointment': serializer.toJson<DateTime>(appointment),
      'individualsId': serializer.toJson<int>(individualsId),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'treatment': serializer.toJson<String>(treatment),
      'bloodPressure': serializer.toJson<String>(bloodPressure),
      'pulse': serializer.toJson<int>(pulse),
      'bodyTemperature': serializer.toJson<int>(bodyTemperature),
      'respirationRate': serializer.toJson<int>(respirationRate),
      'weight': serializer.toJson<int>(weight),
    };
  }

  IndividualsDetail copyWith(
          {int idPrimary,
          DateTime appointment,
          int individualsId,
          String diagnosis,
          String treatment,
          String bloodPressure,
          int pulse,
          int bodyTemperature,
          int respirationRate,
          int weight}) =>
      IndividualsDetail(
        idPrimary: idPrimary ?? this.idPrimary,
        appointment: appointment ?? this.appointment,
        individualsId: individualsId ?? this.individualsId,
        diagnosis: diagnosis ?? this.diagnosis,
        treatment: treatment ?? this.treatment,
        bloodPressure: bloodPressure ?? this.bloodPressure,
        pulse: pulse ?? this.pulse,
        bodyTemperature: bodyTemperature ?? this.bodyTemperature,
        respirationRate: respirationRate ?? this.respirationRate,
        weight: weight ?? this.weight,
      );
  @override
  String toString() {
    return (StringBuffer('IndividualsDetail(')
          ..write('idPrimary: $idPrimary, ')
          ..write('appointment: $appointment, ')
          ..write('individualsId: $individualsId, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('treatment: $treatment, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('pulse: $pulse, ')
          ..write('bodyTemperature: $bodyTemperature, ')
          ..write('respirationRate: $respirationRate, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      idPrimary.hashCode,
      $mrjc(
          appointment.hashCode,
          $mrjc(
              individualsId.hashCode,
              $mrjc(
                  diagnosis.hashCode,
                  $mrjc(
                      treatment.hashCode,
                      $mrjc(
                          bloodPressure.hashCode,
                          $mrjc(
                              pulse.hashCode,
                              $mrjc(
                                  bodyTemperature.hashCode,
                                  $mrjc(respirationRate.hashCode,
                                      weight.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is IndividualsDetail &&
          other.idPrimary == this.idPrimary &&
          other.appointment == this.appointment &&
          other.individualsId == this.individualsId &&
          other.diagnosis == this.diagnosis &&
          other.treatment == this.treatment &&
          other.bloodPressure == this.bloodPressure &&
          other.pulse == this.pulse &&
          other.bodyTemperature == this.bodyTemperature &&
          other.respirationRate == this.respirationRate &&
          other.weight == this.weight);
}

class IndividualsDetailsCompanion extends UpdateCompanion<IndividualsDetail> {
  final Value<int> idPrimary;
  final Value<DateTime> appointment;
  final Value<int> individualsId;
  final Value<String> diagnosis;
  final Value<String> treatment;
  final Value<String> bloodPressure;
  final Value<int> pulse;
  final Value<int> bodyTemperature;
  final Value<int> respirationRate;
  final Value<int> weight;
  const IndividualsDetailsCompanion({
    this.idPrimary = const Value.absent(),
    this.appointment = const Value.absent(),
    this.individualsId = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.treatment = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.pulse = const Value.absent(),
    this.bodyTemperature = const Value.absent(),
    this.respirationRate = const Value.absent(),
    this.weight = const Value.absent(),
  });
  IndividualsDetailsCompanion.insert({
    this.idPrimary = const Value.absent(),
    @required DateTime appointment,
    this.individualsId = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.treatment = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.pulse = const Value.absent(),
    this.bodyTemperature = const Value.absent(),
    this.respirationRate = const Value.absent(),
    this.weight = const Value.absent(),
  }) : appointment = Value(appointment);
  static Insertable<IndividualsDetail> custom({
    Expression<int> idPrimary,
    Expression<DateTime> appointment,
    Expression<int> individualsId,
    Expression<String> diagnosis,
    Expression<String> treatment,
    Expression<String> bloodPressure,
    Expression<int> pulse,
    Expression<int> bodyTemperature,
    Expression<int> respirationRate,
    Expression<int> weight,
  }) {
    return RawValuesInsertable({
      if (idPrimary != null) 'id_primary': idPrimary,
      if (appointment != null) 'appointment': appointment,
      if (individualsId != null) 'individuals_id': individualsId,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (treatment != null) 'treatment': treatment,
      if (bloodPressure != null) 'blood_pressure': bloodPressure,
      if (pulse != null) 'pulse': pulse,
      if (bodyTemperature != null) 'body_temperature': bodyTemperature,
      if (respirationRate != null) 'respiration_rate': respirationRate,
      if (weight != null) 'weight': weight,
    });
  }

  IndividualsDetailsCompanion copyWith(
      {Value<int> idPrimary,
      Value<DateTime> appointment,
      Value<int> individualsId,
      Value<String> diagnosis,
      Value<String> treatment,
      Value<String> bloodPressure,
      Value<int> pulse,
      Value<int> bodyTemperature,
      Value<int> respirationRate,
      Value<int> weight}) {
    return IndividualsDetailsCompanion(
      idPrimary: idPrimary ?? this.idPrimary,
      appointment: appointment ?? this.appointment,
      individualsId: individualsId ?? this.individualsId,
      diagnosis: diagnosis ?? this.diagnosis,
      treatment: treatment ?? this.treatment,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      pulse: pulse ?? this.pulse,
      bodyTemperature: bodyTemperature ?? this.bodyTemperature,
      respirationRate: respirationRate ?? this.respirationRate,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPrimary.present) {
      map['id_primary'] = Variable<int>(idPrimary.value);
    }
    if (appointment.present) {
      map['appointment'] = Variable<DateTime>(appointment.value);
    }
    if (individualsId.present) {
      map['individuals_id'] = Variable<int>(individualsId.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (treatment.present) {
      map['treatment'] = Variable<String>(treatment.value);
    }
    if (bloodPressure.present) {
      map['blood_pressure'] = Variable<String>(bloodPressure.value);
    }
    if (pulse.present) {
      map['pulse'] = Variable<int>(pulse.value);
    }
    if (bodyTemperature.present) {
      map['body_temperature'] = Variable<int>(bodyTemperature.value);
    }
    if (respirationRate.present) {
      map['respiration_rate'] = Variable<int>(respirationRate.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndividualsDetailsCompanion(')
          ..write('idPrimary: $idPrimary, ')
          ..write('appointment: $appointment, ')
          ..write('individualsId: $individualsId, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('treatment: $treatment, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('pulse: $pulse, ')
          ..write('bodyTemperature: $bodyTemperature, ')
          ..write('respirationRate: $respirationRate, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $IndividualsDetailsTable extends IndividualsDetails
    with TableInfo<$IndividualsDetailsTable, IndividualsDetail> {
  final GeneratedDatabase _db;
  final String _alias;
  $IndividualsDetailsTable(this._db, [this._alias]);
  final VerificationMeta _idPrimaryMeta = const VerificationMeta('idPrimary');
  GeneratedIntColumn _idPrimary;
  @override
  GeneratedIntColumn get idPrimary => _idPrimary ??= _constructIdPrimary();
  GeneratedIntColumn _constructIdPrimary() {
    return GeneratedIntColumn('id_primary', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _appointmentMeta =
      const VerificationMeta('appointment');
  GeneratedDateTimeColumn _appointment;
  @override
  GeneratedDateTimeColumn get appointment =>
      _appointment ??= _constructAppointment();
  GeneratedDateTimeColumn _constructAppointment() {
    return GeneratedDateTimeColumn(
      'appointment',
      $tableName,
      false,
    );
  }

  final VerificationMeta _individualsIdMeta =
      const VerificationMeta('individualsId');
  GeneratedIntColumn _individualsId;
  @override
  GeneratedIntColumn get individualsId =>
      _individualsId ??= _constructIndividualsId();
  GeneratedIntColumn _constructIndividualsId() {
    return GeneratedIntColumn('individuals_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES individuals(id)');
  }

  final VerificationMeta _diagnosisMeta = const VerificationMeta('diagnosis');
  GeneratedTextColumn _diagnosis;
  @override
  GeneratedTextColumn get diagnosis => _diagnosis ??= _constructDiagnosis();
  GeneratedTextColumn _constructDiagnosis() {
    return GeneratedTextColumn(
      'diagnosis',
      $tableName,
      true,
    );
  }

  final VerificationMeta _treatmentMeta = const VerificationMeta('treatment');
  GeneratedTextColumn _treatment;
  @override
  GeneratedTextColumn get treatment => _treatment ??= _constructTreatment();
  GeneratedTextColumn _constructTreatment() {
    return GeneratedTextColumn(
      'treatment',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bloodPressureMeta =
      const VerificationMeta('bloodPressure');
  GeneratedTextColumn _bloodPressure;
  @override
  GeneratedTextColumn get bloodPressure =>
      _bloodPressure ??= _constructBloodPressure();
  GeneratedTextColumn _constructBloodPressure() {
    return GeneratedTextColumn(
      'blood_pressure',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pulseMeta = const VerificationMeta('pulse');
  GeneratedIntColumn _pulse;
  @override
  GeneratedIntColumn get pulse => _pulse ??= _constructPulse();
  GeneratedIntColumn _constructPulse() {
    return GeneratedIntColumn(
      'pulse',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bodyTemperatureMeta =
      const VerificationMeta('bodyTemperature');
  GeneratedIntColumn _bodyTemperature;
  @override
  GeneratedIntColumn get bodyTemperature =>
      _bodyTemperature ??= _constructBodyTemperature();
  GeneratedIntColumn _constructBodyTemperature() {
    return GeneratedIntColumn(
      'body_temperature',
      $tableName,
      true,
    );
  }

  final VerificationMeta _respirationRateMeta =
      const VerificationMeta('respirationRate');
  GeneratedIntColumn _respirationRate;
  @override
  GeneratedIntColumn get respirationRate =>
      _respirationRate ??= _constructRespirationRate();
  GeneratedIntColumn _constructRespirationRate() {
    return GeneratedIntColumn(
      'respiration_rate',
      $tableName,
      true,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedIntColumn _weight;
  @override
  GeneratedIntColumn get weight => _weight ??= _constructWeight();
  GeneratedIntColumn _constructWeight() {
    return GeneratedIntColumn(
      'weight',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        idPrimary,
        appointment,
        individualsId,
        diagnosis,
        treatment,
        bloodPressure,
        pulse,
        bodyTemperature,
        respirationRate,
        weight
      ];
  @override
  $IndividualsDetailsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'individuals_details';
  @override
  final String actualTableName = 'individuals_details';
  @override
  VerificationContext validateIntegrity(Insertable<IndividualsDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_primary')) {
      context.handle(_idPrimaryMeta,
          idPrimary.isAcceptableOrUnknown(data['id_primary'], _idPrimaryMeta));
    }
    if (data.containsKey('appointment')) {
      context.handle(
          _appointmentMeta,
          appointment.isAcceptableOrUnknown(
              data['appointment'], _appointmentMeta));
    } else if (isInserting) {
      context.missing(_appointmentMeta);
    }
    if (data.containsKey('individuals_id')) {
      context.handle(
          _individualsIdMeta,
          individualsId.isAcceptableOrUnknown(
              data['individuals_id'], _individualsIdMeta));
    }
    if (data.containsKey('diagnosis')) {
      context.handle(_diagnosisMeta,
          diagnosis.isAcceptableOrUnknown(data['diagnosis'], _diagnosisMeta));
    }
    if (data.containsKey('treatment')) {
      context.handle(_treatmentMeta,
          treatment.isAcceptableOrUnknown(data['treatment'], _treatmentMeta));
    }
    if (data.containsKey('blood_pressure')) {
      context.handle(
          _bloodPressureMeta,
          bloodPressure.isAcceptableOrUnknown(
              data['blood_pressure'], _bloodPressureMeta));
    }
    if (data.containsKey('pulse')) {
      context.handle(
          _pulseMeta, pulse.isAcceptableOrUnknown(data['pulse'], _pulseMeta));
    }
    if (data.containsKey('body_temperature')) {
      context.handle(
          _bodyTemperatureMeta,
          bodyTemperature.isAcceptableOrUnknown(
              data['body_temperature'], _bodyTemperatureMeta));
    }
    if (data.containsKey('respiration_rate')) {
      context.handle(
          _respirationRateMeta,
          respirationRate.isAcceptableOrUnknown(
              data['respiration_rate'], _respirationRateMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPrimary};
  @override
  IndividualsDetail map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return IndividualsDetail.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $IndividualsDetailsTable createAlias(String alias) {
    return $IndividualsDetailsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $IndividualsTable _individuals;
  $IndividualsTable get individuals => _individuals ??= $IndividualsTable(this);
  $IndividualsDetailsTable _individualsDetails;
  $IndividualsDetailsTable get individualsDetails =>
      _individualsDetails ??= $IndividualsDetailsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [individuals, individualsDetails];
}
