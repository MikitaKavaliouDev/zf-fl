import 'dart:developer' as developer;

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/sync_converter.dart';
import '../../../core/database/sync_tables_registry.dart';
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
/// (identified by `syncStatus = 'pending'`) and sends them to the
/// backend. After push succeeds, pushed rows are marked `synced`.
@singleton
class SyncRepository {
  final SyncApiService _api;
  final AppDatabase _db;

  SyncRepository(this._api, this._db);

  /// Tables that have no `deleted_at` column in the local schema.
  /// The push phase skips soft-delete queries for these tables.
  static const _tablesWithoutDeletedAt = {'calendar_events'};

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
      // Mark all pushed rows as synced
      await _markPushedAsSynced(pushChanges);
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
        // Tables without deleted_at (e.g. calendar_events) get hard-deleted.
        if (deletedIds.isNotEmpty) {
          if (_tablesWithoutDeletedAt.contains(driftTableName)) {
            for (final id in deletedIds) {
              await _db.customStatement(
                'DELETE FROM "$driftTableName" WHERE id = ?',
                [id],
              );
            }
          } else {
            final now = DateTime.now().millisecondsSinceEpoch;
            for (final id in deletedIds) {
              await _db.customStatement(
                'UPDATE "$driftTableName" SET deleted_at = ?, '
                'sync_status = \'synced\' WHERE id = ?',
                [now, id],
              );
            }
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
  /// Tables whose Dart class ends with `Table` get a `_table` suffix in
  /// the SQL schema (e.g. `ClientsTable` → `clients_table`). Tables
  /// without the suffix match the wire name directly.
  String? _wireToDriftTableName(String wireName) {
    return switch (wireName) {
      'clients' => 'clients_table',
      'profiles' => 'profiles_table',
      'workout_sessions' => 'workout_sessions_table',
      'exercises' => 'exercises_table',
      'trainer_services' => 'services',
      'trainer_packages' => 'package_table',
      'trainer_testimonials' => 'testimonial_table',
      'trainer_programs' => 'programs',
      'bookings' => 'booking_table',
      // Tables whose wire name matches the Drift SQL table name directly.
      'workout_templates' => 'workout_templates',
      'client_assessments' => 'client_assessments',
      'client_measurements' => 'client_measurements',
      'client_photos' => 'client_photos',
      'client_exercise_logs' => 'client_exercise_logs',
      'notifications' => 'notifications',
      'trainer_profiles' => 'trainer_profiles',
      'calendar_events' => 'calendar_events',
      _ => null,
    };
  }

  /// Maps Drift SQL table names back to wire sync table names.
  ///
  /// This is the reverse of `_wireToDriftTableName`. Most names are
  /// identical on both sides; only mismatches need explicit mapping.
  // ignore: unused_element — public API helper for mutation sites
  String _driftToWireTableName(String driftName) {
    return switch (driftName) {
      'clients_table' => 'clients',
      'profiles_table' => 'profiles',
      'workout_sessions_table' => 'workout_sessions',
      'exercises_table' => 'exercises',
      'services' => 'trainer_services',
      'package_table' => 'trainer_packages',
      'testimonial_table' => 'trainer_testimonials',
      'programs' => 'trainer_programs',
      'booking_table' => 'bookings',
      _ => driftName,
    };
  }

  /// Collects locally created/updated/deleted rows that haven't been
  /// synced (sync_status = 'pending').
  ///
  /// Iterates all 17 sync tables, querying for:
  /// - Rows with `sync_status = 'pending' AND deleted_at IS NULL`
  ///   (rows created or updated locally, still active)
  /// - Rows with `sync_status = 'pending' AND deleted_at IS NOT NULL`
  ///   (rows soft-deleted locally, not yet synced)
  ///
  /// Returns a map keyed by wire table name, each containing:
  /// `{ created: [...], updated: [...], deleted: [id, ...] }`.
  ///
  /// **Action resolution order:**
  /// 1. Look up the row in `PendingActionRecords` for an explicit action.
  /// 2. If no record exists (legacy data), use the fallback heuristic:
  ///    `created_at == updated_at` → "created", otherwise "updated".
  ///
  /// **Internal columns** (`sync_status`) are stripped from the payload.
  Future<Map<String, dynamic>> _collectPendingChanges() async {
    final result = <String, dynamic>{};

    for (final wireName in SyncTables.all) {
      final driftName = _wireToDriftTableName(wireName) ?? wireName;
      final hasDeletedAt = !_tablesWithoutDeletedAt.contains(driftName);

      // ── Query active pending rows (created or updated, not soft-deleted) ──
      final pendingQuery = hasDeletedAt
          ? 'SELECT * FROM "$driftName" WHERE sync_status = \'pending\' AND deleted_at IS NULL'
          : 'SELECT * FROM "$driftName" WHERE sync_status = \'pending\'';
      final pendingRows = await _db.customSelect(pendingQuery).get();

      // ── Query soft-deleted rows ──
      final deletedIds = <String>[];
      if (hasDeletedAt) {
        final deletedResult = await _db.customSelect(
          'SELECT id FROM "$driftName" WHERE sync_status = \'pending\' AND deleted_at IS NOT NULL',
        ).get();
        deletedIds.addAll(deletedResult.map((r) => r.data['id'] as String));
      }

      if (pendingRows.isEmpty && deletedIds.isEmpty) continue;

      // ── Load explicit actions from PendingActionRecords ──
      final pendingIds = <String>{
        for (final row in pendingRows) row.data['id'] as String,
      };

      final actionRecords = <String, String>{};
      if (pendingIds.isNotEmpty) {
        final records = await (_db.select(_db.pendingActionRecords)
          ..where((t) => t.sourceTable.equals(wireName))).get();
        for (final r in records) {
          if (pendingIds.contains(r.id)) {
            actionRecords[r.id] = r.action;
          }
        }
      }

      // ── Distinguish created vs updated ──
      final created = <Map<String, dynamic>>[];
      final updated = <Map<String, dynamic>>[];

      for (final row in pendingRows) {
        final map = Map<String, dynamic>.from(row.data);
        final rowId = map['id'] as String;

        // Remove internal sync columns — they don't belong in the payload
        map.remove('sync_status');

        // Convert keys to snake_case for the wire
        // (already snake_case from SQL, but this ensures consistency)
        final wireRow = SyncConverter.localToWire(map);

        // Resolve action: explicit record takes precedence
        final action = actionRecords[rowId];
        if (action == 'create') {
          created.add(wireRow);
        } else if (action == 'update') {
          updated.add(wireRow);
        } else if (action == null) {
          // Legacy fallback: timestamp heuristic
          final createdAt = map['created_at'] as int? ?? 0;
          final updatedAt = map['updated_at'] as int? ?? 0;
          if (createdAt == updatedAt) {
            created.add(wireRow);
          } else {
            updated.add(wireRow);
          }
        }
        // 'delete' action is handled separately via deletedIds
      }

      result[wireName] = {
        'created': created,
        'updated': updated,
        'deleted': deletedIds,
      };
    }

    return result;
  }

  /// Mark a local row as needing sync after a local mutation.
  ///
  /// [action] describes the intended sync operation: `'create'` for new
  /// local rows, `'update'` for modifications to existing rows, or
  /// `'delete'` for soft-deleted rows.
  Future<void> markPending(
    String wireTableName,
    String id, {
    String action = 'update',
  }) async {
    final driftName = _wireToDriftTableName(wireTableName) ?? wireTableName;
    final now = DateTime.now().millisecondsSinceEpoch;

    await _db.customStatement(
      'UPDATE "$driftName" SET sync_status = \'pending\', '
      'updated_at = ? WHERE id = ?',
      [now, id],
    );

    // Record the intended action in PendingActionRecords.
    await _db.into(_db.pendingActionRecords).insertOnConflictUpdate(
          PendingActionRecordsCompanion(
            id: Value(id),
            sourceTable: Value(wireTableName),
            action: Value(action),
            createdAt: Value(now),
          ),
        );
  }

  /// Mark a local row as synced after a successful direct API mutation.
  Future<void> markSynced(String wireTableName, String id) async {
    final driftName = _wireToDriftTableName(wireTableName) ?? wireTableName;
    await _db.customStatement(
      'UPDATE "$driftName" SET sync_status = \'synced\', '
      'updated_at = ? WHERE id = ?',
      [DateTime.now().millisecondsSinceEpoch, id],
    );

    // Clean up the pending action record.
    await (_db.delete(_db.pendingActionRecords)
      ..where((t) => t.id.equals(id))
      ..where((t) => t.sourceTable.equals(wireTableName))).go();
  }

  /// Mark ALL pending rows in a table as synced (post-push).
  Future<void> markAllSynced(String wireTableName) async {
    final driftName = _wireToDriftTableName(wireTableName) ?? wireTableName;
    await _db.customStatement(
      'UPDATE "$driftName" SET sync_status = \'synced\' WHERE sync_status = \'pending\'',
    );
  }

  /// After push succeeds, mark all pushed rows as synced and clean up
  /// their [PendingActionRecords].
  Future<void> _markPushedAsSynced(Map<String, dynamic> pushChanges) async {
    for (final wireName in pushChanges.keys) {
      final operations = pushChanges[wireName] as Map<String, dynamic>;
      final hadChanges = (operations['created'] as List).isNotEmpty ||
          (operations['updated'] as List).isNotEmpty ||
          (operations['deleted'] as List).isNotEmpty;
      if (!hadChanges) continue;

      final driftName = _wireToDriftTableName(wireName) ?? wireName;
      await _db.customStatement(
        'UPDATE "$driftName" SET sync_status = \'synced\' WHERE sync_status = \'pending\'',
      );

      // Clean up pending action records for this table.
      await (_db.delete(_db.pendingActionRecords)
        ..where((t) => t.sourceTable.equals(wireName))).go();
    }
  }
}
