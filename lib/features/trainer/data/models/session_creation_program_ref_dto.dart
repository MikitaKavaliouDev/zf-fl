import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_creation_program_ref_dto.freezed.dart';
part 'session_creation_program_ref_dto.g.dart';

@freezed
abstract class SessionCreationProgramRefDto
    with _$SessionCreationProgramRefDto {
  const factory SessionCreationProgramRefDto({
    String? trainerId,
  }) = _SessionCreationProgramRefDto;

  factory SessionCreationProgramRefDto.fromJson(
          Map<String, dynamic> json) =>
      _$SessionCreationProgramRefDtoFromJson(json);
}
