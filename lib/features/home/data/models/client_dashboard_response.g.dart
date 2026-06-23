// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientDashboardResponse _$ClientDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _ClientDashboardResponse(
  clientData: ClientProfileData.fromJson(
    json['clientData'] as Map<String, dynamic>,
  ),
  weightUnit: json['weightUnit'] as String,
  upcomingClientSessions:
      (json['upcomingClientSessions'] as List<dynamic>?)
          ?.map(
            (e) => ClientDashboardSession.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ClientDashboardSession>[],
  lastCheckIn: json['lastCheckIn'] == null
      ? null
      : DateTime.parse(json['lastCheckIn'] as String),
);

Map<String, dynamic> _$ClientDashboardResponseToJson(
  _ClientDashboardResponse instance,
) => <String, dynamic>{
  'clientData': instance.clientData,
  'weightUnit': instance.weightUnit,
  'upcomingClientSessions': instance.upcomingClientSessions,
  'lastCheckIn': instance.lastCheckIn?.toIso8601String(),
};
