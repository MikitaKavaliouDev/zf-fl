import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_exercise_request_dto.freezed.dart';
part 'create_exercise_request_dto.g.dart';

@freezed
abstract class CreateExerciseRequestDto with _$CreateExerciseRequestDto {
  const factory CreateExerciseRequestDto({
    required String exerciseId,
    String? targetReps,
    int? targetSets,
    int? durationSeconds,
    String? tempo,
    bool? enableRpe,
    String? notes,
    String? videoUrl,
    String? supersetGroupId,
    int? supersetOrder,
    String? exerciseCategory,
    String? metricType,
    double? targetDistanceKm,
    double? targetLevel,
  }) = _CreateExerciseRequestDto;

  factory CreateExerciseRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateExerciseRequestDtoFromJson(json);
}
