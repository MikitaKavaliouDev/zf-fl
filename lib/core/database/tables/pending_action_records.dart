import 'package:drift/drift.dart';

/// Tracks the intended sync action for each pending local row.
///
/// When a local mutation marks a row as pending, an entry is inserted
/// here with the action (`create`, `update`, or `delete`). The sync
/// engine reads this table during the push phase to correctly classify
/// pending rows — replacing the fragile `createdAt == updatedAt`
/// timestamp heuristic.
///
/// Entries are cleaned up after a successful push.
@DataClassName('PendingActionRecord')
class PendingActionRecords extends Table {
  TextColumn get id => text()();

  /// The wire-level sync table name (e.g. `'workout_sessions'`).
  TextColumn get sourceTable => text()();

  /// One of `'create'`, `'update'`, or `'delete'`.
  TextColumn get action => text()();

  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id, sourceTable};
}
