import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/exercise_dto.dart';
import '../data/models/workout_session_dto.dart';

part 'exercise_detail_state.freezed.dart';

@freezed
sealed class ExerciseDetailState with _$ExerciseDetailState {
  const factory ExerciseDetailState.initial() = ExerciseDetailInitial;

  const factory ExerciseDetailState.loading() = ExerciseDetailLoading;

  const factory ExerciseDetailState.loaded({
    required ExerciseDto exercise,
    required List<WorkoutSessionDto> sessions,
    required List<ExerciseStatPoint> e1rmHistory,
    required List<ExerciseStatPoint> volumeHistory,
    required List<ExerciseStatPoint> bestSetVolumeHistory,
  }) = ExerciseDetailLoaded;

  const factory ExerciseDetailState.error(String message) = ExerciseDetailError;
}

/// A stat point for exercise performance charts (e.g. volume or e1RM over time).
class ExerciseStatPoint {
  final DateTime date;
  final double value;

  const ExerciseStatPoint({required this.date, required this.value});
}
