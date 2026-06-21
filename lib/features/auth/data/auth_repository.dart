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

  Future<User?> getCurrentUser() async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return null;
    try {
      return await _api.getMe();
    } catch (_) {
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
