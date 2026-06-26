import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/exercise_log_dto.dart';
import '../data/models/workout_session_dto.dart';

part 'workout_session_state.freezed.dart';

@freezed
sealed class WorkoutSessionState with _$WorkoutSessionState {
  /// No active session, no history loaded
  const factory WorkoutSessionState.initial() = WorkoutSessionInitial;

  /// Loading session data
  const factory WorkoutSessionState.loading() = WorkoutSessionLoading;

  /// Conflict: another session already active
  const factory WorkoutSessionState.conflict({required String existingSessionId}) = WorkoutSessionConflict;

  /// Active workout session in progress.
  /// Contains the session details and exercise logs.
  const factory WorkoutSessionState.active({
    required WorkoutSessionDto session,
    @Default(<ExerciseLogDto>[]) List<ExerciseLogDto> logs,
    required Duration elapsed,
    @Default(false) bool isPaused,
    @Default(false) bool isMinimized,
    DateTime? restStartedAt,
    @Default(Duration.zero) Duration restElapsed,
    DateTime? startTime,
    int? restDuration,
    int? restRemaining,
    @Default(false) bool showLongSessionWarning,
    @Default(false) bool showRestFinishedToast,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> sessionNewRecords,
    @Default(false) bool newPrRecord,
  }) = WorkoutSessionActive;

  /// Session completed successfully
  const factory WorkoutSessionState.completed({
    required WorkoutSessionDto session,
    required Duration totalDuration,
    @Default(<ExerciseLogDto>[]) List<ExerciseLogDto> logs,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> newRecords,
    @Default(false) bool showPrToast,
  }) = WorkoutSessionCompleted;

  /// Error state
  const factory WorkoutSessionState.error(String message) = WorkoutSessionError;
}
