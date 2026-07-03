// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientListItemDto _$TrainerClientListItemDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientListItemDto(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String,
  userId: json['userId'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  lastWorkoutDate: json['lastWorkoutDate'] as String?,
  engagementScore: json['engagementScore'] as String? ?? 'medium',
  activeProgramName: json['activeProgramName'] as String?,
);

Map<String, dynamic> _$TrainerClientListItemDtoToJson(
  _TrainerClientListItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'status': instance.status,
  'userId': instance.userId,
  'avatarUrl': instance.avatarUrl,
  'lastWorkoutDate': instance.lastWorkoutDate,
  'engagementScore': instance.engagementScore,
  'activeProgramName': instance.activeProgramName,
};
