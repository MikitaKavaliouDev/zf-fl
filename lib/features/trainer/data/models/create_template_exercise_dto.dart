import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_template_exercise_dto.freezed.dart';
part 'create_template_exercise_dto.g.dart';

/// An exercise entry for inline creation within a template.
///
/// Matches the backend Zod schema at
/// `POST /api/trainer/programs/templates` → `exercises[]` shape:
/// ```ts
/// { exerciseId: string, targetReps?: string, targetSets?: number,
///   durationSeconds?: number, notes?: string, order?: number }
/// ```
@freezed
abstract class CreateTemplateExerciseDto with _$CreateTemplateExerciseDto {
  const factory CreateTemplateExerciseDto({
    required String exerciseId,
    String? targetReps,
    @JsonKey(name: 'targetSets') int? targetSets,
    @JsonKey(name: 'durationSeconds') int? durationSeconds,
    String? notes,
    int? order,
  }) = _CreateTemplateExerciseDto;

  factory CreateTemplateExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateExerciseDtoFromJson(json);
}
