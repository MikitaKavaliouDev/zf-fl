// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_summary_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientSummaryItemDto _$ClientSummaryItemDtoFromJson(
  Map<String, dynamic> json,
) => _ClientSummaryItemDto(
  date: json['date'] as String,
  clientId: json['clientId'] as String,
  clientFirstName: json['clientFirstName'] as String,
  clientLastName: json['clientLastName'] as String,
  clientAvatarUrl: json['clientAvatarUrl'] as String?,
);

Map<String, dynamic> _$ClientSummaryItemDtoToJson(
  _ClientSummaryItemDto instance,
) => <String, dynamic>{
  'date': instance.date,
  'clientId': instance.clientId,
  'clientFirstName': instance.clientFirstName,
  'clientLastName': instance.clientLastName,
  'clientAvatarUrl': instance.clientAvatarUrl,
};
