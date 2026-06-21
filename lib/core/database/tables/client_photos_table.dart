import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';



/// Drift table definition for client progress photos.
@DataClassName('ClientPhotoEntity')
class ClientPhotos extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get clientId => text()();
  IntColumn get photoDate => integer()();
  TextColumn get imagePath => text()();
  TextColumn get caption => text().nullable()();
  TextColumn get checkInId => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();

  @override
  Set<Column> get primaryKey => {id};
}
