// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_program_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignedProgramDto _$AssignedProgramDtoFromJson(Map<String, dynamic> json) =>
    _AssignedProgramDto(
      assignmentId: json['assignmentId'] as String,
      startDate: json['startDate'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      program: ProgramDto.fromJson(json['program'] as Map<String, dynamic>),
      source: json['source'] as String? ?? 'assigned',
    );

Map<String, dynamic> _$AssignedProgramDtoToJson(_AssignedProgramDto instance) =>
    <String, dynamic>{
      'assignmentId': instance.assignmentId,
      'startDate': instance.startDate,
      'isActive': instance.isActive,
      'program': instance.program,
      'source': instance.source,
    };
