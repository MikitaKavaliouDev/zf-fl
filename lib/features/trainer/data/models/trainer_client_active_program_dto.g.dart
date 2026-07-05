// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_active_program_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientActiveProgramDto _$TrainerClientActiveProgramDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientActiveProgramDto(
  program: ProgramInfo.fromJson(json['program'] as Map<String, dynamic>),
  progress: ProgramProgress.fromJson(json['progress'] as Map<String, dynamic>),
  templates:
      (json['templates'] as List<dynamic>?)
          ?.map(
            (e) => TrainerClientProgramTemplateDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <TrainerClientProgramTemplateDto>[],
);

Map<String, dynamic> _$TrainerClientActiveProgramDtoToJson(
  _TrainerClientActiveProgramDto instance,
) => <String, dynamic>{
  'program': instance.program,
  'progress': instance.progress,
  'templates': instance.templates,
};

_ProgramInfo _$ProgramInfoFromJson(Map<String, dynamic> json) => _ProgramInfo(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ProgramInfoToJson(_ProgramInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_ProgramProgress _$ProgramProgressFromJson(Map<String, dynamic> json) =>
    _ProgramProgress(
      completedCount: (json['completedCount'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      progressPercentage:
          (json['progressPercentage'] as num?)?.toDouble() ?? 0.0,
      nextTemplateId: json['nextTemplateId'] as String?,
    );

Map<String, dynamic> _$ProgramProgressToJson(_ProgramProgress instance) =>
    <String, dynamic>{
      'completedCount': instance.completedCount,
      'totalCount': instance.totalCount,
      'progressPercentage': instance.progressPercentage,
      'nextTemplateId': instance.nextTemplateId,
    };
