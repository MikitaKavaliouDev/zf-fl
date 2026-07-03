import 'package:freezed_annotation/freezed_annotation.dart';

part 'assign_program_response_dto.freezed.dart';
part 'assign_program_response_dto.g.dart';

@freezed
abstract class AssignProgramResponseDto with _$AssignProgramResponseDto {
  const factory AssignProgramResponseDto({
    Map<String, dynamic>? assignment,
    required int sessionCount,
  }) = _AssignProgramResponseDto;

  factory AssignProgramResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AssignProgramResponseDtoFromJson(json);
}
