// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String?,
  role: json['role'] as String,
  username: json['username'] as String?,
  tier: json['tier'] as String?,
  hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool,
  clientId: json['clientId'] as String?,
  subscriptionStatus: json['subscriptionStatus'] as String?,
  profilePhotoPath: json['profilePhotoPath'] as String?,
  isFreeAccessModeEnabled: json['isFreeAccessModeEnabled'] as bool?,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'role': instance.role,
  'username': instance.username,
  'tier': instance.tier,
  'hasCompletedOnboarding': instance.hasCompletedOnboarding,
  'clientId': instance.clientId,
  'subscriptionStatus': instance.subscriptionStatus,
  'profilePhotoPath': instance.profilePhotoPath,
  'isFreeAccessModeEnabled': instance.isFreeAccessModeEnabled,
  'metadata': instance.metadata,
};
