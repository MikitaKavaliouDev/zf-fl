import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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

  AuthRepository(this._api, this._tokenStorage);

  // ── Auth actions ──

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _api.login(request);
    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
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

  Future<void> logout() async {
    try {
      await _api.signOut();
    } on DioException catch (_) {
      // Even if API call fails, clear local tokens
    }
    await _tokenStorage.clearTokens();
  }

  Future<void> completeOnboarding() async {
    await _api.completeOnboarding();
  }

  // ── Token / session helpers ──

  /// Restore the current user session from stored tokens.
  ///
  /// Tries the access token first (via [getMe]). If that fails (missing,
  /// expired, or server rejection), falls back to the refresh token via
  /// [AuthApiService.refresh] to obtain fresh credentials.
  ///
  /// Returns the [User] if a valid session exists, or `null` otherwise.
  Future<User?> getCurrentUser() async {
    // 1. Try access token → GET /api/auth/me
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken != null) {
      try {
        return await _api.getMe();
      } on DioException catch (e) {
        developer.log(
          'getCurrentUser: getMe failed (${e.response?.statusCode}), '
          'falling back to refresh token',
          name: 'auth',
        );
        // Fall through to refresh token attempt
      } catch (_) {
        // Non-Dio error — do not attempt refresh
        return null;
      }
    }

    // 2. Fallback: refresh token → POST /api/auth/refresh
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      developer.log('getCurrentUser: no stored tokens', name: 'auth');
      return null;
    }

    try {
      final response = await _api.refresh(refreshToken);
      // Persist the new token pair so subsequent calls are authenticated.
      await _tokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      developer.log(
        'getCurrentUser: session restored via refresh token',
        name: 'auth',
      );
      return response.user;
    } catch (e) {
      developer.log(
        'getCurrentUser: refresh failed — clearing tokens',
        name: 'auth',
        error: e,
      );
      await _tokenStorage.clearTokens();
      return null;
    }
  }

  Future<String?> getAccessToken() => _tokenStorage.getAccessToken();

  Future<bool> isLoggedIn() async {
    final token = await _tokenStorage.getAccessToken();
    return token != null;
  }

  Future<void> clearSession() => _tokenStorage.clearTokens();
}
