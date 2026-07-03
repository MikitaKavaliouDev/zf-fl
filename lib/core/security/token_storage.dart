import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/models/user.dart';
import '../models/app_mode.dart';

/// Wraps [FlutterSecureStorage] for JWT token persistence.
/// Stores tokens and cached user data separately for each [AppMode],
/// enabling instant switching between client and trainer sessions.
@singleton
class TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorage()
      : _storage = const FlutterSecureStorage();

  // ── Per-mode token storage ──

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    AppMode mode = AppMode.client,
  }) async {
    final p = mode.storagePrefix;
    await Future.wait([
      _storage.write(key: '${p}access_token', value: accessToken),
      _storage.write(key: '${p}refresh_token', value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken({AppMode mode = AppMode.client}) =>
      _storage.read(key: '${mode.storagePrefix}access_token');

  Future<String?> getRefreshToken({AppMode mode = AppMode.client}) =>
      _storage.read(key: '${mode.storagePrefix}refresh_token');

  // ── Per-mode user cache ──

  Future<void> saveUser(User user, {AppMode mode = AppMode.client}) async {
    final json = jsonEncode(user.toJson());
    await _storage.write(key: '${mode.storagePrefix}cached_user', value: json);
  }

  Future<User?> getCachedUser({AppMode mode = AppMode.client}) async {
    final json = await _storage.read(key: '${mode.storagePrefix}cached_user');
    if (json == null) return null;
    try {
      return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  /// Copy tokens and cached user from [source] mode to [target] mode.
  /// Does NOT clear the source — the source keeps its copy.
  Future<void> migrateTokens({
    required AppMode source,
    required AppMode target,
  }) async {
    if (source == target) return;
    final accessToken = await getAccessToken(mode: source);
    final refreshToken = await getRefreshToken(mode: source);
    final cachedUser = await getCachedUser(mode: source);
    if (accessToken == null && refreshToken == null) return;
    await Future.wait([
      if (accessToken != null)
        _storage.write(
          key: '${target.storagePrefix}access_token',
          value: accessToken,
        ),
      if (refreshToken != null)
        _storage.write(
          key: '${target.storagePrefix}refresh_token',
          value: refreshToken,
        ),
      if (cachedUser != null)
        _storage.write(
          key: '${target.storagePrefix}cached_user',
          value: jsonEncode(cachedUser.toJson()),
        ),
    ]);
  }

  // ── Clear ──

  /// Clear tokens and cached user for a single mode.
  Future<void> clearTokens({AppMode mode = AppMode.client}) async {
    final p = mode.storagePrefix;
    await Future.wait([
      _storage.delete(key: '${p}access_token'),
      _storage.delete(key: '${p}refresh_token'),
      _storage.delete(key: '${p}cached_user'),
    ]);
  }

  /// Clear tokens and cached user for BOTH modes.
  Future<void> clearAll() async {
    await Future.wait([
      clearTokens(mode: AppMode.client),
      clearTokens(mode: AppMode.trainer),
    ]);
  }
}
