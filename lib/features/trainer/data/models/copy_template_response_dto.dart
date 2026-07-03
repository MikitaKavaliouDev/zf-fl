import 'package:freezed_annotation/freezed_annotation.dart';

part 'copy_template_response_dto.freezed.dart';
part 'copy_template_response_dto.g.dart';

@freezed
abstract class CopyTemplateResponseDto with _$CopyTemplateResponseDto {
  const factory CopyTemplateResponseDto({
    Map<String, dynamic>? newTemplate,
    Map<String, dynamic>? newProgram,
  }) = _CopyTemplateResponseDto;

  factory CopyTemplateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CopyTemplateResponseDtoFromJson(json);
}
