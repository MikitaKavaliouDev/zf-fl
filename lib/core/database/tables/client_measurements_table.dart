import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for client measurements (weight, body fat, etc.).
@DataClassName('ClientMeasurementEntity')
class ClientMeasurements extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get clientId => text()();
  IntColumn get measurementDate => integer()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get bodyFatPercentage => real().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get customMetrics => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
