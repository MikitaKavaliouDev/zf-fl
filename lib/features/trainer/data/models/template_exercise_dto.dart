import 'package:freezed_annotation/freezed_annotation.dart';

import 'template_exercise_ref_dto.dart';

part 'template_exercise_dto.freezed.dart';
part 'template_exercise_dto.g.dart';

@freezed
abstract class TemplateExerciseDto with _$TemplateExerciseDto {
  const factory TemplateExerciseDto({
    required String id,
    @Default('EXERCISE') String type,
    String? exerciseId,
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
    TemplateExerciseRefDto? exercise,
    int? order,
    String? templateId,
  }) = _TemplateExerciseDto;

  factory TemplateExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateExerciseDtoFromJson(json);
}
