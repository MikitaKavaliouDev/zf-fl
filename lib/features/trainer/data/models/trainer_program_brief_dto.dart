import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_template_summary_dto.dart';

part 'trainer_program_brief_dto.freezed.dart';
part 'trainer_program_brief_dto.g.dart';

@freezed
abstract class TrainerProgramBriefDto with _$TrainerProgramBriefDto {
  const factory TrainerProgramBriefDto({
    required String id,
    required String name,
    String? description,
    String? trainerId,
    String? category,
    required String createdAt,
    String? updatedAt,
    @Default([]) List<TrainerTemplateSummaryDto> templates,
  }) = _TrainerProgramBriefDto;

  factory TrainerProgramBriefDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerProgramBriefDtoFromJson(json);
}
