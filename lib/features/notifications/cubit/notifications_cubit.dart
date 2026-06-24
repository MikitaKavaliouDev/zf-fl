import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/notification_dto.dart';
import '../data/repositories/notification_repository.dart';
import '../data/services/notification_realtime_service.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepository _repository;
  final NotificationRealtimeService _realtimeService;
  StreamSubscription<NotificationRealtimeEvent>? _realtimeSubscription;

  /// Track notification IDs we've already seen to avoid duplicates
  /// from real-time events racing with polling.
  final Set<String> _seenIds = {};

  NotificationsCubit(this._repository, this._realtimeService)
      : super(const NotificationsState.initial());

  /// Fetch all notifications and subscribe to real-time updates.
  Future<void> fetchNotifications() async {
    emit(const NotificationsState.loading());
    try {
      final notifications = await _repository.fetchNotifications();
      _seenIds.addAll(notifications.map((n) => n.id));
      final unreadCount = notifications.where((n) => !n.readStatus).length;
      emit(NotificationsState.loaded(
        notifications: notifications,
        unreadCount: unreadCount,
      ));

      // Subscribe to real-time updates.
      _subscribeToRealtime(notifications);
    } catch (e) {
      developer.log('NotificationsCubit.fetchNotifications failed: $e',
          name: 'notifications');
      emit(const NotificationsState.error('Failed to load notifications.'));
    }
  }

  /// Subscribe to the real-time event stream.
  void _subscribeToRealtime(List<NotificationDto> initialNotifications) {
    _realtimeSubscription?.cancel();
    _realtimeSubscription = null;

    final stream = _realtimeService.events;
    _realtimeSubscription = stream.listen(_handleRealtimeEvent);

    // Find userId from the first notification (all belong to current user)
    final userId = initialNotifications.isNotEmpty
        ? initialNotifications.first.userId
        : null;
    if (userId != null) {
      _realtimeService.subscribe(userId);
    }
  }

  /// Handle incoming real-time events.
  void _handleRealtimeEvent(NotificationRealtimeEvent event) {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return;

    switch (event) {
      case NotificationInserted(:final notification):
        _handleInsert(notification, currentState);
      case NotificationUpdated(:final notification):
        _handleUpdate(notification, currentState);
      case NotificationDeleted(:final id):
        _handleDelete(id, currentState);
      case NotificationRealtimeConnectionChanged(
          isConnected: false,
        ):
        // Polling fallback or reconnection signal — do a full re-fetch.
        fetchNotifications();
      case NotificationRealtimeConnectionChanged(
          isConnected: true,
        ):
        // Realtime reconnected; polling will be automatically stopped,
        // so no action needed.
        break;
    }
  }

  void _handleInsert(
    NotificationDto notification,
    NotificationsLoaded currentState,
  ) {
    // Deduplicate: skip if we already have this ID.
    if (_seenIds.contains(notification.id)) return;
    _seenIds.add(notification.id);

    final updatedList = [notification, ...currentState.notifications];
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(NotificationsState.loaded(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));
  }

  void _handleUpdate(
    NotificationDto notification,
    NotificationsLoaded currentState,
  ) {
    final updatedList = currentState.notifications.map((n) {
      if (n.id == notification.id) return notification;
      return n;
    }).toList();
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(NotificationsState.loaded(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));
  }

  void _handleDelete(
    String id,
    NotificationsLoaded currentState,
  ) {
    _seenIds.remove(id);
    final updatedList =
        currentState.notifications.where((n) => n.id != id).toList();
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(NotificationsState.loaded(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));
  }

  /// Mark a single notification as read (optimistic update + rollback on failure).
  Future<void> markAsRead(String id) async {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return;

    // Optimistic update
    final updatedList = currentState.notifications.map((n) {
      if (n.id == id && !n.readStatus) return n.copyWith(readStatus: true);
      return n;
    }).toList();
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(NotificationsState.loaded(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));

    try {
      await _repository.markAsRead(id);
    } catch (e) {
      developer.log('markAsRead failed: $e', name: 'notifications');
      // Revert on failure
      final reverted = currentState.notifications;
      emit(NotificationsState.loaded(
        notifications: reverted,
        unreadCount: currentState.unreadCount,
      ));
    }
  }

  /// Mark all notifications as read (optimistic update + rollback on failure).
  Future<void> markAllAsRead() async {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return;

    // Optimistic update
    final updatedList = currentState.notifications
        .map((n) => n.copyWith(readStatus: true))
        .toList();
    emit(NotificationsState.loaded(notifications: updatedList));

    try {
      await _repository.markAllAsRead();
    } catch (e) {
      developer.log('markAllAsRead failed: $e', name: 'notifications');
      final reverted = currentState.notifications;
      emit(NotificationsState.loaded(
        notifications: reverted,
        unreadCount: currentState.unreadCount,
      ));
    }
  }

  /// Accept a link request notification and remove it from the list.
  Future<void> acceptRequest(String id) async {
    try {
      await _repository.acceptRequest(id);
      final currentState = state;
      if (currentState is NotificationsLoaded) {
        final updatedList =
            currentState.notifications.where((n) => n.id != id).toList();
        _seenIds.remove(id);
        final unreadCount = updatedList.where((n) => !n.readStatus).length;
        emit(NotificationsState.loaded(
          notifications: updatedList,
          unreadCount: unreadCount,
        ));
      }
    } catch (e) {
      developer.log('acceptRequest failed: $e', name: 'notifications');
      emit(const NotificationsState.error('Failed to accept request.'));
    }
  }

  /// Decline a link request notification and remove it from the list.
  Future<void> declineRequest(String id) async {
    try {
      await _repository.declineRequest(id);
      final currentState = state;
      if (currentState is NotificationsLoaded) {
        final updatedList =
            currentState.notifications.where((n) => n.id != id).toList();
        _seenIds.remove(id);
        final unreadCount = updatedList.where((n) => !n.readStatus).length;
        emit(NotificationsState.loaded(
          notifications: updatedList,
          unreadCount: unreadCount,
        ));
      }
    } catch (e) {
      developer.log('declineRequest failed: $e', name: 'notifications');
      emit(const NotificationsState.error('Failed to decline request.'));
    }
  }

  /// Convenience accessor: returns the first pending link request notification.
  NotificationDto? get pendingLinkRequest {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return null;
    return currentState.notifications.cast<NotificationDto?>().firstWhere(
          (n) =>
              !n!.readStatus &&
              (n.type == 'client_link_request' ||
                  n.type == 'link_request' ||
                  n.message.contains('requests to connect') ||
                  n.message.contains('wants to connect')),
          orElse: () => null,
        );
  }

  /// Convenience accessor: returns the current unread count from the loaded state.
  int get unreadCount {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return 0;
    return currentState.unreadCount;
  }

  @override
  Future<void> close() {
    _realtimeSubscription?.cancel();
    _realtimeService.unsubscribe();
    return super.close();
  }
}
