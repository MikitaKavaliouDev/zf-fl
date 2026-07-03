// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_program_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignProgramRequestDto _$AssignProgramRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AssignProgramRequestDto(
  programId: json['programId'] as String,
  startDate: json['startDate'] as String?,
  frequency: json['frequency'] as String? ?? '3 sessions / week',
);

Map<String, dynamic> _$AssignProgramRequestDtoToJson(
  _AssignProgramRequestDto instance,
) => <String, dynamic>{
  'programId': instance.programId,
  'startDate': instance.startDate,
  'frequency': instance.frequency,
};
