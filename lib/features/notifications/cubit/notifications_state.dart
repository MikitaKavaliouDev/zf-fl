import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/notification_dto.dart';

part 'notifications_state.freezed.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;

  const factory NotificationsState.loading() = NotificationsLoading;

  const factory NotificationsState.loaded({
    required List<NotificationDto> notifications,
    @Default(0) int unreadCount,
  }) = NotificationsLoaded;

  const factory NotificationsState.error(String message) = NotificationsError;
}
