// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_library_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramLibraryResponse _$ProgramLibraryResponseFromJson(
  Map<String, dynamic> json,
) => _ProgramLibraryResponse(
  userPrograms:
      (json['userPrograms'] as List<dynamic>?)
          ?.map(
            (e) => TrainerProgramBriefDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  systemTemplates:
      (json['systemTemplates'] as List<dynamic>?)
          ?.map(
            (e) =>
                TrainerTemplateSummaryDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  userTemplates:
      (json['userTemplates'] as List<dynamic>?)
          ?.map(
            (e) =>
                TrainerTemplateSummaryDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProgramLibraryResponseToJson(
  _ProgramLibraryResponse instance,
) => <String, dynamic>{
  'userPrograms': instance.userPrograms,
  'systemTemplates': instance.systemTemplates,
  'userTemplates': instance.userTemplates,
};
