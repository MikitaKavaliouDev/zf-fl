import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/cubit/notifications_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/program_cubit.dart';
import '../data/home_data.dart';
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
import 'upcoming_session_detail_screen.dart';

/// Main client-facing dashboard after login.
///
/// Uses tanquery [QueryBuilder] for cache-first loading with background
/// refresh. Pull-to-refresh calls [DartQuery.refetchQueries].
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    // Bust ResponseCache first so the queryFn hits the API,
    // then refetch via tanquery to update the UI.
    await context.read<HomeCubit>().invalidateResponseCache();
    final client = DartQuery.of(context);
    await client.refetchQueries(queryKey: QueryKey(['home']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('homeScreen'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          QueryBuilder<HomeData>(
            queryKey: QueryKey(['home']),
            queryFn: () => context.read<HomeCubit>().fetchDashboard(),
            staleTime: const Duration(seconds: 30),
            builder: (context, state) {
              if (state.isLoading && !state.isFetched) {
                return const _LoadingIndicator();
              }
              if (state.data != null) {
                return BlocProvider.value(
                  value: context.read<ProgramCubit>(),
                  child: _DashboardContent(
                    dashboard: state.data!.dashboard,
                    activeProgram: state.data!.activeProgram,
                    onRefresh: _onRefresh,
                  ),
                );
              }
              if (state.error != null) {
                return _ErrorView(
                  message: state.error.toString(),
                  onRetry: _onRefresh,
                );
              }
              return const SizedBox.shrink();
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
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

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
              onPressed: onRetry,
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
  final Future<void> Function() onRefresh;

  const _DashboardContent({
    required this.dashboard,
    this.activeProgram,
    required this.onRefresh,
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

    if (mostRecent.difference(todayDate).inDays > 1) return 0;

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

    final notifCubit = context.watch<NotificationsCubit>();
    final pendingRequest = notifCubit.pendingLinkRequest;

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      child: ListView(
        key: const ValueKey('dashboardList'),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: topPadding + 60,
          bottom: 100,
        ),
        children: [
          if (trainer != null)
            CoachCard(trainer: trainer)
          else
            const NeedCoachBanner(),

          const SizedBox(height: 24),

          if (trainer != null && remainingCredits != null)
            CreditStatusWidget(key: const ValueKey('creditStatusWidget'), remainingCredits: remainingCredits),

          if (trainer != null && remainingCredits != null)
            const SizedBox(height: 24),

          if (streak > 0)
            StreakMotivationCard(key: const ValueKey('streakMotivationCard'), streak: streak),

          if (streak > 0) const SizedBox(height: 24),

          if (activeProgram != null)
            _ActiveProgramCard(key: const ValueKey('activeProgramWidget'), program: activeProgram!)
          else if (trainer != null)
            const NoRoutinePlaceholder(),

          if (activeProgram != null || (trainer != null))
            const SizedBox(height: 24),

          _NutritionHabitsCard(onTap: () => context.push('/nutrition-habits')),

          const SizedBox(height: 24),

          if (pendingRequest != null)
            InvitationHeroCard(
              key: const ValueKey('invitationHeroCard'),
              message: pendingRequest.message,
              onAccept: () => notifCubit.acceptRequest(pendingRequest.id),
              onDecline: () => notifCubit.declineRequest(pendingRequest.id),
            ),

          if (pendingRequest != null) const SizedBox(height: 24),

          if (_hasCheckInBanner)
            CheckInBanner(
              isComplete: _isCheckInComplete,
              onTapCheckIn: () {
                context.push('/home/check-in');
              },
              hasTrainer: trainer != null,
            ),

          if (_hasCheckInBanner) const SizedBox(height: 24),

          if (upcomingSessions.isNotEmpty)
            UpcomingSessionsCarousel(
              sessions: upcomingSessions,
              onSessionTap: (session) => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.background,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => UpcomingSessionDetailScreen(
                  sessionId: session.id,
                ),
              ),
            ),

          if (upcomingSessions.isNotEmpty) const SizedBox(height: 24),

          DailyTargetsSection(
            key: const ValueKey('homeDailyTargetsSection'),
            onTapAddTarget: () => context.push('/daily-targets'),
          ),

          const SizedBox(height: 24),

          const QuickActionsRow(),

          const SizedBox(height: 24),

          RecentHistorySection(key: const ValueKey('recentHistorySection'), sessions: sessions),
        ],
      ),
    );
  }
}

/// Card linking to Nutrition & Habits screen.
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
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NUTRITION & HABITS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
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

  const _ActiveProgramCard({super.key, required this.program});

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
