// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_benefit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerBenefitDto _$TrainerBenefitDtoFromJson(Map<String, dynamic> json) =>
    _TrainerBenefitDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$TrainerBenefitDtoToJson(_TrainerBenefitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'iconName': instance.iconName,
    };
