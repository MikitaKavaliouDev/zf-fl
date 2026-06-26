import 'package:injectable/injectable.dart';

import 'nutrition_habits_api_service.dart';
import 'models/nutrition_plan_dto.dart';
import 'models/daily_habit_dto.dart';
import 'models/habit_log_dto.dart';

@singleton
class NutritionHabitsRepository {
  final NutritionHabitsApiService _api;

  NutritionHabitsRepository(this._api);

  Future<NutritionPlanDto?> getNutritionPlan() => _api.getNutritionPlan();

  Future<List<DailyHabitDto>> getHabits() => _api.getHabits();

  Future<HabitLogDto> logHabit(
    String habitId, {
    required String date,
    required bool isCompleted,
    String? note,
  }) =>
      _api.logHabit(habitId, date: date, isCompleted: isCompleted, note: note);
}
