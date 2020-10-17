import 'package:injectable/injectable.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'moor_database.g.dart';

// this will generate a table called "individuals" for us. The rows
// of that table will be represented by a class called "Individual".
class Individuals extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
  TextColumn get surname => text().withLength(min: 1, max: 20)();
  BoolColumn get isMale => boolean()();
  DateTimeColumn get registration => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// this will generate a table called "individualsDetails" for us.
// The rows of that table will be represented by a class called
//"IndividualsDetail".
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
    return VmDatabase(file, logStatements: true);
  });
}

// this annotation tells moor to prepare a database class
// that uses both of the tables we just defined.
@lazySingleton
@UseMoor(tables: [Individuals, IndividualsDetails])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(beforeOpen: (details) async {
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
  Future insertIndividuals(Individual individual) =>
      into(individuals).insert(individual);
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
  Future insertIndividualsDetails(IndividualsDetail individualsdetail) =>
      into(individualsDetails).insert(individualsdetail);
  Future updateIndividualsDetails(IndividualsDetail individualsdetail) =>
      update(individualsDetails).replace(individualsdetail);
  Future deleteIndividualsDetails(IndividualsDetail individualsdetail) =>
      delete(individualsDetails).delete(individualsdetail);
}
