import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/notifications_cubit.dart';
import '../cubit/notifications_state.dart';
import '../data/models/notification_dto.dart';
import 'widgets/notification_row.dart';
import 'widgets/ziro_sheet_header.dart';

/// Full-screen notifications list with infinite scroll pagination.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<NotificationsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (context) =>
          context.read<NotificationsCubit>()..fetchNotifications(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
                return switch (state) {
                  NotificationsInitial() || NotificationsLoading() =>
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
                  NotificationsLoaded(
                    :final notifications,
                    :final isLoadingMore,
                    :final hasMore,
                  ) =>
                    _NotificationList(
                      notifications: notifications,
                      isLoadingMore: isLoadingMore,
                      hasMore: hasMore,
                      scrollController: _scrollController,
                    ),
                  _ => const _EmptyState(),
                };
              },
            ),
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
      ),
    );
  }
}

/// Scrollable list of notification rows with pull-to-refresh and infinite scroll.
class _NotificationList extends StatelessWidget {
  final List<NotificationDto> notifications;
  final bool isLoadingMore;
  final bool hasMore;
  final ScrollController scrollController;

  const _NotificationList({
    required this.notifications,
    required this.isLoadingMore,
    required this.hasMore,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    final topPadding = MediaQuery.of(context).padding.top;

    return RefreshIndicator(
      onRefresh: () async {
        await cubit.refreshFromPull();
      },
      color: AppColors.primary,
      child: ListView.builder(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: topPadding + 108),
        itemCount: notifications.length + (isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == notifications.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                ),
              ),
            );
          }
          final notification = notifications[index];
          return RepaintBoundary(
            child: NotificationRow(
              notification: notification,
              cubit: cubit,
              currentMode: 'client',
            ),
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
    final topPadding = MediaQuery.of(context).padding.top;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding + 108),
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
      ),
    );
  }
}
