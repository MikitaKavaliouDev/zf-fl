// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolumeHistoryItemDto _$VolumeHistoryItemDtoFromJson(
  Map<String, dynamic> json,
) => _VolumeHistoryItemDto(
  date: json['date'] as String,
  volume: (json['volume'] as num).toDouble(),
);

Map<String, dynamic> _$VolumeHistoryItemDtoToJson(
  _VolumeHistoryItemDto instance,
) => <String, dynamic>{'date': instance.date, 'volume': instance.volume};
