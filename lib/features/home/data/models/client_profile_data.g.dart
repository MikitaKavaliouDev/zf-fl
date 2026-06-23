// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientProfileData _$ClientProfileDataFromJson(
  Map<String, dynamic> json,
) => _ClientProfileData(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  trainer: json['trainer'] == null
      ? null
      : ClientDashboardTrainer.fromJson(
          json['trainer'] as Map<String, dynamic>,
        ),
  workoutSessions:
      (json['workoutSessions'] as List<dynamic>?)
          ?.map((e) => ClientRecentSession.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ClientRecentSession>[],
  measurements:
      (json['measurements'] as List<dynamic>?)
          ?.map((e) => DashboardMeasurement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DashboardMeasurement>[],
  remainingCredits: (json['remainingCredits'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientProfileDataToJson(_ClientProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'trainer': instance.trainer,
      'workoutSessions': instance.workoutSessions,
      'measurements': instance.measurements,
      'remainingCredits': instance.remainingCredits,
    };
