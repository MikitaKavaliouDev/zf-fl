import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../logging/logger_config.dart';

/// Dio interceptor that logs every HTTP call for manual debugging.
///
/// Uses [debugPrint] which outputs to `adb logcat` on Android and
/// to Xcode console on iOS. Zero overhead in release builds.
///
/// Example output:
///   [API] req:1 POST /api/auth/login
///   [API] req:1   Request: {"email":"...", "password":"***"}
///   [API] req:1 ← 200 (342ms)
///   [API] req:1   Response: {"data":{"accessToken":"eyJ...", ...}}
@singleton
class ApiLoggerInterceptor extends Interceptor {
  int _requestId = 0;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!LoggerConfig.logApiCalls) {
      handler.next(options);
      return;
    }

    final id = ++_requestId;
    options.extra['requestId'] = id;
    final method = options.method;
    final uri = options.uri.toString();

    debugPrint('[API] [$id] $method $uri');

    if (options.data != null) {
      final body = _maskSensitiveFields(options.data);
      debugPrint('[API] [$id]   Request: $body');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!LoggerConfig.logApiCalls) {
      handler.next(response);
      return;
    }

    final id = response.requestOptions.extra['requestId'] ?? '?';
    final statusCode = response.statusCode;
    final elapsed = _computeElapsed(response);

    debugPrint('[API] [$id] ← $statusCode (${elapsed}ms)');

    if (response.data != null) {
      final body = _truncate(response.data.toString());
      debugPrint('[API] [$id]   Response: $body');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!LoggerConfig.logApiCalls) {
      handler.next(err);
      return;
    }

    final id = err.requestOptions.extra['requestId'] ?? '?';
    final statusCode = err.response?.statusCode ?? 0;
    debugPrint('[API] [$id] ✗ $statusCode ${err.message}');

    handler.next(err);
  }

  // --- helpers ---

  String _maskSensitiveFields(dynamic data) {
    final s = data.toString();
    // Mask common sensitive fields
    return s
        .replaceAll(RegExp(r'("password":\s*)"[^"]*"'), r'$1"***"')
        .replaceAll(RegExp(r'("accessToken":\s*)"[^"]*"'), r'$1"***"')
        .replaceAll(RegExp(r'("refreshToken":\s*)"[^"]*"'), r'$1"***"');
  }

  String _truncate(String s) {
    if (s.length <= 2000) return s;
    return '${s.substring(0, 2000)}\n… [truncated ${s.length - 2000} chars]';
  }

  int _computeElapsed(Response response) {
    final start = response.requestOptions.extra['startTime'] as int?;
    if (start == null) return 0;
    return DateTime.now().millisecondsSinceEpoch - start;
  }
}
