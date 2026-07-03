import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_exercise_ref_dto.freezed.dart';
part 'template_exercise_ref_dto.g.dart';

@freezed
abstract class TemplateExerciseRefDto with _$TemplateExerciseRefDto {
  const factory TemplateExerciseRefDto({
    required String id,
    required String name,
    String? muscleGroup,
    String? equipment,
    String? description,
    String? videoUrl,
  }) = _TemplateExerciseRefDto;

  factory TemplateExerciseRefDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateExerciseRefDtoFromJson(json);
}
