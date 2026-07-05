// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientDetailDto _$TrainerClientDetailDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientDetailDto(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  checkInDay: (json['checkInDay'] as num?)?.toInt(),
  checkInHour: (json['checkInHour'] as num?)?.toInt(),
  dateOfBirth: json['dateOfBirth'] as String?,
  goals: json['goals'] as String?,
  healthNotes: json['healthNotes'] as String?,
  emergencyContactName: json['emergencyContactName'] as String?,
  emergencyContactPhone: json['emergencyContactPhone'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  avatarPath: json['avatarPath'] as String?,
  trainerId: json['trainerId'] as String?,
);

Map<String, dynamic> _$TrainerClientDetailDtoToJson(
  _TrainerClientDetailDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'checkInDay': instance.checkInDay,
  'checkInHour': instance.checkInHour,
  'dateOfBirth': instance.dateOfBirth,
  'goals': instance.goals,
  'healthNotes': instance.healthNotes,
  'emergencyContactName': instance.emergencyContactName,
  'emergencyContactPhone': instance.emergencyContactPhone,
  'avatarUrl': instance.avatarUrl,
  'avatarPath': instance.avatarPath,
  'trainerId': instance.trainerId,
};
