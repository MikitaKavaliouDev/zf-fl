import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for trainer services.
@DataClassName('ServiceEntity')
class Services extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get profileId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get price => text().nullable()();
  TextColumn get currency => text().nullable()();
  IntColumn get duration => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
