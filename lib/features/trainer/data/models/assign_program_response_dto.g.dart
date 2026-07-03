// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_program_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignProgramResponseDto _$AssignProgramResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AssignProgramResponseDto(
  assignment: json['assignment'] as Map<String, dynamic>?,
  sessionCount: (json['sessionCount'] as num).toInt(),
);

Map<String, dynamic> _$AssignProgramResponseDtoToJson(
  _AssignProgramResponseDto instance,
) => <String, dynamic>{
  'assignment': instance.assignment,
  'sessionCount': instance.sessionCount,
};
