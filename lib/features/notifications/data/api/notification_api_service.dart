import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/notification_dto.dart';

@injectable
class NotificationApiService {
  final Dio _dio;

  NotificationApiService(this._dio);

  /// GET /api/notifications — fetch all notifications for the current user.
  Future<List<NotificationDto>> fetchNotifications() async {
    final response = await _dio.get('/api/notifications');
    final rawList = response.data['data'];
    if (rawList == null) return [];
    final list = rawList as List<dynamic>;
    return list
        .map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
        .toList();
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
}
