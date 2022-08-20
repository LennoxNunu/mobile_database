// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Individual extends DataClass implements Insertable<Individual> {
  final int id;
  final String name;
  final String surname;
  final bool isMale;
  final DateTime registration;
  Individual(
      {required this.id,
      required this.name,
      required this.surname,
      required this.isMale,
      required this.registration});
  factory Individual.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Individual(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      surname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}surname'])!,
      isMale: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_male'])!,
      registration: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}registration'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['surname'] = Variable<String>(surname);
    map['is_male'] = Variable<bool>(isMale);
    map['registration'] = Variable<DateTime>(registration);
    return map;
  }

  IndividualsCompanion toCompanion(bool nullToAbsent) {
    return IndividualsCompanion(
      id: Value(id),
      name: Value(name),
      surname: Value(surname),
      isMale: Value(isMale),
      registration: Value(registration),
    );
  }

  factory Individual.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Individual(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
      isMale: serializer.fromJson<bool>(json['isMale']),
      registration: serializer.fromJson<DateTime>(json['registration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
      'isMale': serializer.toJson<bool>(isMale),
      'registration': serializer.toJson<DateTime>(registration),
    };
  }

  Individual copyWith(
          {int? id,
          String? name,
          String? surname,
          bool? isMale,
          DateTime? registration}) =>
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
  int get hashCode => Object.hash(id, name, surname, isMale, registration);
  @override
  bool operator ==(Object other) =>
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
    required String name,
    required String surname,
    required bool isMale,
    required DateTime registration,
  })  : name = Value(name),
        surname = Value(surname),
        isMale = Value(isMale),
        registration = Value(registration);
  static Insertable<Individual> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<bool>? isMale,
    Expression<DateTime>? registration,
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
      {Value<int>? id,
      Value<String>? name,
      Value<String>? surname,
      Value<bool>? isMale,
      Value<DateTime>? registration}) {
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
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndividualsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _surnameMeta = const VerificationMeta('surname');
  @override
  late final GeneratedColumn<String?> surname = GeneratedColumn<String?>(
      'surname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _isMaleMeta = const VerificationMeta('isMale');
  @override
  late final GeneratedColumn<bool?> isMale = GeneratedColumn<bool?>(
      'is_male', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_male IN (0, 1))');
  final VerificationMeta _registrationMeta =
      const VerificationMeta('registration');
  @override
  late final GeneratedColumn<DateTime?> registration =
      GeneratedColumn<DateTime?>('registration', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, surname, isMale, registration];
  @override
  String get aliasedName => _alias ?? 'individuals';
  @override
  String get actualTableName => 'individuals';
  @override
  VerificationContext validateIntegrity(Insertable<Individual> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    if (data.containsKey('is_male')) {
      context.handle(_isMaleMeta,
          isMale.isAcceptableOrUnknown(data['is_male']!, _isMaleMeta));
    } else if (isInserting) {
      context.missing(_isMaleMeta);
    }
    if (data.containsKey('registration')) {
      context.handle(
          _registrationMeta,
          registration.isAcceptableOrUnknown(
              data['registration']!, _registrationMeta));
    } else if (isInserting) {
      context.missing(_registrationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Individual map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Individual.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IndividualsTable createAlias(String alias) {
    return $IndividualsTable(attachedDatabase, alias);
  }
}

class IndividualsDetail extends DataClass
    implements Insertable<IndividualsDetail> {
  final int idPrimary;
  final DateTime appointment;
  final int? individualsId;
  final String? diagnosis;
  final String? treatment;
  final String? bloodPressure;
  final int? pulse;
  final int? bodyTemperature;
  final int? respirationRate;
  final int? weight;
  IndividualsDetail(
      {required this.idPrimary,
      required this.appointment,
      this.individualsId,
      this.diagnosis,
      this.treatment,
      this.bloodPressure,
      this.pulse,
      this.bodyTemperature,
      this.respirationRate,
      this.weight});
  factory IndividualsDetail.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IndividualsDetail(
      idPrimary: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_primary'])!,
      appointment: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}appointment'])!,
      individualsId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}individuals_id']),
      diagnosis: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}diagnosis']),
      treatment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}treatment']),
      bloodPressure: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}blood_pressure']),
      pulse: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pulse']),
      bodyTemperature: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body_temperature']),
      respirationRate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}respiration_rate']),
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_primary'] = Variable<int>(idPrimary);
    map['appointment'] = Variable<DateTime>(appointment);
    if (!nullToAbsent || individualsId != null) {
      map['individuals_id'] = Variable<int?>(individualsId);
    }
    if (!nullToAbsent || diagnosis != null) {
      map['diagnosis'] = Variable<String?>(diagnosis);
    }
    if (!nullToAbsent || treatment != null) {
      map['treatment'] = Variable<String?>(treatment);
    }
    if (!nullToAbsent || bloodPressure != null) {
      map['blood_pressure'] = Variable<String?>(bloodPressure);
    }
    if (!nullToAbsent || pulse != null) {
      map['pulse'] = Variable<int?>(pulse);
    }
    if (!nullToAbsent || bodyTemperature != null) {
      map['body_temperature'] = Variable<int?>(bodyTemperature);
    }
    if (!nullToAbsent || respirationRate != null) {
      map['respiration_rate'] = Variable<int?>(respirationRate);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int?>(weight);
    }
    return map;
  }

  IndividualsDetailsCompanion toCompanion(bool nullToAbsent) {
    return IndividualsDetailsCompanion(
      idPrimary: Value(idPrimary),
      appointment: Value(appointment),
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
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IndividualsDetail(
      idPrimary: serializer.fromJson<int>(json['idPrimary']),
      appointment: serializer.fromJson<DateTime>(json['appointment']),
      individualsId: serializer.fromJson<int?>(json['individualsId']),
      diagnosis: serializer.fromJson<String?>(json['diagnosis']),
      treatment: serializer.fromJson<String?>(json['treatment']),
      bloodPressure: serializer.fromJson<String?>(json['bloodPressure']),
      pulse: serializer.fromJson<int?>(json['pulse']),
      bodyTemperature: serializer.fromJson<int?>(json['bodyTemperature']),
      respirationRate: serializer.fromJson<int?>(json['respirationRate']),
      weight: serializer.fromJson<int?>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPrimary': serializer.toJson<int>(idPrimary),
      'appointment': serializer.toJson<DateTime>(appointment),
      'individualsId': serializer.toJson<int?>(individualsId),
      'diagnosis': serializer.toJson<String?>(diagnosis),
      'treatment': serializer.toJson<String?>(treatment),
      'bloodPressure': serializer.toJson<String?>(bloodPressure),
      'pulse': serializer.toJson<int?>(pulse),
      'bodyTemperature': serializer.toJson<int?>(bodyTemperature),
      'respirationRate': serializer.toJson<int?>(respirationRate),
      'weight': serializer.toJson<int?>(weight),
    };
  }

  IndividualsDetail copyWith(
          {int? idPrimary,
          DateTime? appointment,
          int? individualsId,
          String? diagnosis,
          String? treatment,
          String? bloodPressure,
          int? pulse,
          int? bodyTemperature,
          int? respirationRate,
          int? weight}) =>
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
  int get hashCode => Object.hash(
      idPrimary,
      appointment,
      individualsId,
      diagnosis,
      treatment,
      bloodPressure,
      pulse,
      bodyTemperature,
      respirationRate,
      weight);
  @override
  bool operator ==(Object other) =>
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
  final Value<int?> individualsId;
  final Value<String?> diagnosis;
  final Value<String?> treatment;
  final Value<String?> bloodPressure;
  final Value<int?> pulse;
  final Value<int?> bodyTemperature;
  final Value<int?> respirationRate;
  final Value<int?> weight;
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
    required DateTime appointment,
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
    Expression<int>? idPrimary,
    Expression<DateTime>? appointment,
    Expression<int?>? individualsId,
    Expression<String?>? diagnosis,
    Expression<String?>? treatment,
    Expression<String?>? bloodPressure,
    Expression<int?>? pulse,
    Expression<int?>? bodyTemperature,
    Expression<int?>? respirationRate,
    Expression<int?>? weight,
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
      {Value<int>? idPrimary,
      Value<DateTime>? appointment,
      Value<int?>? individualsId,
      Value<String?>? diagnosis,
      Value<String?>? treatment,
      Value<String?>? bloodPressure,
      Value<int?>? pulse,
      Value<int?>? bodyTemperature,
      Value<int?>? respirationRate,
      Value<int?>? weight}) {
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
      map['individuals_id'] = Variable<int?>(individualsId.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String?>(diagnosis.value);
    }
    if (treatment.present) {
      map['treatment'] = Variable<String?>(treatment.value);
    }
    if (bloodPressure.present) {
      map['blood_pressure'] = Variable<String?>(bloodPressure.value);
    }
    if (pulse.present) {
      map['pulse'] = Variable<int?>(pulse.value);
    }
    if (bodyTemperature.present) {
      map['body_temperature'] = Variable<int?>(bodyTemperature.value);
    }
    if (respirationRate.present) {
      map['respiration_rate'] = Variable<int?>(respirationRate.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int?>(weight.value);
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
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndividualsDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idPrimaryMeta = const VerificationMeta('idPrimary');
  @override
  late final GeneratedColumn<int?> idPrimary = GeneratedColumn<int?>(
      'id_primary', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _appointmentMeta =
      const VerificationMeta('appointment');
  @override
  late final GeneratedColumn<DateTime?> appointment =
      GeneratedColumn<DateTime?>('appointment', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _individualsIdMeta =
      const VerificationMeta('individualsId');
  @override
  late final GeneratedColumn<int?> individualsId = GeneratedColumn<int?>(
      'individuals_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES individuals(id)');
  final VerificationMeta _diagnosisMeta = const VerificationMeta('diagnosis');
  @override
  late final GeneratedColumn<String?> diagnosis = GeneratedColumn<String?>(
      'diagnosis', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _treatmentMeta = const VerificationMeta('treatment');
  @override
  late final GeneratedColumn<String?> treatment = GeneratedColumn<String?>(
      'treatment', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _bloodPressureMeta =
      const VerificationMeta('bloodPressure');
  @override
  late final GeneratedColumn<String?> bloodPressure = GeneratedColumn<String?>(
      'blood_pressure', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _pulseMeta = const VerificationMeta('pulse');
  @override
  late final GeneratedColumn<int?> pulse = GeneratedColumn<int?>(
      'pulse', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _bodyTemperatureMeta =
      const VerificationMeta('bodyTemperature');
  @override
  late final GeneratedColumn<int?> bodyTemperature = GeneratedColumn<int?>(
      'body_temperature', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _respirationRateMeta =
      const VerificationMeta('respirationRate');
  @override
  late final GeneratedColumn<int?> respirationRate = GeneratedColumn<int?>(
      'respiration_rate', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
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
  String get aliasedName => _alias ?? 'individuals_details';
  @override
  String get actualTableName => 'individuals_details';
  @override
  VerificationContext validateIntegrity(Insertable<IndividualsDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_primary')) {
      context.handle(_idPrimaryMeta,
          idPrimary.isAcceptableOrUnknown(data['id_primary']!, _idPrimaryMeta));
    }
    if (data.containsKey('appointment')) {
      context.handle(
          _appointmentMeta,
          appointment.isAcceptableOrUnknown(
              data['appointment']!, _appointmentMeta));
    } else if (isInserting) {
      context.missing(_appointmentMeta);
    }
    if (data.containsKey('individuals_id')) {
      context.handle(
          _individualsIdMeta,
          individualsId.isAcceptableOrUnknown(
              data['individuals_id']!, _individualsIdMeta));
    }
    if (data.containsKey('diagnosis')) {
      context.handle(_diagnosisMeta,
          diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta));
    }
    if (data.containsKey('treatment')) {
      context.handle(_treatmentMeta,
          treatment.isAcceptableOrUnknown(data['treatment']!, _treatmentMeta));
    }
    if (data.containsKey('blood_pressure')) {
      context.handle(
          _bloodPressureMeta,
          bloodPressure.isAcceptableOrUnknown(
              data['blood_pressure']!, _bloodPressureMeta));
    }
    if (data.containsKey('pulse')) {
      context.handle(
          _pulseMeta, pulse.isAcceptableOrUnknown(data['pulse']!, _pulseMeta));
    }
    if (data.containsKey('body_temperature')) {
      context.handle(
          _bodyTemperatureMeta,
          bodyTemperature.isAcceptableOrUnknown(
              data['body_temperature']!, _bodyTemperatureMeta));
    }
    if (data.containsKey('respiration_rate')) {
      context.handle(
          _respirationRateMeta,
          respirationRate.isAcceptableOrUnknown(
              data['respiration_rate']!, _respirationRateMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPrimary};
  @override
  IndividualsDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return IndividualsDetail.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IndividualsDetailsTable createAlias(String alias) {
    return $IndividualsDetailsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $IndividualsTable individuals = $IndividualsTable(this);
  late final $IndividualsDetailsTable individualsDetails =
      $IndividualsDetailsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [individuals, individualsDetails];
}
