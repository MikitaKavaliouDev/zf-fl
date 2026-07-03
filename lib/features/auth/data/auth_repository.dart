import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/models/app_mode.dart';
import '../../../core/security/active_mode_holder.dart';
import '../../../core/security/token_storage.dart';
import 'auth_api_service.dart';
import 'models/auth_response.dart';
import 'models/login_request.dart';
import 'models/register_request.dart';
import 'models/register_response.dart';
import 'models/user.dart';

@singleton
class AuthRepository {
  final AuthApiService _api;
  final TokenStorage _tokenStorage;
  final ActiveModeHolder _modeHolder;

  AuthRepository(this._api, this._tokenStorage, this._modeHolder);

  // ── Auth actions ──

  /// Log in and store the token under the given [mode].
  /// On first login [mode] defaults to [AppMode.client]; the caller
  /// passes a specific mode when logging in during a mode switch flow.
  Future<AuthResponse> login({
    required String email,
    required String password,
    AppMode mode = AppMode.client,
  }) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _api.login(request);
    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      mode: mode,
    );
    await _tokenStorage.saveUser(response.user, mode: mode);
    _modeHolder.currentMode = mode;
    return response;
  }

  Future<RegisterResponse> register({
    required String email,
    required String password,
    String? name,
    String? trainerId,
  }) async {
    final request = RegisterRequest(
      email: email,
      password: password,
      name: name,
      trainerId: trainerId,
    );
    return _api.register(request);
    // Note: do NOT save tokens — email confirmation required first
  }

  /// Log out of the [ActiveModeHolder.currentMode] only.
  /// The other mode's session is preserved.
  Future<void> logout() async {
    final mode = _modeHolder.currentMode;
    try {
      await _api.signOut();
    } on DioException catch (_) {
      // Even if API call fails, clear local tokens
    }
    await _tokenStorage.clearTokens(mode: mode);
  }

  /// Log out of BOTH modes (full app sign-out).
  Future<void> logoutAll() async {
    try {
      await _api.signOut();
    } on DioException catch (_) {}
    await _tokenStorage.clearAll();
  }

  Future<void> completeOnboarding() async {
    await _api.completeOnboarding();
  }

  // ── Token / session helpers ──

  /// Restore the user session for the given [mode].
  /// Passes the stored access token directly so [AuthApiService.getMe]
  /// works even when the active [ActiveModeHolder.currentMode] differs.
  /// Returns the [User] if a valid session exists, or `null` otherwise.
  Future<User?> getCurrentUser({AppMode mode = AppMode.client}) async {
    final accessToken = await _tokenStorage.getAccessToken(mode: mode);
    if (accessToken != null) {
      try {
        final user = await _api.getMe(accessToken: accessToken);
        await _tokenStorage.saveUser(user, mode: mode);
        return user;
      } on DioException catch (e) {
        developer.log(
          'getCurrentUser($mode): getMe failed (${e.response?.statusCode}), '
          'falling back to refresh token',
          name: 'auth',
        );
      } catch (_) {
        return null;
      }
    }

    final refreshToken = await _tokenStorage.getRefreshToken(mode: mode);
    if (refreshToken == null) {
      developer.log('getCurrentUser($mode): no stored tokens', name: 'auth');
      return null;
    }

    try {
      final response = await _api.refresh(refreshToken);
      await _tokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        mode: mode,
      );
      await _tokenStorage.saveUser(response.user, mode: mode);
      developer.log(
        'getCurrentUser($mode): session restored via refresh token',
        name: 'auth',
      );
      return response.user;
    } catch (e) {
      final isAuthRejection = e is DioException &&
          e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401;
      if (isAuthRejection) {
        developer.log(
          'getCurrentUser($mode): refresh rejected, clearing tokens',
          name: 'auth',
        );
        await _tokenStorage.clearTokens(mode: mode);
      } else {
        developer.log(
          'getCurrentUser($mode): refresh failed — preserving tokens '
          '(${e is DioException ? e.type : e.runtimeType})',
          name: 'auth',
          error: e,
        );
      }
      return null;
    }
  }

  Future<String?> getAccessToken() =>
      _tokenStorage.getAccessToken(mode: _modeHolder.currentMode);

  Future<User?> getCachedUser({AppMode mode = AppMode.client}) =>
      _tokenStorage.getCachedUser(mode: mode);

  Future<bool> isLoggedIn({AppMode mode = AppMode.client}) async {
    final token = await _tokenStorage.getAccessToken(mode: mode);
    return token != null;
  }

  Future<void> clearSession() =>
      _tokenStorage.clearTokens(mode: _modeHolder.currentMode);

  /// Copy tokens from [source] mode to [target] mode.
  /// Used when [`checkAuthStatus`] determines the user's role doesn't
  /// match the storage mode (e.g., trainer tokens stored under client
  /// prefix during initial login).
  Future<void> migrateTokens({
    required AppMode source,
    required AppMode target,
  }) =>
      _tokenStorage.migrateTokens(source: source, target: target);
}
