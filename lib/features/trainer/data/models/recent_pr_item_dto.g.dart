// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_pr_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentPrItemDto _$RecentPrItemDtoFromJson(Map<String, dynamic> json) =>
    _RecentPrItemDto(
      exercise: json['exercise'] as String,
      value: (json['value'] as num).toDouble(),
      type: json['type'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$RecentPrItemDtoToJson(_RecentPrItemDto instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'value': instance.value,
      'type': instance.type,
      'date': instance.date,
    };
