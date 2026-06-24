import 'package:injectable/injectable.dart';

import '../api/notification_api_service.dart';
import '../models/notification_dto.dart';

@singleton
class NotificationRepository {
  final NotificationApiService _api;

  NotificationRepository(this._api);

  /// Fetch all notifications, sorted newest-first.
  Future<List<NotificationDto>> fetchNotifications() async {
    final notifications = await _api.fetchNotifications();
    notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notifications;
  }

  /// Mark a single notification as read.
  Future<void> markAsRead(String id) => _api.markAsRead(id);

  /// Mark all notifications as read.
  Future<void> markAllAsRead() => _api.markAllAsRead();

  /// Accept a trainer request notification.
  Future<void> acceptRequest(String id) => _api.acceptRequest(id);

  /// Decline a trainer request notification.
  Future<void> declineRequest(String id) => _api.declineRequest(id);
}
