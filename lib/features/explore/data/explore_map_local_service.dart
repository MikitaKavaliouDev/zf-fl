import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import 'package:ziro_fit/features/explore/data/models/explore_event_dto.dart';

/// Drift-backed local cache for explore map data.
///
/// Stores the last successfully fetched trainer list and event list as
/// JSON blobs in the [AnalyticsCache] table so the map renders instantly
/// on subsequent opens and works offline from previously viewed data.
///
/// Pattern mirrors [AnalyticsLocalService] exactly.
@singleton
class ExploreMapLocalService {
  final AppDatabase _db;

  ExploreMapLocalService(this._db);

  // ──────────────────────────────────────────────────────────────
  // Cache keys
  // ──────────────────────────────────────────────────────────────

  static const _keyTrainers = 'explore:map:trainers';
  static const _keyEvents = 'explore:map:events';
  static const _keyLocation = 'explore:map:location';

  // ──────────────────────────────────────────────────────────────
  // Trainer list cache
  // ──────────────────────────────────────────────────────────────

  /// Persist the raw trainer list from the API.
  Future<void> cacheTrainers(List<TrainerListItemDto> trainers) async {
    final json = trainers.map((t) => t.toJson()).toList();
    await _putList(_keyTrainers, json);
  }

  /// Read the last cached trainer list, or `null` if never cached.
  Future<List<TrainerListItemDto>?> cachedTrainers() async {
    final json = await _getList(_keyTrainers);
    if (json == null) return null;
    try {
      return json
          .map((j) => TrainerListItemDto.fromJson(j))
          .toList();
    } catch (e) {
      debugPrint(
          'ExploreMapLocalService: failed to parse cached trainers: $e');
      return null;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Event list cache
  // ──────────────────────────────────────────────────────────────

  /// Persist the raw event list from the API.
  Future<void> cacheEvents(List<ExploreEventDto> events) async {
    final json = events.map((e) => e.toJson()).toList();
    await _putList(_keyEvents, json);
  }

  /// Read the last cached event list, or `null` if never cached.
  Future<List<ExploreEventDto>?> cachedEvents() async {
    final json = await _getList(_keyEvents);
    if (json == null) return null;
    try {
      return json
          .map((j) => ExploreEventDto.fromJson(j))
          .toList();
    } catch (e) {
      debugPrint(
          'ExploreMapLocalService: failed to parse cached events: $e');
      return null;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Location cache (lat/lng at the time of last fetch)
  // ──────────────────────────────────────────────────────────────

  /// Persist the user location associated with the cached data.
  Future<void> cacheLocation(double lat, double lng) async {
    await _put(_keyLocation, {'lat': lat, 'lng': lng});
  }

  /// Read the last cached location, or `null` if never cached.
  Future<({double lat, double lng})?> cachedLocation() async {
    final json = await _get(_keyLocation);
    if (json == null) return null;
    try {
      return (lat: (json['lat'] as num).toDouble(),
          lng: (json['lng'] as num).toDouble());
    } catch (_) {
      return null;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Invalidation
  // ──────────────────────────────────────────────────────────────

  /// Remove all explore map cache entries (triggers full network load).
  Future<void> invalidateAll() async {
    await (_db.delete(_db.analyticsCache)
          ..where((t) => t.key.equals(_keyTrainers) |
              t.key.equals(_keyEvents) |
              t.key.equals(_keyLocation)))
        .go();
  }

  // ──────────────────────────────────────────────────────────────
  // Internals
  // ──────────────────────────────────────────────────────────────

  Future<void> _put(String key, Map<String, dynamic> json) async {
    await (_db.into(_db.analyticsCache).insertOnConflictUpdate(
          AnalyticsCacheCompanion(
            key: Value(key),
            value: Value(jsonEncode(json)),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ),
        ));
  }

  Future<void> _putList(String key, List<Map<String, dynamic>> jsonList) async {
    // Store list as a JSON string under a wrapper map so we can reuse _put.
    await _put(key, {'items': jsonList});
  }

  Future<Map<String, dynamic>?> _get(String key) async {
    final row = await (_db.select(_db.analyticsCache)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    if (row == null) return null;
    try {
      return jsonDecode(row.value) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> _getList(String key) async {
    final map = await _get(key);
    if (map == null) return null;
    try {
      final items = map['items'];
      if (items is List) {
        return items.cast<Map<String, dynamic>>();
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
