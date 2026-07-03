import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_history_item_dto.freezed.dart';
part 'volume_history_item_dto.g.dart';

@freezed
abstract class VolumeHistoryItemDto with _$VolumeHistoryItemDto {
  const factory VolumeHistoryItemDto({
    required String date,
    required double volume,
  }) = _VolumeHistoryItemDto;

  factory VolumeHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$VolumeHistoryItemDtoFromJson(json);
}
