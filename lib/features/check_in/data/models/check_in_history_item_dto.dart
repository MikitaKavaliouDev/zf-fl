import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_history_item_dto.freezed.dart';
part 'check_in_history_item_dto.g.dart';

@freezed
abstract class CheckInHistoryItemDto with _$CheckInHistoryItemDto {
  const factory CheckInHistoryItemDto({
    required String id,
    required DateTime date,
    required String status,
    required bool hasFeedback,
    required int photoCount,
    DateTime? reviewedAt,
  }) = _CheckInHistoryItemDto;

  factory CheckInHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInHistoryItemDtoFromJson(json);
}
