import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/notification_dto.dart';

/// Response shape from the paginated GET /api/notifications endpoint.
class NotificationListResponse {
  final List<NotificationDto> notifications;
  final int total;
  final int page;
  final int pageSize;
  final bool hasMore;

  const NotificationListResponse({
    required this.notifications,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.hasMore,
  });

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['notifications'] as List<dynamic>?)
            ?.map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return NotificationListResponse(
      notifications: list,
      total: json['total'] as int? ?? list.length,
      page: json['page'] as int? ?? 1,
      pageSize: json['pageSize'] as int? ?? 20,
      hasMore: json['hasMore'] as bool? ?? false,
    );
  }
}

@injectable
class NotificationApiService {
  final Dio _dio;

  NotificationApiService(this._dio);

  /// GET /api/notifications — fetch paginated notifications.
  Future<NotificationListResponse> fetchNotifications({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _dio.get(
      '/api/notifications',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final rawData = response.data['data'] as Map<String, dynamic>? ?? {};
    return NotificationListResponse.fromJson(rawData);
  }

  /// PUT /api/notifications/:id — mark a single notification as read.
  Future<void> markAsRead(String id) async {
    await _dio.put('/api/notifications/$id');
  }

  /// PUT /api/notifications/read-all — mark all notifications as read.
  Future<void> markAllAsRead() async {
    await _dio.put('/api/notifications/read-all');
  }

  /// POST /api/notifications/:id/accept — accept a request notification.
  Future<void> acceptRequest(String id) async {
    await _dio.post('/api/notifications/$id/accept');
  }

  /// POST /api/notifications/:id/decline — decline a request notification.
  Future<void> declineRequest(String id) async {
    await _dio.post('/api/notifications/$id/decline');
  }

  /// DELETE /api/notifications/:id — delete a single notification.
  Future<void> delete(String id) async {
    await _dio.delete('/api/notifications/$id');
  }

  /// DELETE /api/notifications — delete all notifications.
  Future<void> deleteAll() async {
    await _dio.delete('/api/notifications');
  }
}
