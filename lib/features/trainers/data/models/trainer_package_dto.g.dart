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
      currency: json['currency'] as String?,
      numberOfSessions: (json['numberOfSessions'] as num).toInt(),
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$TrainerPackageDtoToJson(_TrainerPackageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'numberOfSessions': instance.numberOfSessions,
      'isActive': instance.isActive,
    };
