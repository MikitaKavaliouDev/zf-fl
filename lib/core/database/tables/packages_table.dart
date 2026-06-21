import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local storage for trainer package records synced from the backend.
@DataClassName('PackageEntity')
class PackageTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text()();
  TextColumn? get description => text().nullable()();
  TextColumn get price => text()();
  IntColumn get numberOfSessions => integer()();
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();
  TextColumn get stripeProductId => text()();
  TextColumn get stripePriceId => text()();
  TextColumn get trainerId => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn? get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
