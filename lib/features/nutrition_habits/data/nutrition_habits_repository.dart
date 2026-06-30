import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'models/daily_habit_dto.dart';
import 'models/habit_log_dto.dart';
import 'models/nutrition_plan_dto.dart';
import 'nutrition_habits_api_service.dart';

@singleton
class NutritionHabitsRepository {
  final NutritionHabitsApiService _api;
  final ResponseCache _cache;

  NutritionHabitsRepository(this._api, this._cache);

  static const _nutritionPlanCacheKey = 'nutrition:plan';
  static const _habitsCacheKey = 'nutrition:habits';

  /// Fetch the nutrition plan — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<NutritionPlanDto?> getNutritionPlan({bool forceRefresh = false}) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<NutritionPlanDto>(
        _nutritionPlanCacheKey,
        NutritionPlanDto.fromJson,
      );
      if (cached != null) {
        return cached;
      }
    }
    // 3. No cache — await the network call
    return _refreshNutritionPlan();
  }

  /// Internal: fetch nutrition plan from API and persist to cache.
  Future<NutritionPlanDto?> _refreshNutritionPlan() async {
    final response = await _api.getNutritionPlan();
    // Only cache non-null responses
    if (response != null) {
      await _cache.set(_nutritionPlanCacheKey, response.toJson());
    }
    return response;
  }

  /// Fetch active habits — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<List<DailyHabitDto>> getHabits({bool forceRefresh = false}) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<Map<String, dynamic>>(
        _habitsCacheKey,
        (map) => map,
      );
      if (cached != null) {
        final items = (cached['items'] as List)
            .map((e) => DailyHabitDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return items;
      }
    }
    // 3. No cache — await the network call
    return _refreshHabits();
  }

  /// Internal: fetch habits from API and persist to cache.
  Future<List<DailyHabitDto>> _refreshHabits() async {
    final response = await _api.getHabits();
    final jsonList = response.map((e) => e.toJson()).toList();
    await _cache.set(_habitsCacheKey, {'items': jsonList});
    return response;
  }

  /// Invalidate cached nutrition plan and habits — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_nutritionPlanCacheKey);
    await _cache.remove(_habitsCacheKey);
  }

  Future<HabitLogDto> logHabit(
    String habitId, {
    required String date,
    required bool isCompleted,
    String? note,
  }) =>
      _api.logHabit(habitId, date: date, isCompleted: isCompleted, note: note);
}
