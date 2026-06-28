// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramDetailResponse _$ProgramDetailResponseFromJson(
  Map<String, dynamic> json,
) => _ProgramDetailResponse(
  program: ProgramDto.fromJson(json['program'] as Map<String, dynamic>),
  isActive: json['isActive'] as bool? ?? false,
);

Map<String, dynamic> _$ProgramDetailResponseToJson(
  _ProgramDetailResponse instance,
) => <String, dynamic>{
  'program': instance.program,
  'isActive': instance.isActive,
};
