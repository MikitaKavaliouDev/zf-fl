import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local SQLite table mirroring the backend Client model.
@DataClassName('ClientEntity')
class ClientsTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get trainerId => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get avatarPath => text().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('active'))();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get goals => text().nullable()();
  TextColumn get healthNotes => text().nullable()();
  TextColumn get emergencyContactName => text().nullable()();
  TextColumn get emergencyContactPhone => text().nullable()();
  IntColumn get checkInDay => integer().nullable()();
  IntColumn get checkInHour => integer().nullable()();
  DateTimeColumn get dataSharingExpiresAt => dateTime().nullable()();
  TextColumn get sharingSettings => text().nullable()();
  TextColumn get widgetConfig => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
