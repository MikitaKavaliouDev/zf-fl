import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../cubit/program_cubit.dart';
import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';
import '../data/models/client_dashboard_session.dart';
import 'widgets/check_in_banner.dart';
import 'widgets/coach_card.dart';
import 'widgets/credit_status_widget.dart';
import 'widgets/need_coach_banner.dart';
import 'widgets/no_routine_placeholder.dart';
import 'widgets/quick_actions_row.dart';
import 'widgets/recent_history_section.dart';
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

  @override
  Widget build(BuildContext context) {
    final trainer = dashboard.clientData.trainer;
    final remainingCredits = dashboard.clientData.remainingCredits;
    final sessions = dashboard.clientData.workoutSessions;
    final upcomingSessions = dashboard.upcomingClientSessions;

    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refresh(),
      color: AppColors.primary,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 56, // space for floating header
          bottom: 100, // space for tab bar
        ),
        children: [
          // 1. Coach Card or Need Coach Banner
          if (trainer != null)
            CoachCard(trainer: trainer)
          else
            const NeedCoachBanner(),

          const SizedBox(height: 24),

          // 2. Credit Status (only when linked to a trainer)
          if (trainer != null && remainingCredits != null)
            CreditStatusWidget(remainingCredits: remainingCredits),

          if (trainer != null && remainingCredits != null)
            const SizedBox(height: 24),

          // 3. Active Program or No Routine Placeholder
          if (activeProgram != null)
            _ActiveProgramCard(program: activeProgram!)
          else if (trainer != null)
            const NoRoutinePlaceholder(),

          if (activeProgram != null || (trainer != null))
            const SizedBox(height: 24),

          // 4. Check-in Banner
          if (_hasCheckInBanner)
            CheckInBanner(
              isComplete: _isCheckInComplete,
              onTapCheckIn: () {
                // Check-in wizard — navigate to workout for now
                context.go('/workout');
              },
              hasTrainer: trainer != null,
            ),

          if (_hasCheckInBanner) const SizedBox(height: 24),

          // 5. Upcoming Sessions
          if (upcomingSessions.isNotEmpty)
            _UpcomingSessionsSection(sessions: upcomingSessions),

          if (upcomingSessions.isNotEmpty) const SizedBox(height: 24),

          // 6. Quick Actions
          const QuickActionsRow(),

          const SizedBox(height: 24),

          // 7. Recent History
          RecentHistorySection(sessions: sessions),
        ],
      ),
    );
  }
}

/// Horizontal scrollable list of upcoming sessions.
///
/// Matches iOS Upcoming Sessions — PersonalHomeView.swift lines 716-775.
class _UpcomingSessionsSection extends StatelessWidget {
  final List<ClientDashboardSession> sessions;

  const _UpcomingSessionsSection({required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Upcoming',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sessions.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final session = sessions[index];
              return _UpcomingSessionCard(session: session);
            },
          ),
        ),
      ],
    );
  }
}

/// Single upcoming session card.
class _UpcomingSessionCard extends StatelessWidget {
  final ClientDashboardSession session;

  const _UpcomingSessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final day = DateFormat('d').format(session.date);
    final month = DateFormat('MMM').format(session.date);
    final color =
        session.isTrainerAssigned == true
            ? const Color(0xFF8B5CF6)
            : AppColors.primary;

    return GestureDetector(
      onTap: () {
        // Navigate to session detail — go to workout home for now
        context.go('/workout');
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date badge + icon row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '$day $month',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  session.isTrainerAssigned == true
                      ? Icons.star_rounded
                      : Icons.calendar_today_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
            // Coach assigned label
            if (session.isTrainerAssigned == true)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Coach Assigned',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ),
            const Spacer(),
            // Title
            Text(
              session.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            // Duration
            Text(
              '${session.duration} min',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.85),
              ),
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
        context.go('/home/program-detail', extra: program);
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
