import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local storage for booking records synced from the backend.
@DataClassName('BookingEntity')
class BookingTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
  TextColumn get status =>
      text().withDefault(const Constant('PENDING'))();
  BoolColumn? get dataSharingApproved =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn? get dataSharingApprovedAt => integer().nullable()();
  TextColumn get trainerId => text()();
  TextColumn? get clientId => text().nullable()();
  TextColumn? get clientName => text().nullable()();
  TextColumn? get clientEmail => text().nullable()();
  TextColumn? get clientNotes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn? get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
