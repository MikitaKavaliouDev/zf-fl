import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    required String userId,
    String? senderId,
    required String message,
    required String type,
    @JsonKey(name: 'readStatus') required bool readStatus,
    @JsonKey(name: 'createdAt') required int createdAt,
    @Default(0) @JsonKey(name: 'updatedAt') int updatedAt,
    String? targetRole,
    String? metadata,
    @Default('synced') @JsonKey(name: 'syncStatus') String syncStatus,
  }) = _NotificationDto;

  const NotificationDto._();

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
