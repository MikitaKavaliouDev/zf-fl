import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'fitness_goals_api_service.dart';
import 'models/fitness_goal_dto.dart';

@singleton
class FitnessGoalsRepository {
  final FitnessGoalsApiService _api;
  final ResponseCache _cache;

  FitnessGoalsRepository(this._api, this._cache);

  static const _goalsCacheKey = 'fitness-goals';

  /// Fetch fitness goals — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<List<FitnessGoalDto>> getGoals({bool forceRefresh = false}) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<Map<String, dynamic>>(
        _goalsCacheKey,
        (map) => map,
      );
      if (cached != null) {
        final items = (cached['items'] as List)
            .map((e) => FitnessGoalDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return items;
      }
    }
    // 3. No cache — await the network call
    return _refreshGoals();
  }

  /// Internal: fetch goals from API and persist to cache.
  Future<List<FitnessGoalDto>> _refreshGoals() async {
    final response = await _api.getGoals();
    final jsonList = response.map((e) => e.toJson()).toList();
    await _cache.set(_goalsCacheKey, {'items': jsonList});
    return response;
  }

  /// Invalidate cached fitness goals — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_goalsCacheKey);
  }

  Future<FitnessGoalDto> createGoal(Map<String, dynamic> body) =>
      _api.createGoal(body);

  Future<FitnessGoalDto> updateGoal(
    String id, {
    double? targetValue,
    double? currentValue,
  }) =>
      _api.updateGoal(id, targetValue: targetValue, currentValue: currentValue);

  Future<void> deleteGoal(String id) => _api.deleteGoal(id);
}
