import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_log_dto.dart';
import 'workout_session_dto.dart';

part 'workout_session_response.freezed.dart';
part 'workout_session_response.g.dart';

@freezed
abstract class StartSessionResponse with _$StartSessionResponse {
  const factory StartSessionResponse({
    required WorkoutSessionDto session,
  }) = _StartSessionResponse;

  factory StartSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSessionResponseFromJson(json);
}

@freezed
abstract class LiveSessionResponse with _$LiveSessionResponse {
  const factory LiveSessionResponse({
    WorkoutSessionDto? session,
    @Default([]) List<ExerciseLogDto> exerciseLogs,
  }) = _LiveSessionResponse;

  factory LiveSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionResponseFromJson(json);
}

@freezed
abstract class LogExerciseResponse with _$LogExerciseResponse {
  const factory LogExerciseResponse({
    required ExerciseLogDto log,
    List<dynamic>? newRecords,
  }) = _LogExerciseResponse;

  factory LogExerciseResponse.fromJson(Map<String, dynamic> json) =>
      _$LogExerciseResponseFromJson(json);
}

@freezed
abstract class SessionHistoryResponse with _$SessionHistoryResponse {
  const factory SessionHistoryResponse({
    required List<WorkoutSessionDto> sessions,
    String? nextCursor,
    @Default(false) bool hasMore,
  }) = _SessionHistoryResponse;

  factory SessionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryResponseFromJson(json);
}
