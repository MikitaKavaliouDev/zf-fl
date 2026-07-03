import 'package:freezed_annotation/freezed_annotation.dart';

part 'assign_program_request_dto.freezed.dart';
part 'assign_program_request_dto.g.dart';

@freezed
abstract class AssignProgramRequestDto with _$AssignProgramRequestDto {
  const factory AssignProgramRequestDto({
    required String programId,
    String? startDate,
    @Default('3 sessions / week') String frequency,
  }) = _AssignProgramRequestDto;

  factory AssignProgramRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AssignProgramRequestDtoFromJson(json);
}
