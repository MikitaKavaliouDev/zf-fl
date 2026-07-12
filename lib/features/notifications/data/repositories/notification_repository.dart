import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/network/response_cache.dart';
import '../../../sync/cubit/sync_cubit.dart';
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
  final AppDatabase _db;
  final ResponseCache _cache;

  NotificationRepository(this._api, this._db, this._cache);

  /// Fetch notifications for the given [page], sorted newest-first.
  ///
  /// Drift-first with background API refresh. Returns local data immediately
  /// (no loading flash) while triggering a silent background refresh. When
  /// [forceRefresh] is true or [page] > 1, skips the local database.
  Future<PaginatedNotifications> fetchNotifications({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    // Pagination beyond the first page always goes to the API.
    if (page > 1) {
      return _refreshFromApi(page: page, pageSize: pageSize);
    }

    // 1. Read from Drift first (unless forced refresh).
    if (!forceRefresh) {
      final local = await _getLocalNotifications();
      if (local.isNotEmpty) {
        // Fire-and-forget background refresh from the API.
        unawaited(_backgroundRefresh(page: page, pageSize: pageSize));
        return PaginatedNotifications(
          notifications: local,
          hasMore: false,
          currentPage: 1,
        );
      }
    }

    // 2. No local data or forced refresh — await the network call.
    return _refreshFromApi(page: page, pageSize: pageSize);
  }

  /// Query local Drift for non-deleted notifications, newest first.
  Future<List<NotificationDto>> _getLocalNotifications() async {
    try {
      final rows = await (_db.select(_db.notifications)
            ..where((t) => t.deletedAt.isNull())
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
            ]))
          .get();
      return rows.map(_entityToDto).toList();
    } catch (e) {
      developer.log('Failed to read local notifications: $e',
          name: 'notifications');
      return [];
    }
  }

  /// Fire-and-forget background refresh from the API, updating Drift silently.
  Future<void> _backgroundRefresh({int page = 1, int pageSize = 20}) async {
    try {
      final response = await _api.fetchNotifications(page: page, pageSize: pageSize);
      await _replaceDriftData(response.notifications);
    } catch (e) {
      developer.log('Background notification refresh failed: $e',
          name: 'notifications');
    }
  }

  /// Fetch from API and replace Drift data, returning [PaginatedNotifications].
  Future<PaginatedNotifications> _refreshFromApi({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _api.fetchNotifications(page: page, pageSize: pageSize);
    response.notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    await _replaceDriftData(response.notifications);
    return PaginatedNotifications(
      notifications: response.notifications,
      hasMore: response.hasMore,
      currentPage: response.page,
    );
  }

  /// Replace all Drift notifications for this user with API data.
  Future<void> _replaceDriftData(List<NotificationDto> notifications) async {
    if (notifications.isEmpty) return;
    final userId = notifications.first.userId;
    await _db.transaction(() async {
      await (_db.delete(_db.notifications)
            ..where((t) => t.userId.equals(userId)))
          .go();
      for (final dto in notifications) {
        await _db.into(_db.notifications).insert(
              _dtoToCompanion(dto),
              mode: InsertMode.insertOrReplace,
            );
      }
    });
  }

  /// Map a [NotificationDto] to a [NotificationsCompanion] for Drift inserts.
  NotificationsCompanion _dtoToCompanion(NotificationDto dto) {
    final metaJson = <String, dynamic>{
      'senderId': dto.senderId,
      'targetRole': dto.targetRole,
      'metadata': dto.metadata,
    };
    return NotificationsCompanion(
      id: Value(dto.id),
      userId: Value(dto.userId),
      message: Value(dto.message),
      type: Value(dto.type),
      readStatus: Value(dto.readStatus),
      metadata: Value(jsonEncode(metaJson)),
      createdAt: Value(dto.createdAt),
      updatedAt: Value(dto.updatedAt),
      syncStatus: Value(dto.syncStatus),
    );
  }

  /// Map a Drift [NotificationEntity] back to a [NotificationDto].
  ///
  /// Fields stored in the Drift `metadata` column (senderId, targetRole,
  /// original metadata) are parsed from the embedded JSON envelope.
  NotificationDto _entityToDto(NotificationEntity entity) {
    String? senderId;
    String? targetRole;
    String? innerMetadata;

    if (entity.metadata != null) {
      try {
        final parsed = jsonDecode(entity.metadata!) as Map<String, dynamic>;
        senderId = parsed['senderId'] as String?;
        targetRole = parsed['targetRole'] as String?;
        innerMetadata = parsed['metadata'] as String?;
      } catch (_) {
        // If parsing fails, use the raw metadata value as-is.
        innerMetadata = entity.metadata;
      }
    }

    return NotificationDto(
      id: entity.id,
      userId: entity.userId,
      senderId: senderId,
      message: entity.message,
      type: entity.type,
      readStatus: entity.readStatus,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      targetRole: targetRole,
      metadata: innerMetadata,
      syncStatus: entity.syncStatus,
    );
  }

  /// Invalidate cached notification data — clears the Drift notifications table.
  Future<void> invalidateCache() async {
    await (_db.delete(_db.notifications)).go();
  }

  /// Mark a single notification as read (offline-first with sync trigger).
  Future<void> markAsRead(String id) async {
    await (_db.update(_db.notifications)
          ..where((t) => t.id.equals(id)))
        .write(const NotificationsCompanion(
          readStatus: Value(true),
          syncStatus: Value('pending'),
        ));
    unawaited(GetIt.instance<SyncCubit>().sync());
  }

  /// Mark all unread, non-deleted notifications as read.
  Future<void> markAllAsRead() async {
    await (_db.update(_db.notifications)
          ..where((t) =>
              t.readStatus.equals(false) & t.deletedAt.isNull()))
        .write(const NotificationsCompanion(
          readStatus: Value(true),
          syncStatus: Value('pending'),
        ));
    unawaited(GetIt.instance<SyncCubit>().sync());
  }

  /// Soft-delete a single notification in Drift and trigger sync.
  Future<void> deleteNotification(String id) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (_db.update(_db.notifications)
          ..where((t) => t.id.equals(id)))
        .write(NotificationsCompanion(
          deletedAt: Value(now),
          syncStatus: const Value('pending'),
          updatedAt: Value(now),
        ));
    unawaited(GetIt.instance<SyncCubit>().sync());
  }

  /// Soft-delete all non-deleted notifications in Drift and trigger sync.
  Future<void> deleteAllNotifications() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (_db.update(_db.notifications)
          ..where((t) => t.deletedAt.isNull()))
        .write(NotificationsCompanion(
          deletedAt: Value(now),
          syncStatus: const Value('pending'),
          updatedAt: Value(now),
        ));
    unawaited(GetIt.instance<SyncCubit>().sync());
  }

  /// Accept a trainer request notification.
  ///
  /// Calls the API first; on success soft-deletes from Drift.
  Future<void> acceptRequest(String id) async {
    try {
      await _api.acceptRequest(id);
      final now = DateTime.now().millisecondsSinceEpoch;
      await (_db.update(_db.notifications)
            ..where((t) => t.id.equals(id)))
          .write(NotificationsCompanion(
            deletedAt: Value(now),
            syncStatus: const Value('synced'),
          ));
    } catch (e) {
      developer.log('acceptRequest failed: $e', name: 'notifications');
      rethrow;
    }
  }

  /// Decline a trainer request notification.
  ///
  /// Calls the API first; on success soft-deletes from Drift.
  Future<void> declineRequest(String id) async {
    try {
      await _api.declineRequest(id);
      final now = DateTime.now().millisecondsSinceEpoch;
      await (_db.update(_db.notifications)
            ..where((t) => t.id.equals(id)))
          .write(NotificationsCompanion(
            deletedAt: Value(now),
            syncStatus: const Value('synced'),
          ));
    } catch (e) {
      developer.log('declineRequest failed: $e', name: 'notifications');
      rethrow;
    }
  }
}
