import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/features/trainer/data/models/storefront_profile_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';

/// Drift-backed local cache for trainer storefront data.
///
/// Stores the last successfully fetched storefront profile and Stripe status
/// as JSON blobs in the [AnalyticsCache] table so the storefront settings
/// screen renders instantly on subsequent opens and works offline from
/// previously viewed data.
///
/// Pattern mirrors [ExploreMapLocalService] exactly.
@singleton
class StorefrontLocalService {
  final AppDatabase _db;

  StorefrontLocalService(this._db);

  // ──────────────────────────────────────────────────────────────
  // Cache keys
  // ──────────────────────────────────────────────────────────────

  static const _keyProfile = 'storefront:profile';
  static const _keyStripe = 'storefront:stripe';

  // ──────────────────────────────────────────────────────────────
  // Profile cache
  // ──────────────────────────────────────────────────────────────

  /// Persist the storefront profile from the API.
  Future<void> cacheProfile(StorefrontProfileDto profile) async {
    await _put(_keyProfile, profile.toJson());
  }

  /// Read the last cached storefront profile, or `null` if never cached.
  Future<StorefrontProfileDto?> cachedProfile() async {
    final json = await _get(_keyProfile);
    if (json == null) return null;
    try {
      return StorefrontProfileDto.fromJson(json);
    } catch (e) {
      debugPrint(
        'StorefrontLocalService: failed to parse cached profile: $e',
      );
      return null;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Stripe status cache
  // ──────────────────────────────────────────────────────────────

  /// Persist the Stripe Connect status from the API.
  Future<void> cacheStripeStatus(StripeStatusDto status) async {
    await _put(_keyStripe, status.toJson());
  }

  /// Read the last cached Stripe status, or `null` if never cached.
  Future<StripeStatusDto?> cachedStripeStatus() async {
    final json = await _get(_keyStripe);
    if (json == null) return null;
    try {
      return StripeStatusDto.fromJson(json);
    } catch (e) {
      debugPrint(
        'StorefrontLocalService: failed to parse cached Stripe status: $e',
      );
      return null;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Invalidation
  // ──────────────────────────────────────────────────────────────

  /// Remove all storefront cache entries (triggers full network load).
  Future<void> invalidateAll() async {
    await (_db.delete(_db.analyticsCache)
          ..where((t) =>
              t.key.equals(_keyProfile) | t.key.equals(_keyStripe)))
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
}
