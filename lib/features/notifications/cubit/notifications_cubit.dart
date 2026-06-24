import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/notification_dto.dart';
import '../data/repositories/notification_repository.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepository _repository;

  NotificationsCubit(this._repository) : super(const NotificationsState.initial());

  /// Fetch all notifications and calculate unread count.
  Future<void> fetchNotifications() async {
    emit(const NotificationsState.loading());
    try {
      final notifications = await _repository.fetchNotifications();
      final unreadCount = notifications.where((n) => !n.readStatus).length;
      emit(NotificationsState.loaded(
        notifications: notifications,
        unreadCount: unreadCount,
      ));
    } catch (e) {
      developer.log('NotificationsCubit.fetchNotifications failed: $e', name: 'notifications');
      emit(const NotificationsState.error('Failed to load notifications.'));
    }
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
    emit(NotificationsState.loaded(notifications: updatedList, unreadCount: unreadCount));

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
}
