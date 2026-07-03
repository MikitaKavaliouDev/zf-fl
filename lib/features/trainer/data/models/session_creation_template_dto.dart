import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_creation_program_ref_dto.dart';

part 'session_creation_template_dto.freezed.dart';
part 'session_creation_template_dto.g.dart';

@freezed
abstract class SessionCreationTemplateDto with _$SessionCreationTemplateDto {
  const factory SessionCreationTemplateDto({
    required String id,
    required String name,
    required SessionCreationProgramRefDto program,
  }) = _SessionCreationTemplateDto;

  factory SessionCreationTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$SessionCreationTemplateDtoFromJson(json);
}
