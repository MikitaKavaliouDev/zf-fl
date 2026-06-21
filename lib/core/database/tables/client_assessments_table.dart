import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for client assessment results.
@DataClassName('ClientAssessmentEntity')
class ClientAssessments extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get assessmentId => text()();
  TextColumn get clientId => text()();
  RealColumn get value => real()();
  IntColumn get date => integer()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
