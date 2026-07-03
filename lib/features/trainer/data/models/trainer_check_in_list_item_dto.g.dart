// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_check_in_list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerCheckInListItemDto _$TrainerCheckInListItemDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerCheckInListItemDto(
  id: json['id'] as String,
  clientId: json['clientId'] as String,
  date: json['date'] as String,
  status: json['status'] as String,
  trainerResponse: json['trainerResponse'] as String?,
  reviewedAt: json['reviewedAt'] as String?,
  client: CheckInClientRefDto.fromJson(json['client'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrainerCheckInListItemDtoToJson(
  _TrainerCheckInListItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientId': instance.clientId,
  'date': instance.date,
  'status': instance.status,
  'trainerResponse': instance.trainerResponse,
  'reviewedAt': instance.reviewedAt,
  'client': instance.client,
};
