import 'dart:developer' as developer;

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../data/sync_api_service.dart';

/// Orchestrates pull-then-push sync against the backend.
///
/// **Pull phase:** iterates each table's `{ created, updated, deleted }`
/// chunks from the wire and writes directly to the corresponding Drift
/// tables via raw SQL `INSERT OR REPLACE`. Wire delivers **snake_case**
/// keys which match Drift's SQL column naming (camelCase Dart getters →
/// snake_case SQL).
///
/// **Deleted rows** are soft-deleted via the `deleted_at` column.
///
/// **Local-only columns** (`sync_status`) are set to `'synced'` for
/// every row written during pull.
///
/// **Push phase:** collects locally created/updated/deleted rows
/// (identified by `syncStatus != 'synced'`) and sends them to the
/// backend.
@singleton
class SyncRepository {
  final SyncApiService _api;
  final AppDatabase _db;

  SyncRepository(this._api, this._db);

  /// Runs a full sync cycle: pull → store → push.
  /// Returns the new server timestamp.
  Future<int> sync(int lastPulledAt) async {
    // Step 1: Pull changes from server
    final pullResult = await _api.pull(lastPulledAt);
    final changes = pullResult['changes'] as Map<String, dynamic>;
    final serverTimestamp = pullResult['timestamp'] as int;

    // Step 2: Write pulled data to per-table Drift storage
    await _applyPullChanges(changes);

    // Step 3: Push local pending changes to server
    final pushChanges = await _collectPendingChanges();
    if (pushChanges.isNotEmpty) {
      await _api.push(pushChanges);
    }

    // Step 4: Update last sync timestamp
    await _db.into(_db.syncMetadata).insertOnConflictUpdate(
          SyncMetadataCompanion(
            key: const Value('last_sync_at'),
            value: Value(serverTimestamp.toString()),
          ),
        );

    // Step 5: Clear the stored pull data blob (no longer needed)
    await (_db.delete(_db.syncMetadata)..where((t) => t.key.equals('last_pull_data'))).go();

    return serverTimestamp;
  }

  /// Write pulled changes from all sync tables into Drift.
  ///
  /// Each wire entry is `{ tableName: { created: [...], updated: [...],
  /// deleted: [id1, id2, ...] } }`. Created + updated rows are
  /// inserted/upserted. Deleted IDs set `deleted_at` to current time.
  Future<void> _applyPullChanges(Map<String, dynamic> changes) async {
    await _db.transaction(() async {
      for (final tableEntry in changes.entries) {
        final wireTableName = tableEntry.key;
        final operations = tableEntry.value as Map<String, dynamic>;

        final driftTableName = _wireToDriftTableName(wireTableName);
        if (driftTableName == null) {
          developer.log(
            'SYNC: skipping unknown table "$wireTableName"',
            name: 'sync',
          );
          continue;
        }

        final created = (operations['created'] as List?) ?? [];
        final updated = (operations['updated'] as List?) ?? [];
        final deletedIds =
            ((operations['deleted'] as List?) ?? [])
                .map((e) => e.toString())
                .toList();

        // ── Created + updated → INSERT OR REPLACE ──
        final rows = [...created, ...updated];
        for (final row in rows) {
          final map = Map<String, dynamic>.from(row as Map);
          // Set local-only columns
          map['sync_status'] = 'synced';

          final columns = map.keys.join(', ');
          final placeholders = map.keys.map((_) => '?').join(', ');
          final values = map.values.toList();

          await _db.customStatement(
            'INSERT OR REPLACE INTO $driftTableName '
            '($columns) VALUES ($placeholders)',
            values,
          );
        }

        // ── Deleted → soft-delete via deleted_at ──
        if (deletedIds.isNotEmpty) {
          final now = DateTime.now().millisecondsSinceEpoch;
          for (final id in deletedIds) {
            await _db.customStatement(
              'UPDATE $driftTableName SET deleted_at = ?, '
              'sync_status = \'synced\' WHERE id = ?',
              [now, id],
            );
          }
        }

        if (rows.isNotEmpty || deletedIds.isNotEmpty) {
          developer.log(
            'SYNC: $wireTableName → ${rows.length} rows, '
            '${deletedIds.length} deleted',
            name: 'sync',
          );
        }
      }
    });
  }

  /// Maps wire sync table names to Drift SQL table names.
  ///
  /// Most match directly (Drift snake_cases the class name and strips
  /// the `Table` suffix), but some have different names on the wire.
  String? _wireToDriftTableName(String wireName) {
    return switch (wireName) {
      'trainer_services' => 'services',
      'trainer_packages' => 'package',
      'trainer_testimonials' => 'testimonial',
      'trainer_programs' => 'programs',
      'bookings' => 'booking',
      _ => wireName,
    };
  }

  /// Collects locally created/updated/deleted rows that haven't been
  /// synced (sync_status != 'synced').
  Future<Map<String, dynamic>> _collectPendingChanges() async {
    // Phase 3 MVP: always returns empty until push collection is
    // implemented per-table.
    return {};
  }
}
