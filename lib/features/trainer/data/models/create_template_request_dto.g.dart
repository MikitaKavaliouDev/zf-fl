// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_template_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTemplateRequestDto _$CreateTemplateRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateTemplateRequestDto(
  name: json['name'] as String,
  programId: json['programId'] as String,
  description: json['description'] as String?,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map(
            (e) =>
                CreateTemplateExerciseDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$CreateTemplateRequestDtoToJson(
  _CreateTemplateRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'programId': instance.programId,
  'description': instance.description,
  'exercises': instance.exercises,
};
