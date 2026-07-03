import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_assessment_dto.freezed.dart';
part 'trainer_assessment_dto.g.dart';

@freezed
abstract class TrainerAssessmentDto with _$TrainerAssessmentDto {
  const factory TrainerAssessmentDto({
    required String id,
    required String name,
    String? description,
    required String unit,
    String? trainerId,
    required String createdAt,
  }) = _TrainerAssessmentDto;

  factory TrainerAssessmentDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerAssessmentDtoFromJson(json);
}
