// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerPackageDto _$TrainerPackageDtoFromJson(Map<String, dynamic> json) =>
    _TrainerPackageDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: json['price'] as String,
      numberOfSessions: (json['numberOfSessions'] as num).toInt(),
    );

Map<String, dynamic> _$TrainerPackageDtoToJson(_TrainerPackageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'numberOfSessions': instance.numberOfSessions,
    };
