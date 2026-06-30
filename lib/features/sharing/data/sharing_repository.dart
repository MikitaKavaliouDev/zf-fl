import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'models/sharing_config_dto.dart';
import 'sharing_api_service.dart';

@singleton
class SharingRepository {
  final SharingApiService _api;
  final ResponseCache _cache;

  SharingRepository(this._api, this._cache);

  static const _configCacheKey = 'sharing:config';

  /// Fetch sharing config — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<SharingConfigDto> getConfig({bool forceRefresh = false}) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<SharingConfigDto>(
        _configCacheKey,
        SharingConfigDto.fromJson,
      );
      if (cached != null) {
        return cached;
      }
    }
    // 3. No cache — await the network call
    return _refreshConfig();
  }

  /// Internal: fetch config from API and persist to cache.
  Future<SharingConfigDto> _refreshConfig() async {
    final response = await _api.getConfig();
    await _cache.set(_configCacheKey, response.toJson());
    return response;
  }

  /// Invalidate cached sharing config — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_configCacheKey);
  }

  Future<void> updateConfig(Map<String, dynamic> body) =>
      _api.updateConfig(body);
}
