import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/cubit/auth_cubit.dart';
import '../security/active_mode_holder.dart';
import '../security/token_storage.dart';

/// Queued Dio interceptor that:
/// 1. Attaches the access token to every request.
/// 2. On 401, attempts a silent refresh via `POST /api/auth/refresh`;
///    if refresh fails, clears tokens.
///
/// Uses [QueuedInterceptor] so pending requests are queued during refresh.
@singleton
class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage _tokenStorage;
  final ActiveModeHolder _modeHolder;

  AuthInterceptor(this._tokenStorage, this._modeHolder);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth header for login/register/refresh endpoints
    if (_isPublicEndpoint(options.path)) {
      handler.next(options);
      return;
    }

    // Don't overwrite an Authorization header that's already set
    // (e.g., getMe in getCurrentUser passes a per-mode token).
    if (options.headers.containsKey('Authorization')) {
      handler.next(options);
      return;
    }

    final token =
        await _tokenStorage.getAccessToken(mode: _modeHolder.currentMode);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    // Attempt token refresh
    try {
      final currentMode = _modeHolder.currentMode;
      final refreshToken =
          await _tokenStorage.getRefreshToken(mode: currentMode);

      if (refreshToken == null) {
        await _tokenStorage.clearTokens(mode: currentMode);
        _forceUnauthenticated();
        handler.next(err);
        return;
      }

      // Use a bare Dio for the refresh call to avoid recursive deadlock
      // when the refresh token itself is rejected (the interceptor chain
      // would call onError again → holds QueuedInterceptor._errorLock → hang).
      final baseUrl = GetIt.instance<Dio>().options.baseUrl;
      final bareDio = Dio(BaseOptions(baseUrl: baseUrl));
      final response = await bareDio.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final data = response.data['data'];
      final newAccess = data['accessToken'] as String;
      final newRefresh = data['refreshToken'] as String;

      await _tokenStorage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
        mode: currentMode,
      );

      // Retry the original request with the new token
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
      final retryResponse = await bareDio.fetch(err.requestOptions);
      handler.resolve(retryResponse);
    } catch (e) {
      final isAuthRejection = e is DioException &&
          e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401;

      if (isAuthRejection) {
        // Server explicitly rejected the refresh token
        await _tokenStorage.clearTokens(mode: _modeHolder.currentMode);
        _forceUnauthenticated();
      } else {
        // Network error, timeout, server error — keep tokens
        developer.log(
          'AuthInterceptor: refresh failed — preserving tokens '
          '(${e is DioException ? e.type : e.runtimeType})',
          name: 'auth',
        );
      }
      handler.next(err);
    }
  }

  /// Force the app back to the login screen when the session is irrecoverable.
  /// Called from a non-constructor context, so GetIt is fully initialized.
  void _forceUnauthenticated() {
    try {
      GetIt.instance<AuthCubit>().clearError();
    } catch (_) {
      // GetIt may not be ready during early startup — ignore.
    }
  }

  bool _isPublicEndpoint(String path) {
    return path.contains('/api/auth/login') ||
        path.contains('/api/auth/register') ||
        path.contains('/api/auth/refresh');
  }
}
