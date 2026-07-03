import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_template_exercise_dto.dart';

part 'trainer_template_summary_dto.freezed.dart';
part 'trainer_template_summary_dto.g.dart';

/// Extract exercise count from Prisma's {_count: {exercises: N}} format.
/// Must be a top-level function (not a class static method) so freezed
/// generated code can reference it across library boundaries.
int countToExerciseCount(Map<String, dynamic>? json) {
  if (json == null) return 0;
  return (json['exercises'] as num?)?.toInt() ?? 0;
}

/// Convert the backend `exercises` JSON array (from the templates list query)
/// into [CreateTemplateExerciseDto] list for reuse when copying a template.
///
/// The backend `GET /api/trainer/programs` returns templates with full exercise
/// data (exerciseId, targetReps, durationSeconds, notes, order, etc.).
/// This converter captures that data so we can pass it inline when creating a
/// new template from a library template.
List<CreateTemplateExerciseDto> exerciseListFromJson(List<dynamic>? json) {
  if (json == null || json.isEmpty) return const [];
  return json.map((e) {
    final m = e as Map<String, dynamic>;
    return CreateTemplateExerciseDto(
      exerciseId: m['exerciseId'] as String? ?? '',
      targetReps: m['targetReps'] as String?,
      targetSets: m['targetSets'] as int?,
      durationSeconds: m['durationSeconds'] as int?,
      notes: m['notes'] as String?,
      order: m['order'] as int?,
    );
  }).toList();
}

@freezed
abstract class TrainerTemplateSummaryDto with _$TrainerTemplateSummaryDto {
  const factory TrainerTemplateSummaryDto({
    required String id,
    required String name,
    String? description,
    required int order,
    String? programId,
    @JsonKey(name: '_count', fromJson: countToExerciseCount)
    @Default(0)
    int exerciseCount,
    @JsonKey(name: 'exercises', fromJson: exerciseListFromJson)
    @Default([])
    List<CreateTemplateExerciseDto> exercises,
  }) = _TrainerTemplateSummaryDto;

  factory TrainerTemplateSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerTemplateSummaryDtoFromJson(json);
}
