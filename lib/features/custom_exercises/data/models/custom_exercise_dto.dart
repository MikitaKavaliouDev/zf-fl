import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_exercise_dto.freezed.dart';
part 'custom_exercise_dto.g.dart';

@freezed
abstract class CustomExerciseDto with _$CustomExerciseDto {
  const factory CustomExerciseDto({
    required String id,
    required String name,
    required String metricType,
    String? muscleGroup,
    String? equipment,
    String? description,
    String? videoUrl,
    String? createdAt,
    String? updatedAt,
  }) = _CustomExerciseDto;

  const CustomExerciseDto._();

  factory CustomExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$CustomExerciseDtoFromJson(json);
}
