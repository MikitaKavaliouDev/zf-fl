import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_dto.dart';

part 'template_dto.freezed.dart';
part 'template_dto.g.dart';

@freezed
abstract class TemplateDto with _$TemplateDto {
  const factory TemplateDto({
    required String id,
    required String name,
    String? description,
    @Default(<TemplateExerciseDto>[]) List<TemplateExerciseDto> exercises,
  }) = _TemplateDto;

  factory TemplateDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateDtoFromJson(json);
}

@freezed
abstract class TemplateExerciseDto with _$TemplateExerciseDto {
  const factory TemplateExerciseDto({
    required String id,
    @Default(0) int order,
    String? exerciseId,
    String? type,
    String? targetReps,
    int? targetSets,
    int? durationSeconds,
    String? notes,
    ExerciseDto? exercise,
  }) = _TemplateExerciseDto;

  factory TemplateExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateExerciseDtoFromJson(json);
}
