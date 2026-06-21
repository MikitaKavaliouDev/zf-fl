import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../data/sync_api_service.dart';

/// Orchestrates pull-then-push sync against the backend.
///
/// Phase 3 MVP: pulls changes from server and stores them as pending JSON
/// in SyncMetadata for later per-table processing. Push collects local
/// pending changes and sends to backend.
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

    // Step 2: Store pulled changes as pending JSON for per-table processing
    await _storePullResult(changes);

    // Step 3: Push local pending changes to server (empty in MVP)
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

    return serverTimestamp;
  }

  Future<void> _storePullResult(Map<String, dynamic> changes) async {
    final encoded = jsonEncode(changes);
    await _db.into(_db.syncMetadata).insertOnConflictUpdate(
          SyncMetadataCompanion(
            key: const Value('last_pull_data'),
            value: Value(encoded),
          ),
        );
  }

  /// Collects locally created/updated/deleted rows that haven't been synced.
  /// Phase 3 MVP: always returns empty (no push until per-table queries are implemented).
  Future<Map<String, dynamic>> _collectPendingChanges() async {
    // TODO: Per-table pending change collection from Drift tables
    return {};
  }
}
