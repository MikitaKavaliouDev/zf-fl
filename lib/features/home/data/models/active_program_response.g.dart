// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_program_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActiveProgramResponse _$ActiveProgramResponseFromJson(
  Map<String, dynamic> json,
) => _ActiveProgramResponse(
  program: ProgramBasicInfo.fromJson(json['program'] as Map<String, dynamic>),
  progress: ProgramProgress.fromJson(json['progress'] as Map<String, dynamic>),
  templates: (json['templates'] as List<dynamic>)
      .map((e) => ProgramTemplateStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ActiveProgramResponseToJson(
  _ActiveProgramResponse instance,
) => <String, dynamic>{
  'program': instance.program,
  'progress': instance.progress,
  'templates': instance.templates,
};

_ProgramBasicInfo _$ProgramBasicInfoFromJson(Map<String, dynamic> json) =>
    _ProgramBasicInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProgramBasicInfoToJson(_ProgramBasicInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_ProgramProgress _$ProgramProgressFromJson(Map<String, dynamic> json) =>
    _ProgramProgress(
      completedCount: (json['completedCount'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toInt(),
      nextTemplateId: json['nextTemplateId'] as String?,
    );

Map<String, dynamic> _$ProgramProgressToJson(_ProgramProgress instance) =>
    <String, dynamic>{
      'completedCount': instance.completedCount,
      'totalCount': instance.totalCount,
      'progressPercentage': instance.progressPercentage,
      'nextTemplateId': instance.nextTemplateId,
    };

_ProgramTemplateStatus _$ProgramTemplateStatusFromJson(
  Map<String, dynamic> json,
) => _ProgramTemplateStatus(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  order: (json['order'] as num).toInt(),
  status: json['status'] as String,
  exerciseCount: (json['exerciseCount'] as num).toInt(),
);

Map<String, dynamic> _$ProgramTemplateStatusToJson(
  _ProgramTemplateStatus instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'order': instance.order,
  'status': instance.status,
  'exerciseCount': instance.exerciseCount,
};
