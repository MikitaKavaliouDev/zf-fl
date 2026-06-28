// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      senderId: json['senderId'] as String?,
      message: json['message'] as String,
      type: json['type'] as String,
      readStatus: json['readStatus'] as bool,
      createdAt: _parseDateToInt(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? 0
          : _parseDateToInt(json['updatedAt']),
      targetRole: json['targetRole'] as String?,
      metadata: json['metadata'] as String?,
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'senderId': instance.senderId,
      'message': instance.message,
      'type': instance.type,
      'readStatus': instance.readStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'targetRole': instance.targetRole,
      'metadata': instance.metadata,
      'syncStatus': instance.syncStatus,
    };
