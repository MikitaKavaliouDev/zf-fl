import 'package:drift/drift.dart';

@DataClassName('TrainerProfile')
class TrainerProfilesTable extends Table {
  @override
  String get tableName => 'trainer_profiles';

  TextColumn get id => text().withLength(min: 1, max: 64)();
  TextColumn get trainerId => text().withLength(min: 1, max: 64)();
  TextColumn get name => text().nullable()();
  TextColumn get bio => text().nullable()();
  TextColumn get profilePhotoPath => text().nullable()();
  TextColumn get location => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get averageRating => real().nullable()();
  TextColumn get businessCurrency => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  // Sync columns
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  IntColumn get syncModifiedAt => integer().nullable()();
  IntColumn? get deletedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
