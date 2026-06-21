// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    _RefreshResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAt: (json['expiresAt'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshResponseToJson(_RefreshResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresAt': instance.expiresAt,
      'user': instance.user,
    };
