import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Local storage for trainer testimonial records synced from the backend.
@DataClassName('TestimonialEntity')
class TestimonialTable extends Table {
  TextColumn get id =>
      text().clientDefault(() => const Uuid().v4())();
  TextColumn get profileId => text()();
  TextColumn get clientName => text()();
  TextColumn get testimonialText => text()();
  IntColumn? get rating => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn? get deletedAt => integer().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
