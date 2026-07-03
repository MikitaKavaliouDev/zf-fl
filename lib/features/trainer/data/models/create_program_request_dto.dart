import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_program_request_dto.freezed.dart';
part 'create_program_request_dto.g.dart';

@freezed
abstract class CreateProgramRequestDto with _$CreateProgramRequestDto {
  const factory CreateProgramRequestDto({
    required String name,
    String? description,
  }) = _CreateProgramRequestDto;

  factory CreateProgramRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProgramRequestDtoFromJson(json);
}
