// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(
      userId: json['userId'] as String,
      message: json['message'] as String,
      requiresSubscription: json['requiresSubscription'] as bool,
      confirmationRequired: json['confirmationRequired'] as bool,
    );

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'requiresSubscription': instance.requiresSubscription,
      'confirmationRequired': instance.confirmationRequired,
    };
