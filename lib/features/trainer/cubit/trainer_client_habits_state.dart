import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_habit_dto.dart';

part 'trainer_client_habits_state.freezed.dart';

@freezed
sealed class TrainerClientHabitsState with _$TrainerClientHabitsState {
  const factory TrainerClientHabitsState.initial() =
      TrainerClientHabitsInitial;

  const factory TrainerClientHabitsState.loading() =
      TrainerClientHabitsLoading;

  const factory TrainerClientHabitsState.loaded(
    List<TrainerHabitDto> habits,
  ) = TrainerClientHabitsLoaded;

  const factory TrainerClientHabitsState.error(String message) =
      TrainerClientHabitsError;
}
