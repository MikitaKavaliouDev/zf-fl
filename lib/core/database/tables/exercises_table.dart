import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local SQLite table mirroring the backend Exercise model.
@DataClassName('ExerciseEntity')
class ExercisesTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text()();
  TextColumn get muscleGroup => text().nullable()();
  TextColumn get equipment => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get videoUrl => text().nullable()();
  TextColumn get createdById => text().nullable()();
  IntColumn get recommendedRestSeconds => integer().nullable()();
  BoolColumn get isUnilateral =>
      boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
