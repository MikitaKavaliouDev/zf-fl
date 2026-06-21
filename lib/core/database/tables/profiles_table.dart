import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local SQLite table mirroring the backend Profile model.
@DataClassName('ProfileEntity')
class ProfilesTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get certifications => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get aboutMe => text().nullable()();
  TextColumn get philosophy => text().nullable()();
  TextColumn get methodology => text().nullable()();
  TextColumn get branding => text().nullable()();
  TextColumn get bannerImagePath => text().nullable()();
  TextColumn get customDomain => text().nullable()();
  BoolColumn get domainVerified =>
      boolean().withDefault(const Constant(false))();
  TextColumn get profilePhotoPath => text().nullable()();
  TextColumn get specialties =>
      text().withDefault(const Constant('[]'))();
  TextColumn get trainingTypes =>
      text().withDefault(const Constant('[]'))();
  TextColumn get businessCurrency =>
      text().withDefault(const Constant('PLN'))();
  RealColumn get averageRating => real().nullable()();
  IntColumn get completionPercentage =>
      integer().withDefault(const Constant(0))();
  TextColumn get missingFields => text().nullable()();
  BoolColumn get isVerified =>
      boolean().withDefault(const Constant(false))();
  TextColumn get availability => text().nullable()();
  RealColumn get minServicePrice => real().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
