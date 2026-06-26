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
          _NutritionHabitsCard(onTap: () => context.push('/nutrition-habits')),

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
      