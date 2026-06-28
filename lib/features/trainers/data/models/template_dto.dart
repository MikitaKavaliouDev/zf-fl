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
    @Default(0) int exerciseCount,
    String? programId,
    @Default(0) int order,
    String? category,
    String? source,
    String? programName,
  }) = _TemplateDto;

  factory TemplateDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateDtoFromJson(_preprocessTemplateJson(json));

  /// Flatten Prisma `_count.exercises` into `exerciseCount`.
  /// The API returns `_count: { exercises: N }` for templates in list views,
  /// but the DTO needs a flat `exerciseCount` field.
  static Map<String, dynamic> _preprocessTemplateJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('_count') && json['_count'] is Map) {
      final count = json['_count'] as Map<String, dynamic>;
      json['exerciseCount'] = count['exercises'] ?? 0;
      // Remove _count to avoid unknown-key issues
      json.remove('_count');
    }
    return json;
  }
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
      