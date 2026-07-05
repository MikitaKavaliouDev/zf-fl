import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_client_program_template_dto.freezed.dart';
part 'trainer_client_program_template_dto.g.dart';

@freezed
abstract class TrainerClientProgramTemplateDto
    with _$TrainerClientProgramTemplateDto {
  const factory TrainerClientProgramTemplateDto({
    required String id,
    required String name,
    String? description,
    @Default(0) int order,
    @Default('PENDING') String status,
    @Default(0) int exerciseCount,
  }) = _TrainerClientProgramTemplateDto;

  factory TrainerClientProgramTemplateDto.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerClientProgramTemplateDtoFromJson(json);
}
