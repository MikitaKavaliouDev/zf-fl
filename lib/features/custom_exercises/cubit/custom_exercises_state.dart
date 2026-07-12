import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/custom_exercise_dto.dart';

part 'custom_exercises_state.freezed.dart';

@freezed
sealed class CustomExercisesState with _$CustomExercisesState {
  const factory CustomExercisesState.initial() = CustomExercisesInitial;

  const factory CustomExercisesState.loading() = CustomExercisesLoading;

  const factory CustomExercisesState.loaded({
    required List<CustomExerciseDto> exercises,
  }) = CustomExercisesLoaded;

  const factory CustomExercisesState.error(String message) = CustomExercisesError;
}
