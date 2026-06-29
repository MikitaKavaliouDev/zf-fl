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

  /// Fetch the first page of notifications and subscribe to real-time.
  Future<void> fetchNotifications() async {
    emit(const NotificationsState.loading());
    try {
      final result = await _repository.fetchNotifications(page: 1);
      _seenIds.addAll(result.notifications.map((n) => n.id));
      final unreadCount = result.notifications.where((n) => !n.readStatus).length;
      emit(NotificationsState.loaded(
        notifications: result.notifications,
        unreadCount: unreadCount,
        hasMore: result.hasMore,
        currentPage: 1,
      ));

      _subscribeToRealtime(result.notifications);
    } catch (e) {
      developer.log('NotificationsCubit.fetchNotifications failed: $e',
          name: 'notifications');
      emit(const NotificationsState.error('Failed to load notifications.'));
    }
  }

  /// Load the next page of notifications and append to the list.
  Future<void> loadMore() async {
    final s = state;
    if (s is! NotificationsLoaded || !s.hasMore || s.isLoadingMore) return;

    emit(s.copyWith(isLoadingMore: true));
    try {
      final nextPage = s.currentPage + 1;
      final result = await _repository.fetchNotifications(page: nextPage);
      final updatedList = [...s.notifications, ...result.notifications];
      _seenIds.addAll(result.notifications.map((n) => n.id));
      final unreadCount = updatedList.where((n) => !n.readStatus).length;
      emit(NotificationsState.loaded(
        notifications: updatedList,
        unreadCount: unreadCount,
        hasMore: result.hasMore,
        currentPage: nextPage,
      ));
    } catch (e) {
      developer.log('NotificationsCubit.loadMore failed: $e',
          name: 'notifications');
      emit(s.copyWith(isLoadingMore: false));
    }
  }

  /// Subscribe to the real-time event stream.
  void _subscribeToRealtime(List<NotificationDto> initialNotifications) {
    _realtimeSubscription?.cancel();
    _realtimeSubscription = null;

    final stream = _realtimeService.events;
    _realtimeSubscription = stream.listen(_handleRealtimeEvent);

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
      case NotificationRealtimeConnectionChanged(isConnected: false):
        fetchNotifications();
      case NotificationRealtimeConnectionChanged(isConnected: true):
        break;
    }
  }

  void _handleInsert(
    NotificationDto notification,
    NotificationsLoaded currentState,
  ) {
    if (_seenIds.contains(notification.id)) return;
    _seenIds.add(notification.id);

    final updatedList = [notification, ...currentState.notifications];
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(currentState.copyWith(
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
    emit(currentState.copyWith(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));
  }

  void _handleDelete(String id, NotificationsLoaded currentState) {
    _seenIds.remove(id);
    final updatedList =
        currentState.notifications.where((n) => n.id != id).toList();
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(currentState.copyWith(
      notifications: updatedList,
      unreadCount: unreadCount,
    ));
  }

  /// Mark a single notification as read (optimistic update + rollback).
  Future<void> markAsRead(String id) async {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return;

    final snapshot = currentState;
    final updatedList = currentState.notifications.map((n) {
      if (n.id == id && !n.readStatus) return n.copyWith(readStatus: true);
      return n;
    }).toList();
    final unreadCount = updatedList.where((n) => !n.readStatus).length;
    emit(currentState.copyWith(notifications: updatedList, unreadCount: unreadCount));

    try {
      await _repository.markAsRead(id);
    } catch (e) {
      developer.log('markAsRead failed: $e', name: 'notifications');
      emit(snapshot);
    }
  }

  /// Mark all notifications as read (optimistic update + rollback).
  Future<void> markAllAsRead() async {
    final currentState = state;
    if (currentState is! NotificationsLoaded) return;

    final snapshot = currentState;
    final updatedList = currentState.notifications
        .map((n) => n.copyWith(readStatus: true))
        .toList();
    emit(currentState.copyWith(notifications: updatedList));

    try {
      await _repository.markAllAsRead();
    } catch (e) {
      developer.log('markAllAsRead failed: $e', name: 'notifications');
      emit(snapshot);
    }
  }

  /// Accept a link request notification.
  Future<void> acceptRequest(String id) async {
    try {
      await _repository.acceptRequest(id);
      final currentState = state;
      if (currentState is NotificationsLoaded) {
        final updatedList =
            currentState.notifications.where((n) => n.id != id).toList();
        _seenIds.remove(id);
        final unreadCount = updatedList.where((n) => !n.readStatus).length;
        emit(currentState.copyWith(
          notifications: updatedList,
          unreadCount: unreadCount,
        ));
      }
    } catch (e) {
      developer.log('acceptRequest failed: $e', name: 'notifications');
      emit(const NotificationsState.error('Failed to accept request.'));
    }
  }

  /// Decline a link request notification.
  Future<void> declineRequest(String id) async {
    try {
      await _repository.declineRequest(id);
      final currentState = state;
      if (currentState is NotificationsLoaded) {
        final updatedList =
            currentState.notifications.where((n) => n.id != id).toList();
        _seenIds.remove(id);
        final unreadCount = updatedList.where((n) => !n.readStatus).length;
        emit(currentState.copyWith(
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
