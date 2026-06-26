import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/nutrition_plan_dto.dart';
import '../data/models/daily_habit_dto.dart';

part 'nutrition_habits_state.freezed.dart';

@freezed
sealed class NutritionHabitsState with _$NutritionHabitsState {
  const factory NutritionHabitsState.initial() = NutritionHabitsInitial;

  const factory NutritionHabitsState.loading() = NutritionHabitsLoading;

  const factory NutritionHabitsState.loaded({
    NutritionPlanDto? plan,
    required List<DailyHabitDto> habits,
  }) = NutritionHabitsLoaded;

  const factory NutritionHabitsState.error(String message) =
      NutritionHabitsError;
}
