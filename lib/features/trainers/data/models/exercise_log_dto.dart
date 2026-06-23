import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_dto.dart';

part 'exercise_log_dto.freezed.dart';
part 'exercise_log_dto.g.dart';

@freezed
abstract class ExerciseLogDto with _$ExerciseLogDto {
  const factory ExerciseLogDto({
    required String id,
    required String clientId,
    required String exerciseId,
    int? reps,
    double? weight,
    @Default(false) bool isCompleted,
    int? order,
    String? tempo,
    String? notes,
    int? rpe,
    @Default('BOTH') String side,
    required String workoutSessionId,
    String? supersetKey,
    int? orderInSuperset,
    ExerciseDto? exercise,
  }) = _ExerciseLogDto;

  factory ExerciseLogDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogDtoFromJson(json);
}
