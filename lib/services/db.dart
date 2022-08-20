// import 'package:injectable/injectable.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:mobile_database/models/person.dart';
import 'dart:io';

import 'package:mobile_database/models/person_record.dart';

part 'db.g.dart';

class Individuals extends Table {
  // IntColumn get iddata => integer().autoIncrement()();
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
  TextColumn get surname => text().withLength(min: 1, max: 20)();
  BoolColumn get isMale => boolean()();
  DateTimeColumn get registration => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class IndividualsDetails extends Table {
  IntColumn get idPrimary => integer().autoIncrement()();
  DateTimeColumn get appointment => dateTime()();
  IntColumn get individualsId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES individuals(id)')();
  TextColumn get diagnosis => text().nullable()();
  TextColumn get treatment => text().nullable()();
  TextColumn get bloodPressure => text().nullable()();
  IntColumn get pulse => integer().nullable()();
  IntColumn get bodyTemperature => integer().nullable()();
  IntColumn get respirationRate => integer().nullable()();
  IntColumn get weight => integer().nullable()();
}

class IndividualsDetailWithIndividual {
  IndividualsDetailWithIndividual(this.individualsDetail, this.individual);

  final IndividualsDetail individualsDetail;
  final Individual individual;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right
  // location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [Individuals, IndividualsDetails])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, beforeOpen: (details) async {
        if (details.wasCreated) {
          // ...
        }
        await customStatement('PRAGMA foreign_keys = ON');
      });

//to find the profile that was updated
  Future<List<Individual>> getSingleIndividual(int searchId) =>
      (select(individuals)..where((tbl) => tbl.id.equals(searchId))).get();

// the following five methods are for the
// read,insert,update and delete for table individual
  Stream<List<Individual>> watchAllIndividuals() => select(individuals).watch();

  Future<void> insertIndividuals({required Person entry}) {
    return transaction(() async {
      // first, we save the ExamOrder
      var data = IndividualsCompanion(
          id: Value(entry.id),
          isMale: Value(entry.isMale),
          name: Value(entry.name),
          registration: Value(entry.registration),
          surname: Value(entry.surname));
      await into(individuals).insert(data);
    });
  }

  Future updateIndividuals(Individual individual) =>
      update(individuals).replace(individual);
  Future deleteIndividuals(Individual individual) =>
      delete(individuals).delete(individual);

//to find the file that was updated
  Future<List<IndividualsDetail>> getSingleIndividualsDetail(int searchId) =>
      (select(individualsDetails)
            ..where((tbl) => tbl.idPrimary.equals(searchId)))
          .get();

// the following four methods are for the
// read,insert,update and delete for table individualsDetail
  Future<List<IndividualsDetail>> getAllIndividualsDetails(int filterId) =>
      (select(individualsDetails)
            ..where((tbl) => tbl.individualsId.equals(filterId)))
          .get();

  Future<void> insertIndividualsDetails({required PersonRecord entry}) {
    return transaction(() async {
      var data = IndividualsDetailsCompanion(
          appointment: Value(entry.appointment),
          bloodPressure: Value(entry.bloodPressure),
          bodyTemperature: Value(entry.bodyTemperature),
          diagnosis: Value(entry.diagnosis),
          individualsId: Value(entry.individualsId),
          pulse: Value(entry.pulse),
          respirationRate: Value(entry.respirationRate),
          treatment: Value(entry.treatment),
          weight: Value(entry.weight));
      await into(individualsDetails).insert(data);
    });
  }

  Future updateIndividualsDetails(IndividualsDetail individualsdetail) =>
      update(individualsDetails).replace(individualsdetail);
  Future deleteIndividualsDetails(IndividualsDetail individualsdetail) =>
      delete(individualsDetails).delete(individualsdetail);
}
