// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInHistoryItemDto _$CheckInHistoryItemDtoFromJson(
  Map<String, dynamic> json,
) => _CheckInHistoryItemDto(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  status: json['status'] as String,
  hasFeedback: json['hasFeedback'] as bool,
  photoCount: (json['photoCount'] as num).toInt(),
  reviewedAt: json['reviewedAt'] == null
      ? null
      : DateTime.parse(json['reviewedAt'] as String),
);

Map<String, dynamic> _$CheckInHistoryItemDtoToJson(
  _CheckInHistoryItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'status': instance.status,
  'hasFeedback': instance.hasFeedback,
  'photoCount': instance.photoCount,
  'reviewedAt': instance.reviewedAt?.toIso8601String(),
};
