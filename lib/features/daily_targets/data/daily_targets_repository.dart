import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'daily_targets_api_service.dart';
import 'models/daily_target_dto.dart';

@singleton
class DailyTargetsRepository {
  final DailyTargetsApiService _api;
  final ResponseCache _cache;

  DailyTargetsRepository(this._api, this._cache);

  static const _targetsCacheKey = 'daily-targets';

  /// Fetch daily targets — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<List<DailyTargetDto>> getTargets({
    String? date,
    bool forceRefresh = false,
  }) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<Map<String, dynamic>>(
        _targetsCacheKey,
        (map) => map,
      );
      if (cached != null) {
        final items = (cached['items'] as List)
            .map((e) => DailyTargetDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return items;
      }
    }
    // 3. No cache — await the network call
    return _refreshTargets(date: date);
  }

  /// Internal: fetch targets from API and persist to cache.
  Future<List<DailyTargetDto>> _refreshTargets({String? date}) async {
    final response = await _api.getTargets(date: date);
    final jsonList = response.map((e) => e.toJson()).toList();
    await _cache.set(_targetsCacheKey, {'items': jsonList});
    return response;
  }

  /// Invalidate cached daily targets — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_targetsCacheKey);
  }

  Future<DailyTargetDto> createTarget(Map<String, dynamic> body) =>
      _api.createTarget(body);

  Future<DailyTargetDto> updateTarget(
    String id, {
    double? currentValue,
    bool? isCompleted,
  }) =>
      _api.updateTarget(id, currentValue: currentValue, isCompleted: isCompleted);

  Future<void> deleteTarget(String id) => _api.deleteTarget(id);
}
