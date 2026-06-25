<response>
  <reasoning>
    The header layout UI issue (where the user's name/avatar and the system status bar overlap) is caused by the custom floating headers (`ZiroHeader` and `ZiroSheetHeader`) being positioned at the absolute top of the screen (`top: 0`) without taking into account the status bar height (`MediaQuery.of(context).padding.top`).

    To fix this issue:
    1. We will update `ZiroHeader` in `lib/features/home/presentation/widgets/ziro_header.dart` to retrieve and prepend the status bar height to its top padding.
    2. We will adjust the list padding of `_DashboardContent` inside `lib/features/home/presentation/home_screen.dart` so that it is pushed down dynamically by the status bar height, avoiding overlapping the header.
    3. We will modify `ZiroSheetHeader` in `lib/features/notifications/presentation/widgets/ziro_sheet_header.dart` to use a `SafeArea(bottom: false)` to push header controls below the status bar dynamically on all devices.
    4. We will propagate the top safe area padding adjustments to the main list views and grids on other screens using `ZiroSheetHeader` (namely `NotificationsScreen`, `CreateTemplateView`, `RoutineBuilderScreen`, `TemplatesLibraryScreen`, and `RoutineSchedulerScreen`) to ensure consistent alignment.
    5. We will append the task to `TASKS.md` and mark it complete.
  </reasoning>
  <modifications>
    <file path="lib/features/home/presentation/widgets/ziro_header.dart">
      <![CDATA[
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';
import '../../../notifications/cubit/notifications_cubit.dart';

/// Floating header that sits above the home scroll content.
///
/// Matches iOS ZiroHeader — PersonalHomeView.swift lines 77-102.
/// Layout: [Avatar circle] [User name] [Spacer] [Bell icon]
class ZiroHeader extends StatelessWidget {
  const ZiroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final unreadCount = context.watch<NotificationsCubit>().unreadCount;
    final userName = switch (authState) {
      AuthAuthenticated(:final user) => user.name ?? 'Athlete',
      _ => 'Home',
    };
    final avatarUrl = switch (authState) {
      AuthAuthenticated(:final user) => user.profilePhotoPath,
      _ => null,
    };
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(left: 16, right: 12, top: topPadding + 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.75),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Row(
            children: [
              // Avatar circle
              GestureDetector(
                onTap: () => context.go('/profile'),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primary,
                  backgroundImage:
                      avatarUrl != null ? NetworkImage(avatarUrl) : null,
                  child: avatarUrl == null
                      ? Text(
                          userName.isNotEmpty
                              ? userName[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 10),
              // User name
              Expanded(
                child: Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
              // Bell icon
              GestureDetector(
                onTap: () => context.push('/home/notifications'),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 22,
                        color: AppColors.foreground,
                      ),
                      // Red dot badge (shown when unread notifications exist)
                      if (unreadCount > 0)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/home_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/cubit/notifications_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../cubit/program_cubit.dart';
import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';
import '../data/models/client_recent_session.dart';
import 'widgets/check_in_banner.dart';
import 'widgets/coach_card.dart';
import 'widgets/credit_status_widget.dart';
import 'widgets/daily_targets_section.dart';
import 'widgets/invitation_hero_card.dart';
import 'widgets/need_coach_banner.dart';
import 'widgets/no_routine_placeholder.dart';
import 'widgets/quick_actions_row.dart';
import 'widgets/recent_history_section.dart';
import 'widgets/streak_motivation_card.dart';
import 'widgets/upcoming_sessions_carousel.dart';
import 'widgets/ziro_header.dart';

/// Main client-facing dashboard after login.
///
/// Matches iOS PersonalHomeView — PersonalHomeView.swift lines 1-297.
/// Structure: Stack with floating ZiroHeader on top and scrollable content below.
/// Content sections follow the iOS order with 24pt spacing.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return switch (state) {
                HomeInitial() || HomeLoading() => const _LoadingIndicator(),
                HomeError(:final message) => _ErrorView(message: message),
                HomeLoaded(:final dashboard, :final activeProgram) =>
                  BlocProvider.value(
                    value: context.read<ProgramCubit>(),
                    child: _DashboardContent(
                      dashboard: dashboard,
                      activeProgram: activeProgram,
                    ),
                  ),
              };
            },
          ),
          // Floating header on top of scroll content
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroHeader(),
          ),
        ],
      ),
    );
  }
}

/// Full-screen loading spinner.
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.primary,
      ),
    );
  }
}

/// Error state with retry button.
class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 56,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.read<HomeCubit>().refresh(),
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Scrollable dashboard content with all section widgets.
///
/// Order matches iOS PersonalHomeView:
/// 1. Coach Card / Need Coach Banner
/// 2. Credit Status
/// 3. Streak Motivation Card
/// 4. Active Program / No Routine Placeholder
/// 5. Nutrition & Habits Link
/// 6. Invitation Hero Card
/// 7. Check-in Banner
/// 8. Upcoming Sessions Carousel
/// 9. Daily Targets Section
/// 10. Quick Actions Row
/// 11. Recent History Section
class _DashboardContent extends StatelessWidget {
  final ClientDashboardResponse dashboard;
  final ActiveProgramResponse? activeProgram;

  const _DashboardContent({
    required this.dashboard,
    this.activeProgram,
  });

  bool get _isCheckInComplete {
    final lastCheckIn = dashboard.lastCheckIn;
    if (lastCheckIn == null) return false;
    return lastCheckIn.isAfter(
      DateTime.now().subtract(const Duration(days: 7)),
    );
  }

  bool get _hasCheckInBanner => dashboard.lastCheckIn != null;

  /// Compute consecutive-day workout streak from completed sessions.
  static int _computeStreak(List<ClientRecentSession> sessions) {
    if (sessions.isEmpty) return 0;

    // Collect unique dates from completed sessions
    final uniqueDates = <DateTime>{};
    for (final session in sessions) {
      if (session.status == 'completed') {
        final day = DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day,
        );
        uniqueDates.add(day);
      }
    }

    if (uniqueDates.isEmpty) return 0;

    final sortedDates = uniqueDates.toList()
      ..sort((a, b) => b.compareTo(a));

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final mostRecent = sortedDates.first;

    // Streak must include today or yesterday
    if (mostRecent.difference(todayDate).inDays > 1) return 0;

    // Count consecutive days backwards
    int streak = 1;
    for (int i = 1; i < sortedDates.length; i++) {
      final diff = sortedDates[i - 1].difference(sortedDates[i]).inDays;
      if (diff == 1) {
        streak++;
      } else {
        break;
      }
    }

    return streak;
  }

  @override
  Widget build(BuildContext context) {
    final trainer = dashboard.clientData.trainer;
    final remainingCredits = dashboard.clientData.remainingCredits;
    final sessions = dashboard.clientData.workoutSessions;
    final upcomingSessions = dashboard.upcomingClientSessions;
    final streak = _computeStreak(sessions);
    final topPadding = MediaQuery.of(context).padding.top;

    // Check for pending link requests via NotificationsCubit
    final notifCubit = context.watch<NotificationsCubit>();
    final pendingRequest = notifCubit.pendingLinkRequest;

    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refresh(),
      color: AppColors.primary,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: topPadding + 60,  // space for floating header and status bar
          bottom: 100, // space for tab bar
        ),
        children: [
          // ── 1. Coach Card or Need Coach Banner ──
          if (trainer != null)
            CoachCard(trainer: trainer)
          else
            const NeedCoachBanner(),

          const SizedBox(height: 24),

          // ── 2. Credit Status (only when linked to a trainer) ──
          if (trainer != null && remainingCredits != null)
            CreditStatusWidget(remainingCredits: remainingCredits),

          if (trainer != null && remainingCredits != null)
            const SizedBox(height: 24),

          // ── 3. Streak Motivation Card (if streak > 0) ──
          if (streak > 0)
            StreakMotivationCard(streak: streak),

          if (streak > 0) const SizedBox(height: 24),

          // ── 4. Active Program or No Routine Placeholder ──
          if (activeProgram != null)
            _ActiveProgramCard(program: activeProgram!)
          else if (trainer != null)
            const NoRoutinePlaceholder(),

          if (activeProgram != null || (trainer != null))
            const SizedBox(height: 24),

          // ── 5. Nutrition & Habits Link ──
          _NutritionHabitsCard(onTap: () => context.push('/daily-targets')),

          const SizedBox(height: 24),

          // ── 6. Invitation Hero Card (if pending request) ──
          if (pendingRequest != null)
            InvitationHeroCard(
              message: pendingRequest.message,
              onAccept: () => notifCubit.acceptRequest(pendingRequest.id),
              onDecline: () => notifCubit.declineRequest(pendingRequest.id),
            ),

          if (pendingRequest != null) const SizedBox(height: 24),

          // ── 7. Check-in Banner ──
          if (_hasCheckInBanner)
            CheckInBanner(
              isComplete: _isCheckInComplete,
              onTapCheckIn: () {
                context.push('/home/check-in');
              },
              hasTrainer: trainer != null,
            ),

          if (_hasCheckInBanner) const SizedBox(height: 24),

          // ── 8. Upcoming Sessions Carousel ──
          if (upcomingSessions.isNotEmpty)
            UpcomingSessionsCarousel(
              sessions: upcomingSessions,
              onSessionTap: (_) => context.go('/workout'),
            ),

          if (upcomingSessions.isNotEmpty) const SizedBox(height: 24),

          // ── 9. Daily Targets Section ──
          DailyTargetsSection(
            isEnabled: true,
            onTapSetTarget: () => context.push('/daily-targets'),
            onTapAddTarget: () => context.push('/daily-targets'),
          ),

          const SizedBox(height: 24),

          // ── 10. Quick Actions ──
          const QuickActionsRow(),

          const SizedBox(height: 24),

          // ── 11. Recent History ──
          RecentHistorySection(sessions: sessions),
        ],
      ),
    );
  }
}

/// Card linking to Nutrition & Habits screen.
///
/// Matches iOS green fork.knife card — PersonalHomeView.
class _NutritionHabitsCard extends StatelessWidget {
  final VoidCallback onTap;

  const _NutritionHabitsCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Green circle with fork.knife icon
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.restaurant_rounded,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'NUTRITION & HABITS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'View Nutrition Plan & Habits',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }
}

/// Card showing the client's active program.
class _ActiveProgramCard extends StatelessWidget {
  final ActiveProgramResponse program;

  const _ActiveProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    final progress = program.progress;

    return GestureDetector(
      onTap: () {
        context.push('/home/program-detail', extra: program);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program name
            Text(
              program.program.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            if (program.program.description != null &&
                program.program.description!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                program.program.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                ),
              ),
            ],
            const SizedBox(height: 16),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.totalCount > 0
                    ? progress.completedCount / progress.totalCount
                    : 0,
                minHeight: 6,
                backgroundColor: AppColors.borderMuted,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${progress.completedCount} of ${progress.totalCount} workouts',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/notifications/presentation/widgets/ziro_sheet_header.dart">
      <![CDATA[
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Reusable bottom sheet / overlay header — replicates ZiroSheetHeader.swift.
///
/// Layout:
/// - Drag handle (40×5 rounded pill)
/// - Title centered in a 44pt bar
/// - Optional Cancel (left) and Done (right) buttons
/// - Background uses .ultraThinMaterial effect (simulated with 95% opacity white)
class ZiroSheetHeader extends StatelessWidget {
  final String title;
  final bool showDone;
  final VoidCallback? onDone;
  final bool showCancel;
  final VoidCallback? onCancel;
  final String? leadingText;
  final String? trailingText;
  final VoidCallback? onTrailingIconTap;

  const ZiroSheetHeader({
    super.key,
    required this.title,
    this.showDone = false,
    this.onDone,
    this.showCancel = false,
    this.onCancel,
    this.leadingText,
    this.trailingText,
    this.onTrailingIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background.withValues(alpha: 0.95),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            // Drag handle
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(height: 8),
            // Header content — Row layout avoids Stack/Positioned.fill overflow trap
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  if (showCancel)
                    TextButton(
                      onPressed: onCancel,
                      child: Text(
                        leadingText ?? 'Cancel',
                        style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 64),
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (onTrailingIconTap != null)
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            size: 24,
                            color: AppColors.primary,
                          ),
                          onPressed: onTrailingIconTap,
                        ),
                      if (showDone)
                        TextButton(
                          onPressed: onDone,
                          child: Text(
                            trailingText ?? 'Done',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 64),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/notifications/presentation/notifications_screen.dart">
      <![CDATA[
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
    final topPadding = MediaQuery.of(context).padding.top;

    return RefreshIndicator(
      onRefresh: () => cubit.fetchNotifications(),
      color: AppColors.primary,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: topPadding + 108), // header height + status bar
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
      ]]>
    </file>
    <file path="lib/features/home/presentation/create_template_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart' as di;
import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/data/workout_session_api_service.dart';
import '../../trainers/presentation/widgets/exercise_picker_sheet.dart';

/// Full-screen template creation view matching iOS `CreateTemplateView.swift`.
///
/// Allows the user to:
/// 1. Enter a template name and optional description
/// 2. Add exercises from the exercise library
/// 3. Reorder exercises via drag-and-drop
/// 4. Remove exercises
/// 5. Save as a local template (returned via Navigator.pop)
class CreateTemplateView extends StatefulWidget {
  const CreateTemplateView({super.key});

  @override
  State<CreateTemplateView> createState() => _CreateTemplateViewState();
}

class _CreateTemplateViewState extends State<CreateTemplateView> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final List<_TemplateExerciseEntry> _exercises = [];
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: Column(
              children: [
                // Header fields
                _buildHeaderSection(),
                const SizedBox(height: 16),
                // Exercise list or empty state
                Expanded(
                  child: _exercises.isEmpty
                      ? _buildEmptyState()
                      : _buildExerciseList(),
                ),
              ],
            ),
          ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'New Template',
              showCancel: true,
              showDone: true,
              onCancel: () => Navigator.of(context).maybePop(),
              onDone: _save,
              leadingText: 'Cancel',
              trailingText: 'Save',
            ),
          ),

          // Saving overlay
          if (_isSaving)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Template Name (e.g. Leg Day)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
            textCapitalization: TextCapitalization.words,
          ),
          const Divider(height: 1, color: AppColors.borderMuted),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description (Optional)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              size: 60,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Template is Empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add exercises to build your workout template.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _showExercisePicker,
              icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
              label: const Text('Add Exercise'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList() {
    return Column(
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Exercises',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_exercises.length} exercises',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Reorderable exercise list
        Expanded(
          child: ReorderableListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _exercises.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final item = _exercises.removeAt(oldIndex);
                _exercises.insert(newIndex, item);
                // Update order values
                for (var i = 0; i < _exercises.length; i++) {
                  _exercises[i] = _TemplateExerciseEntry(
                    id: _exercises[i].id,
                    exercise: _exercises[i].exercise,
                    targetReps: _exercises[i].targetReps,
                    targetSets: _exercises[i].targetSets,
                    order: i,
                  );
                }
              });
            },
            itemBuilder: (context, index) {
              final entry = _exercises[index];
              return _buildExerciseCard(entry, index);
            },
          ),
        ),

        // Add exercise button at bottom
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _showExercisePicker,
              icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
              label: const Text('Add Exercise'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseCard(_TemplateExerciseEntry entry, int index) {
    return Container(
      key: ValueKey(entry.id),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.drag_handle_rounded,
          size: 20,
          color: AppColors.mutedText,
        ),
        title: Text(
          entry.exercise.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        subtitle: entry.exercise.muscleGroup != null
            ? Text(
                entry.exercise.muscleGroup!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sets/Reps badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${entry.targetSets}×${entry.targetReps}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Remove button
            GestureDetector(
              onTap: () => setState(() => _exercises.removeAt(index)),
              child: const Icon(
                Icons.close_rounded,
                size: 18,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showExercisePicker() async {
    // Fetch exercises on-demand (same pattern as workout session screen).
    final apiService = di.getIt<WorkoutSessionApiService>();
    List<ExerciseDto> allExercises;
    try {
      allExercises = await apiService.getExerciseLibrary();
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load exercise library.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExercisePickerSheet.multiple(
        exercises: allExercises,
        isLoading: false,
        onExercisesSelected: (selected) {
          setState(() {
            for (final exercise in selected) {
              _exercises.add(_TemplateExerciseEntry(
                id: 'local_${DateTime.now().millisecondsSinceEpoch}_${exercise.id}',
                exercise: exercise,
                targetReps: '10',
                targetSets: 3,
                order: _exercises.length,
              ));
            }
          });
        },
      ),
    );
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a template name')),
      );
      return;
    }

    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one exercise')),
      );
      return;
    }

    // Create the template with exercises
    final template = TemplateDto(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
      exercises: _exercises.map((e) => TemplateExerciseDto(
        id: e.id,
        order: e.order,
        exerciseId: e.exercise.id,
        type: 'EXERCISE',
        targetReps: e.targetReps,
        targetSets: e.targetSets,
        exercise: e.exercise,
      )).toList(),
    );

    Navigator.of(context).pop(template);
  }
}

/// Internal model for an exercise entry in the template.
class _TemplateExerciseEntry {
  final String id;
  final ExerciseDto exercise;
  final String targetReps;
  final int targetSets;
  final int order;

  _TemplateExerciseEntry({
    required this.id,
    required this.exercise,
    required this.targetReps,
    required this.targetSets,
    required this.order,
  });
}



extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/routine_builder_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/home_cubit.dart';
import '../cubit/program_cubit.dart';
import '../data/models/program_dto.dart';
import 'template_picker_sheet.dart';

/// A slot holding a template together with an editable day label.
///
/// Matches iOS `RoutineTemplateSlot` — RoutineBuilderView.swift line 3-7.
class _RoutineSlot {
  final TemplateDto template;
  String label;

  _RoutineSlot({required this.template, required this.label});
}

/// Full-screen routine builder for creating or editing workout programs.
///
/// Matches iOS `RoutineBuilderView` — RoutineBuilderView.swift lines 9-205.
class RoutineBuilderScreen extends StatefulWidget {
  /// If non-null, we're editing an existing program.
  final ProgramDto? existingProgram;

  const RoutineBuilderScreen({super.key, this.existingProgram});

  @override
  State<RoutineBuilderScreen> createState() => _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends State<RoutineBuilderScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late List<_RoutineSlot> _slots;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final program = widget.existingProgram;
    _nameController = TextEditingController(text: program?.name ?? '');
    _descriptionController =
        TextEditingController(text: program?.description ?? '');
    _slots = (program?.templates ?? []).asMap().entries.map((e) {
      final index = e.key;
      final template = e.value;
      final labels = program?.templateLabels ?? [];
      return _RoutineSlot(
        template: template,
        label: index < labels.length ? labels[index] : 'Day ${index + 1}',
      );
    }).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content with reorderable list
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoSection(),
                  const SizedBox(height: 24),
                  _buildSlotsSection(),
                ],
              ),
            ),
          ),

          // Fixed bottom "Add Workout" button
          if (_slots.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openTemplatePicker,
                    icon: const Icon(Icons.add_circle_outline_rounded,
                        size: 20),
                    label: const Text('Add Workout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.3),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: widget.existingProgram != null
                  ? 'Edit Routine'
                  : 'New Routine',
              showCancel: true,
              showDone: true,
              onCancel: () => Navigator.of(context).maybePop(),
              onDone: _save,
              leadingText: 'Cancel',
              trailingText: 'Save',
            ),
          ),

          // Saving overlay
          if (_isSaving)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Routine Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const Divider(height: 1, color: AppColors.borderMuted),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description (Optional)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Workout Slots',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_slots.length} Sessions',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Reorderable slot list or empty state
        if (_slots.isEmpty)
          _buildEmptyState()
        else
          // Use ReorderableListView.builder for drag-to-reorder
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            itemCount: _slots.length,
            onReorderItem: _onReorder,
            proxyDecorator: (child, index, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    child: child,
                  );
                },
                child: child,
              );
            },
            itemBuilder: (context, index) =>
                _buildSlotCard(index, _slots[index]),
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _openTemplatePicker,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.add_circle_rounded,
                size: 32,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 8),
              Text(
                'Add your first workout template',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard(int index, _RoutineSlot slot) {
    // Key is required by ReorderableListView for stable item identity.
    // Using ValueKey(slot.template.id) ensures Flutter tracks items through reorder.
    return Container(
      key: ValueKey(slot.template.id),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot header: drag handle + label + delete
          Row(
            children: [
              // Drag handle — triggers ReorderableListView reorder
              GestureDetector(
                onLongPressStart: (_) {
                  // ReorderableListView detects long-press on drag handle.
                  // We wrap with LongPressDraggable via default behavior.
                },
                child: const Icon(
                  Icons.drag_handle_rounded,
                  size: 20,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: slot.label),
                    onChanged: (v) => slot.label = v,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _slots.removeAt(index)),
                child: const Icon(
                  Icons.delete_rounded,
                  size: 20,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Template info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slot.template.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${slot.template.exercises.length} Exercises',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // newIndex accounts for the removed item — no manual adjustment needed.
      final slot = _slots.removeAt(oldIndex);
      _slots.insert(newIndex, slot);
    });
  }

  void _openTemplatePicker() async {
    final result = await showModalBottomSheet<TemplateDto>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ProgramCubit>(),
        child: TemplatePickerSheet(
          existingTemplateIds: _slots.map((s) => s.template.id).toSet(),
        ),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _slots.add(_RoutineSlot(
          template: result,
          label: 'Day ${_slots.length + 1}',
        ));
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a routine name')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final cubit = context.read<ProgramCubit>();

    if (widget.existingProgram != null) {
      // The client API does not support updating programs — show a message.
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Editing is only available through your trainer.'),
          ),
        );
      }
      return;
    }

    // Create the program via API (name + description only).
    final result = await cubit.createProgram(
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
    );

    if (result == null || !mounted) {
      setState(() => _isSaving = false);
      return;
    }

    // Create ALL templates on the backend with inline exercises (single API call each).
    for (var i = 0; i < _slots.length; i++) {
      final slot = _slots[i];

      // Serialize exercises for the API request.
      final exercises = slot.template.exercises.map((e) => {
            'exerciseId': e.exerciseId ?? e.exercise?.id ?? '',
            if (e.targetReps != null) 'targetReps': e.targetReps,
            if (e.targetSets != null) 'targetSets': e.targetSets,
            if (e.durationSeconds != null) 'durationSeconds': e.durationSeconds,
            if (e.notes != null) 'notes': e.notes,
            'order': e.order,
          }).toList();

      final created = await cubit.createTemplate(
        programId: result.id,
        name: slot.template.name,
        description: slot.template.description,
        exercises: exercises.isNotEmpty ? exercises : null,
      );

      if (created != null) {
        _slots[i] = _RoutineSlot(template: created, label: slot.label);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      context.read<HomeCubit>().refresh();
      Navigator.of(context).maybePop();
    }
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/templates_library_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import 'create_template_screen.dart';

/// Templates Library screen — searchable list of all templates.
///
/// Matches iOS `WorkoutTemplatesView` — WorkoutTemplatesView.swift lines 1-264.
class TemplatesLibraryScreen extends StatefulWidget {
  const TemplatesLibraryScreen({super.key});

  @override
  State<TemplatesLibraryScreen> createState() => _TemplatesLibraryScreenState();
}

class _TemplatesLibraryScreenState extends State<TemplatesLibraryScreen> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<ProgramCubit>().loadTemplates();
  }

  Future<void> _showCreateTemplate() async {
    final result = await Navigator.of(context).push<TemplateDto>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const CreateTemplateView(),
      ),
    );
    if (result != null && mounted) {
      // Persist the newly created local template before refreshing the list.
      context.read<ProgramCubit>().saveLocalTemplate(result);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: topPadding + 80),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mutedSurface.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _searchText = v),
                    decoration: const InputDecoration(
                      hintText: 'Search templates...',
                      prefixIcon: Icon(Icons.search_rounded,
                          size: 20, color: AppColors.mutedText),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Content
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                  builder: (context, state) {
                    return switch (state) {
                      ProgramInitial() || ProgramLoading() => const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ),
                      ProgramError(:final message) => _buildError(message),
                      ProgramLoaded(:final templates) =>
                        _buildTemplateList(templates),
                    };
                  },
                ),
              ),
            ],
          ),

          // Header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'Templates Library',
              showDone: true,
              onDone: () => context.pop(),
              trailingText: 'Done',
              onTrailingIconTap: _showCreateTemplate,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded,
                size: 48, color: AppColors.mutedText),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ProgramCubit>().loadTemplates(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateList(List<TemplateDto> templates) {
    final filtered = _searchText.isEmpty
        ? templates
        : templates.where((t) {
            final q = _searchText.toLowerCase();
            return t.name.toLowerCase().contains(q) ||
                (t.description?.toLowerCase().contains(q) ?? false);
          }).toList();

    if (filtered.isEmpty) {
      return _buildEmptyState(templates.isEmpty);
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ProgramCubit>().loadTemplates(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final template = filtered[index];
          return _TemplateLibraryRow(
            template: template,
            onPlay: () {
              // Start a workout session with this template
              context.go('/workout');
            },
            onTap: () {
              // Navigate to template detail (matches iOS tap → TemplateDetailView)
              context.push('/home/template-detail', extra: template);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(bool noTemplatesAtAll) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view_rounded,
              size: 60,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Templates Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a routine to get started.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            if (noTemplatesAtAll) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/home/routine-builder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Create New Routine'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A single template row in the templates library list.
class _TemplateLibraryRow extends StatelessWidget {
  final TemplateDto template;
  final VoidCallback onPlay;
  final VoidCallback? onTap;

  const _TemplateLibraryRow({
    required this.template,
    required this.onPlay,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                if (template.description != null &&
                    template.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    template.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${template.exercises.length} Exercises',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Play button
          GestureDetector(
            onTap: onPlay,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/routine_scheduler_screen.dart">
      <![CDATA[
import 'package:add_2_calendar/add_2_calendar.dart' as cal;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../data/models/program_dto.dart';

/// Full-screen scheduler for setting up a routine's calendar schedule.
///
/// Matches iOS `RoutineSchedulerView` — RoutineSchedulerView.swift lines 1-171.
/// Also matches iOS PlanSchedulerView — WorkoutTemplatesView.swift lines 328-474.
///
/// Since the backend does not have a POST /api/client/programs/:id/schedule
/// endpoint, scheduling adds events to the device calendar and records the
/// schedule locally. The program's `isScheduled`, `scheduledStartDate`,
/// and `scheduleFrequency` fields are stored in-memory.
class RoutineSchedulerScreen extends StatefulWidget {
  final ProgramDto program;

  const RoutineSchedulerScreen({super.key, required this.program});

  @override
  State<RoutineSchedulerScreen> createState() => _RoutineSchedulerScreenState();
}

class _RoutineSchedulerScreenState extends State<RoutineSchedulerScreen> {
  late DateTime _startDate;
  String _frequency = 'Sequential';
  int _weeks = 4;
  bool _isScheduling = false;
  bool _isSuccess = false;

  final _frequencies = ['Sequential', 'Daily'];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _isSuccess ? _buildSuccessView() : _buildSchedulerView(),
    );
  }

  Widget _buildSuccessView() {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  size: 48,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Routine Scheduled!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${widget.program.name} has been scheduled for $_weeks weeks.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchedulerView() {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        // Scrollable content
        Padding(
          padding: EdgeInsets.only(top: topPadding + 80),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRoutineInfo(),
                const SizedBox(height: 20),
                _buildConfiguration(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),

        // Header
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ZiroSheetHeader(
            title: 'Schedule Routine',
            onTrailingIconTap: () => Navigator.of(context).pop(),
          ),
        ),

        // Schedule button at bottom
        Positioned(
          left: 16,
          right: 16,
          bottom: 32,
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isScheduling ? null : _schedule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: _isScheduling
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Schedule Routine'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoutineInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.program.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${widget.program.templates.length} Sessions in sequence',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfiguration() {
    return Column(
      children: [
        // Start Date
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Start Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _pickDate,
                child: Text(
                  DateFormat('MMM d, yyyy').format(_startDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Frequency
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frequency',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              SegmentedButton<String>(
                segments: _frequencies
                    .map((f) => ButtonSegment(value: f, label: Text(f)))
                    .toList(),
                selected: {_frequency},
                onSelectionChanged: (v) =>
                    setState(() => _frequency = v.first),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return AppColors.foreground;
                  }),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _frequency == 'Sequential'
                    ? 'Workouts every other day (e.g. Mon, Wed, Fri, Sun...)'
                    : 'Workouts every single day.',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Duration (weeks)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '$_weeks Weeks',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _weeks > 1
                          ? () => setState(() => _weeks--)
                          : null,
                      icon: const Icon(Icons.remove_circle_outline_rounded),
                      color: AppColors.primary,
                      iconSize: 28,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _weeks < 12
                          ? () => setState(() => _weeks++)
                          : null,
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      color: AppColors.primary,
                      iconSize: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _schedule() async {
    setState(() => _isScheduling = true);

    try {
      // Create device calendar events for each session.
      // The backend does not have a program schedule endpoint — scheduling
      // is done locally via device calendar (matching iOS Apple Calendar
      // integration behavior from PlanSchedulerView).
      await _addToDeviceCalendar();

      if (!mounted) return;
      setState(() {
        _isScheduling = false;
        _isSuccess = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isScheduling = false);
      _showError('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> _addToDeviceCalendar() async {
    final sessions = widget.program.templates;
    if (sessions.isEmpty) return;

    final isDaily = _frequency == 'DAILY';
    const sessionDuration = Duration(hours: 1);
    int dayOffset = 0;

    for (var i = 0; i < sessions.length; i++) {
      final session = sessions[i];
      final sessionDate = _calculateSessionDate(i, isDaily, dayOffset);
      if (sessionDate == null) continue;

      final start = DateTime(
        sessionDate.year,
        sessionDate.month,
        sessionDate.day,
        7,
      );

      dayOffset = isDaily
          ? dayOffset + 1
          : dayOffset + 2; // Sequential = every other day

      final event = cal.Event(
        title: session.name,
        description: widget.program.name,
        startDate: start,
        endDate: start.add(sessionDuration),
        location: 'ZIRO.FIT',
      );

      try {
        await cal.Add2Calendar.addEvent2Cal(event);
      } catch (_) {
        // Device calendar integration failure is non-blocking.
      }
    }
  }

  DateTime? _calculateSessionDate(
    int index,
    bool isDaily,
    int dayOffset,
  ) {
    if (isDaily) {
      return _startDate.add(Duration(days: index));
    }
    return _startDate.add(Duration(days: index * 2));
  }

  void _showError([String? message]) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Scheduling Failed',
          style: TextStyle(color: AppColors.foreground),
        ),
        content: Text(
          message ?? 'Could not schedule the routine. Please try again.',
          style: const TextStyle(color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'OK',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
      ]]>
    </file>
    <file path="TASKS.md">
      <![CDATA[
- [x] Fix back button on trainer profile screen by using `context.push` instead of `context.go` for trainer details and adding fallback pop routing in TrainerDetailScreen.
- [x] Fix navigation GoError crash on Check-In screen and other sub-sheets/sub-screens by switching from `context.go` to `context.push` and incorporating safe fallback routing on pop actions.
- [x] Fix status bar overlap / header layout UI on HomeScreen and other screens utilizing custom floating headers by dynamically calculating and adding top safe area padding.
      ]]>
    </file>
  </modifications>
</response>