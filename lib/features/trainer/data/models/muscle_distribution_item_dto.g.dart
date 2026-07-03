// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_distribution_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuscleDistributionItemDto _$MuscleDistributionItemDtoFromJson(
  Map<String, dynamic> json,
) => _MuscleDistributionItemDto(
  muscle: json['muscle'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$MuscleDistributionItemDtoToJson(
  _MuscleDistributionItemDto instance,
) => <String, dynamic>{'muscle': instance.muscle, 'count': instance.count};
