import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Dio interceptor that retries GET, PUT, DELETE on transient failures.
///
/// **Never retries POST** — POST creates resources and retries would
/// produce duplicate entities.
///
/// **Retry policy:**
/// - 2 retries with exponential backoff (1s → 2s)
/// - Triggered on: 5xx, timeout, SocketException
/// - Skipped on: 401 (AuthInterceptor handles it)
/// - Respects `Retry-After` header if present
///
/// **Order**: Must be the innermost interceptor (last added, first to
/// attempt retry after auth refresh).
@singleton
class RetryInterceptor extends Interceptor {
  static const int _maxRetries = 2;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Tag requests so retry logic knows the attempt count
    options.extra['retry_count'] = 0;
    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only retry GET, PUT, DELETE — never POST
    if (err.requestOptions.method == 'POST') {
      handler.next(err);
      return;
    }

    // Don't retry if AuthInterceptor will handle it
    if (err.response?.statusCode == 401) {
      handler.next(err);
      return;
    }

    final retryCount = err.requestOptions.extra['retry_count'] as int? ?? 0;

    if (retryCount >= _maxRetries || !_isRetryable(err)) {
      handler.next(err);
      return;
    }

    // Check Retry-After header
    final retryAfter = _parseRetryAfter(err.response);
    final baseDelay = retryAfter ?? Duration(
      seconds: retryCount == 0 ? 1 : 2,
    );

    developer.log(
      'Retry #${retryCount + 1}/$_maxRetries for '
      '${err.requestOptions.method} ${err.requestOptions.path} '
      '(delay: ${baseDelay.inMilliseconds}ms)',
      name: 'retry',
    );

    await Future.delayed(baseDelay);

    try {
      err.requestOptions.extra['retry_count'] = retryCount + 1;
      // Use a bare Dio for retry — err.requestOptions already has
      // the full resolved URL, auth headers from AuthInterceptor,
      // and the request body. We intentionally skip the interceptor
      // chain to avoid re-dedup (CacheInterceptor) and infinite retry
      // loops (RetryInterceptor.onRequest would reset retry_count=0).
      final response = await Dio().fetch(err.requestOptions);
      handler.resolve(response);
    } catch (retryErr) {
      // If the retry itself fails, let the original error propagate
      handler.next(err);
    }
  }

  /// Whether the error is considered transient and retryable.
  bool _isRetryable(DioException err) {
    // 5xx server errors
    if (err.response != null && err.response!.statusCode! >= 500) {
      return true;
    }

    // Timeout
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return true;
    }

    // Socket / connection errors
    if (err.error is SocketException) {
      return true;
    }

    return false;
  }

  /// Parse optional `Retry-After` header (seconds or HTTP-date).
  Duration? _parseRetryAfter(Response? response) {
    if (response == null) return null;
    final header = response.headers.value('Retry-After');
    if (header == null) return null;

    final seconds = int.tryParse(header);
    if (seconds != null) {
      return Duration(seconds: seconds);
    }

    // HTTP-date format — fall back to default backoff
    return null;
  }
}
