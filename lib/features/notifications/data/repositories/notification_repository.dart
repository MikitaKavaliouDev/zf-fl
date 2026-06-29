import 'package:injectable/injectable.dart';

import '../api/notification_api_service.dart';
import '../models/notification_dto.dart';

/// Paginated notification response from the repository layer.
class PaginatedNotifications {
  final List<NotificationDto> notifications;
  final bool hasMore;
  final int currentPage;

  const PaginatedNotifications({
    required this.notifications,
    required this.hasMore,
    required this.currentPage,
  });
}

@singleton
class NotificationRepository {
  final NotificationApiService _api;

  NotificationRepository(this._api);

  /// Fetch notifications for the given [page], sorted newest-first.
  Future<PaginatedNotifications> fetchNotifications({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _api.fetchNotifications(page: page, pageSize: pageSize);
    response.notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return PaginatedNotifications(
      notifications: response.notifications,
      hasMore: response.hasMore,
      currentPage: response.page,
    );
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
