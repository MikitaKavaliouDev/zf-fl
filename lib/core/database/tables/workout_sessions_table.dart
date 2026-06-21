import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local SQLite table mirroring the backend WorkoutSession model.
@DataClassName('WorkoutSessionEntity')
class WorkoutSessionsTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get clientId => text()();
  TextColumn get name => text().nullable()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('IN_PROGRESS'))();
  TextColumn get notes => text().nullable()();
  IntColumn get restStartedAt => integer().nullable()();
  TextColumn get workoutTemplateId => text().nullable()();
  IntColumn get plannedDate => integer().nullable()();
  TextColumn get clientPackageId => text().nullable()();
  BoolColumn get isTrainerLed =>
      boolean().withDefault(const Constant(false))();
  IntColumn get reminderTime => integer().nullable()();
  BoolColumn get trainerReminderSent =>
      boolean().withDefault(const Constant(false))();
  TextColumn get trainerNotes => text().nullable()();
  IntColumn get trainerNotesUpdatedAt => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
