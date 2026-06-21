import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for in-app notifications.
@DataClassName('NotificationEntity')
class Notifications extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get message => text()();
  TextColumn get type => text()();
  BoolColumn get readStatus => boolean().clientDefault(() => false)();
  TextColumn get metadata => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
