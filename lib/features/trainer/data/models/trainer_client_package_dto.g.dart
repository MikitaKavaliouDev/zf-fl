// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientPackageDto _$TrainerClientPackageDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientPackageDto(
  id: json['id'] as String,
  clientId: json['clientId'] as String,
  packageId: json['packageId'] as String,
  sessionsRemaining: (json['sessionsRemaining'] as num?)?.toInt() ?? 0,
  purchaseDate: json['purchaseDate'] as String,
  package: ClientPackageInfo.fromJson(json['package'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrainerClientPackageDtoToJson(
  _TrainerClientPackageDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientId': instance.clientId,
  'packageId': instance.packageId,
  'sessionsRemaining': instance.sessionsRemaining,
  'purchaseDate': instance.purchaseDate,
  'package': instance.package,
};

_ClientPackageInfo _$ClientPackageInfoFromJson(Map<String, dynamic> json) =>
    _ClientPackageInfo(
      name: json['name'] as String,
      numberOfSessions: (json['numberOfSessions'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ClientPackageInfoToJson(_ClientPackageInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'numberOfSessions': instance.numberOfSessions,
    };
