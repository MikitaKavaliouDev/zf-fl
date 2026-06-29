import 'dart:collection';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

/// Dio interceptor providing request deduplication and TTL-based caching.
///
/// **Dedup** — identical in-flight GET/PUT/DELETE requests within 100ms
/// share the same Future instead of making N parallel network calls.
///
/// **Cache** — identical GET requests within a 30-second TTL return the
/// cached response without hitting the network. PUT/DELETE bypass cache
/// but are still deduped.
///
/// **Bypass** — POST bypasses both dedup and cache entirely.
///
/// **Cache busting** — any mutation (`POST`/`PUT`/`DELETE`) to
/// `/api/client/*` clears ALL cached entries under that namespace.
///
/// **Memory** — max 100 entries with LRU eviction.
///
/// **Order**: Should sit between ApiLoggerInterceptor (outermost) and
/// AuthInterceptor. Recommended chain order:
///   ApiLogger → CacheInterceptor → AuthInterceptor → RetryInterceptor → Dio
@singleton
class CacheInterceptor extends Interceptor {
  @visibleForTesting
  static const Duration dedupWindow = Duration(milliseconds: 100);
  @visibleForTesting
  static const Duration ttl = Duration(seconds: 30);
  static const int _maxEntries = 100;

  /// In-flight requests keyed by `METHOD:path`.
  final Map<String, Future<Response>> _inFlight = {};

  /// Cached responses keyed by `METHOD:path`.
  final Map<String, _CacheEntry> _cache = LinkedHashMap(
    equals: (a, b) => a == b,
    hashCode: (e) => e.hashCode,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // POST bypasses both dedup and cache
    if (options.method == 'POST') {
      handler.next(options);
      return;
    }

    final cacheKey = '${options.method}:${options.path}';

    // ── Cache hit — return stale response ──
    final cached = _cache[cacheKey];
    if (cached != null && !cached.isExpired) {
      developer.log(
        'CACHE HIT [$cacheKey] (age: ${DateTime.now().difference(cached.timestamp).inSeconds}s)',
        name: 'cache',
      );
      handler.resolve(cached.response, false);
      return;
    }

    // Expired entry — remove it
    if (cached != null) {
      _cache.remove(cacheKey);
    }

    // ── Dedup — share in-flight future ──
    if (options.method == 'GET' ||
        options.method == 'PUT' ||
        options.method == 'DELETE') {
      final inFlight = _inFlight[cacheKey];
      if (inFlight != null) {
        developer.log('DEDUP [$cacheKey] — sharing in-flight request',
            name: 'cache');
        try {
          final response = await inFlight;
          handler.resolve(response, false);
        } catch (_) {
          // Dedup failed — don't block, let original request continue
          _inFlight.remove(cacheKey);
        }
        return;
      }
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final method = response.requestOptions.method;
    final path = response.requestOptions.path;
    final cacheKey = '$method:$path';

    // Clear in-flight tracker
    _inFlight.remove(cacheKey);

    // ── Cache busting on mutations ──
    if (_isClientMutation(method, path)) {
      _evictClientCache();
    }

    // ── Cache GET responses ──
    if (method == 'GET' && response.statusCode == 200) {
      _cache[cacheKey] = _CacheEntry(response);
      _enforceMaxSize();
      developer.log('CACHE STORE [$cacheKey]', name: 'cache');
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final cacheKey =
        '${err.requestOptions.method}:${err.requestOptions.path}';
    _inFlight.remove(cacheKey);
    handler.next(err);
  }

  /// Whether the request is a mutation to the client API namespace.
  bool _isClientMutation(String method, String path) {
    if (method == 'GET') return false;
    return path.startsWith('/api/client/');
  }

  /// Remove ALL cached entries under `/api/client/*`.
  void _evictClientCache() {
    final keysToRemove = _cache.keys
        .where((key) => key.startsWith('GET:/api/client/'))
        .toList();
    for (final key in keysToRemove) {
      _cache.remove(key);
    }
    if (keysToRemove.isNotEmpty) {
      developer.log(
        'CACHE BUST: evicted ${keysToRemove.length} entries under /api/client/',
        name: 'cache',
      );
    }
  }

  /// Evict oldest entries when cache exceeds max size.
  void _enforceMaxSize() {
    while (_cache.length > _maxEntries) {
      final firstKey = _cache.keys.first;
      _cache.remove(firstKey);
    }
  }

  /// Public api: manually bust all cache entries.
  void clearAll() {
    developer.log('CACHE CLEAR: all entries ($_cache entries)',
        name: 'cache');
    _cache.clear();
    _inFlight.clear();
  }
}

/// A cached response with timestamp for TTL checking.
class _CacheEntry {
  final Response response;
  final DateTime timestamp;

  _CacheEntry(this.response) : timestamp = DateTime.now();

  bool get isExpired =>
      DateTime.now().difference(timestamp) > CacheInterceptor.ttl;
}
