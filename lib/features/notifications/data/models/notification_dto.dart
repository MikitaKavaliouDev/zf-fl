import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

/// Helper function to parse dynamic dates (both ISO 8601 strings and unix timestamp ints)
/// to integer epoch milliseconds.
int _parseDateToInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) {
      return parsed.millisecondsSinceEpoch;
    }
    final numValue = num.tryParse(value);
    if (numValue != null) return numValue.toInt();
  }
  return 0;
}

@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    required String userId,
    String? senderId,
    required String message,
    required String type,
    @JsonKey(name: 'readStatus') required bool readStatus,
    @JsonKey(name: 'createdAt', fromJson: _parseDateToInt) required int createdAt,
    @JsonKey(name: 'updatedAt', fromJson: _parseDateToInt) @Default(0) int updatedAt,
    String? targetRole,
    String? metadata,
    @Default('synced') @JsonKey(name: 'syncStatus') String syncStatus,
  }) = _NotificationDto;

  const NotificationDto._();

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
      