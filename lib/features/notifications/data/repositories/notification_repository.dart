import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/network/response_cache.dart';
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
  final ResponseCache _cache;

  NotificationRepository(this._api, this._cache);

  static const _notificationsCacheKey = 'notifications:list';

  /// Fetch notifications for the given [page], sorted newest-first.
  ///
  /// Cache-first with background refresh. Returns cached data immediately
  /// (if available) while triggering a silent background refresh. When
  /// [forceRefresh] is true, bypasses the cache.
  Future<PaginatedNotifications> fetchNotifications({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<NotificationListResponse>(
        _notificationsCacheKey,
        NotificationListResponse.fromJson,
      );
      if (cached != null) {
        cached.notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        return PaginatedNotifications(
          notifications: cached.notifications,
          hasMore: cached.hasMore,
          currentPage: cached.page,
        );
      }
    }
    // 3. No cache — await the network call
    return _refreshNotifications(page: page, pageSize: pageSize);
  }

  /// Internal: fetch from API and persist to cache.
  Future<PaginatedNotifications> _refreshNotifications({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response =
        await _api.fetchNotifications(page: page, pageSize: pageSize);
    response.notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    // Cache on success
    await _cache.set(_notificationsCacheKey, {
      'notifications':
          response.notifications.map((n) => n.toJson()).toList(),
      'total': response.total,
      'page': response.page,
      'pageSize': response.pageSize,
      'hasMore': response.hasMore,
    });
    return PaginatedNotifications(
      notifications: response.notifications,
      hasMore: response.hasMore,
      currentPage: response.page,
    );
  }

  /// Invalidate cached notification list — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_notificationsCacheKey);
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
