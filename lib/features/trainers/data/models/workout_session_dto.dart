import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session_dto.freezed.dart';
part 'workout_session_dto.g.dart';

@freezed
abstract class WorkoutSessionDto with _$WorkoutSessionDto {
  const factory WorkoutSessionDto({
    required String id,
    required String clientId,
    required String startTime,
    String? endTime,
    String? status,
    String? name,
    String? notes,
    String? restStartedAt,
    String? workoutTemplateId,
    String? clientPackageId,
    @Default(false) bool isTrainerLed,
  }) = _WorkoutSessionDto;

  factory WorkoutSessionDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionDtoFromJson(json);
}
