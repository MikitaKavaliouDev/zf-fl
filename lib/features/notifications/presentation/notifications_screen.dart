import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/notifications_cubit.dart';
import '../cubit/notifications_state.dart';
import '../data/models/notification_dto.dart';
import 'widgets/notification_row.dart';
import 'widgets/ziro_sheet_header.dart';

/// Full-screen notifications list — replicates iOS NotificationsView exactly.
///
/// Layout:
/// - ZiroSheetHeader pinned at top (title: "Notifications", Done button pops)
/// - Scrollable notification list with pull-to-refresh
/// - Empty state when no notifications
/// - Loading spinner on initial load
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (context) =>
          context.read<NotificationsCubit>()..fetchNotifications(),
      child: const _NotificationsBody(),
    );
  }
}

class _NotificationsBody extends StatelessWidget {
  const _NotificationsBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Main content
          BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return switch (state) {
                NotificationsInitial() || NotificationsLoading()
                    when _notificationsList(state).isEmpty =>
                  const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primary,
                    ),
                  ),
                NotificationsLoaded(:final notifications)
                    when notifications.isEmpty =>
                  const _EmptyState(),
                NotificationsError() => const _EmptyState(),
                NotificationsLoaded(:final notifications) =>
                  _NotificationList(notifications: notifications),
                _ => const _EmptyState(),
              };
            },
          ),
          // Pinned header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'Notifications',
              showDone: true,
              onDone: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  /// Extract the notifications list from any state (empty list for non-loaded).
  List<NotificationDto> _notificationsList(NotificationsState state) {
    if (state is NotificationsLoaded) return state.notifications;
    return const [];
  }
}

/// Scrollable list of notification rows with pull-to-refresh.
class _NotificationList extends StatelessWidget {
  final List<NotificationDto> notifications;

  const _NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();

    return RefreshIndicator(
      onRefresh: () => cubit.fetchNotifications(),
      color: AppColors.primary,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 108), // header height
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationRow(
            notification: notification,
            cubit: cubit,
            currentMode: 'client',
          );
        },
      ),
    );
  }
}

/// Shown when the notification list is empty.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_off_rounded,
            size: 50,
            color: AppColors.mutedText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'No notifications',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}
