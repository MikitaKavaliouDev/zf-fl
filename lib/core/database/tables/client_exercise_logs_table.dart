import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for client exercise logs (per-set tracking).
@DataClassName('ClientExerciseLogEntity')
class ClientExerciseLogs extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get clientId => text()();
  TextColumn get exerciseId => text()();
  IntColumn get reps => integer().nullable()();
  RealColumn get weight => real().nullable()();
  BoolColumn get isCompleted => boolean().nullable()();
  IntColumn get order => integer().nullable()();
  TextColumn get tempo => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get videoUrl => text().nullable()();
  TextColumn get side => text().clientDefault(() => 'BOTH')();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get workoutSessionId => text()();
  TextColumn get supersetKey => text().nullable()();
  IntColumn get orderInSuperset => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
