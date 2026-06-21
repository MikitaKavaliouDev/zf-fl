import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for workout templates.
@DataClassName('WorkoutTemplateEntity')
class WorkoutTemplates extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get programId => text()();
  IntColumn get order => integer().clientDefault(() => 0)();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
