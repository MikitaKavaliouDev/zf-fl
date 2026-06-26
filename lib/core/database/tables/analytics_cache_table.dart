import 'package:drift/drift.dart';

/// Key-value cache for computed analytics data stored as JSON blobs.
///
/// Keys: 'analytics', 'progress', 'widgetConfig'
/// Values: JSON-serialised response DTOs
/// Used by [AnalyticsLocalService] for offline-first analytics loading.
class AnalyticsCache extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {key};
}
