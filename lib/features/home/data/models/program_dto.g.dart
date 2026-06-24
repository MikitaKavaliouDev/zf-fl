// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramDto _$ProgramDtoFromJson(Map<String, dynamic> json) => _ProgramDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  trainerId: json['trainerId'] as String?,
  category: json['category'] as String?,
  templates:
      (json['templates'] as List<dynamic>?)
          ?.map((e) => TemplateDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TemplateDto>[],
  templateLabels:
      (json['templateLabels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  isScheduled: json['isScheduled'] as bool? ?? false,
  scheduledStartDate: (json['scheduledStartDate'] as num?)?.toInt(),
  scheduleFrequency: json['scheduleFrequency'] as String?,
  activeTemplateIndex: (json['activeTemplateIndex'] as num?)?.toInt() ?? 0,
  trainerName: json['trainerName'] as String?,
  trainerAvatarUrl: json['trainerAvatarUrl'] as String?,
  source: json['source'] as String?,
  assignmentId: json['assignmentId'] as String?,
  startDate: (json['startDate'] as num?)?.toInt(),
  isActive: json['isActive'] as bool? ?? false,
);

Map<String, dynamic> _$ProgramDtoToJson(_ProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'trainerId': instance.trainerId,
      'category': instance.category,
      'templates': instance.templates,
      'templateLabels': instance.templateLabels,
      'isScheduled': instance.isScheduled,
      'scheduledStartDate': instance.scheduledStartDate,
      'scheduleFrequency': instance.scheduleFrequency,
      'activeTemplateIndex': instance.activeTemplateIndex,
      'trainerName': instance.trainerName,
      'trainerAvatarUrl': instance.trainerAvatarUrl,
      'source': instance.source,
      'assignmentId': instance.assignmentId,
      'startDate': instance.startDate,
      'isActive': instance.isActive,
    };
