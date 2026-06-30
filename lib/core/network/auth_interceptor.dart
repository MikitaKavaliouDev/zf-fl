import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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

  AuthInterceptor(this._tokenStorage);

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

    final token = await _tokenStorage.getAccessToken();
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
      final dio = GetIt.instance<Dio>();
      final refreshToken = await _tokenStorage.getRefreshToken();

      if (refreshToken == null) {
        await _tokenStorage.clearTokens();
        handler.next(err);
        return;
      }

      final response = await dio.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final data = response.data['data'];
      final newAccess = data['accessToken'] as String;
      final newRefresh = data['refreshToken'] as String;

      await _tokenStorage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      // Retry the original request with the new token
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
      final retryResponse = await dio.fetch(err.requestOptions);
      handler.resolve(retryResponse);
    } catch (e) {
      final isAuthRejection = e is DioException &&
          e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401;

      if (isAuthRejection) {
        // Server explicitly rejected the refresh token
        await _tokenStorage.clearTokens();
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

  bool _isPublicEndpoint(String path) {
    return path.contains('/api/auth/login') ||
        path.contains('/api/auth/register') ||
        path.contains('/api/auth/refresh');
  }
}
