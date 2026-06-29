import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent key-value cache for API responses, backed by
/// [SharedPreferences].
///
/// Used as an offline fallback: repositories save the last successful
/// response and return it when the device is offline.
///
/// Each entry is stored as a JSON string under the key
/// `response_cache:$key`. Entries persist until overwritten or cleared.
@singleton
class ResponseCache {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  /// Read a cached response, parsing it with [fromJson].
  /// Returns `null` if no cached entry exists or parsing fails.
  Future<T?> get<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final prefs = await _prefs;
    final raw = prefs.getString('response_cache:$key');
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return fromJson(map);
    } catch (_) {
      return null;
    }
  }

  /// Write a JSON-serializable value to the cache.
  Future<void> set(String key, Map<String, dynamic> value) async {
    final prefs = await _prefs;
    await prefs.setString('response_cache:$key', jsonEncode(value));
  }

  /// Remove a specific cached response.
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove('response_cache:$key');
  }

  /// Clear ALL cached responses.
  Future<void> clearAll() async {
    final prefs = await _prefs;
    final keys = prefs.getKeys().where((k) => k.startsWith('response_cache:'));
    for (final key in keys) {
      await prefs.remove(key);
    }
  }
}
