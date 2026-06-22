import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_dto.freezed.dart';
part 'exercise_dto.g.dart';

@freezed
abstract class ExerciseDto with _$ExerciseDto {
  const factory ExerciseDto({
    required String id,
    required String name,
    String? muscleGroup,
    String? equipment,
    String? category,
    String? videoUrl,
    int? recommendedRestSeconds,
    @Default(false) bool isUnilateral,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}
