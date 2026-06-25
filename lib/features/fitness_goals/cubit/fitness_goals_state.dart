import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/fitness_goal_dto.dart';

part 'fitness_goals_state.freezed.dart';

@freezed
sealed class FitnessGoalsState with _$FitnessGoalsState {
  const factory FitnessGoalsState.initial() = FitnessGoalsInitial;

  const factory FitnessGoalsState.loading() = FitnessGoalsLoading;

  const factory FitnessGoalsState.loaded({
    required List<FitnessGoalDto> goals,
  }) = FitnessGoalsLoaded;

  const factory FitnessGoalsState.error(String message) = FitnessGoalsError;
}
