import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_template_exercise_dto.dart';

part 'create_template_request_dto.freezed.dart';
part 'create_template_request_dto.g.dart';

@freezed
abstract class CreateTemplateRequestDto with _$CreateTemplateRequestDto {
  const factory CreateTemplateRequestDto({
    required String name,
    required String programId,
    String? description,
    @Default([]) List<CreateTemplateExerciseDto> exercises,
  }) = _CreateTemplateRequestDto;

  factory CreateTemplateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateRequestDtoFromJson(json);
}
