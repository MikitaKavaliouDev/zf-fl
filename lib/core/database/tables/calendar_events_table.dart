import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for calendar events (trainer-hosted events).
///
/// NOTE: This table has no [deletedAt] column, matching the backend Event model.
@DataClassName('CalendarEventEntity')
class CalendarEvents extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get trainerId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
  TextColumn get locationName => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get city => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get price => text()();
  TextColumn get currency => text().clientDefault(() => 'PLN')();
  IntColumn get capacity => integer().clientDefault(() => 20)();
  IntColumn get enrolledCount => integer().clientDefault(() => 0)();
  TextColumn get category => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  BoolColumn get isPromoted => boolean().clientDefault(() => false)();
  TextColumn get status => text().clientDefault(() => 'PENDING')();
  TextColumn get rejectionReason => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
