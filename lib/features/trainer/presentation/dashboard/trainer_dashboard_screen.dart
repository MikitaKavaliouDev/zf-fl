import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_dashboard_cubit.dart';
import '../../cubit/trainer_dashboard_state.dart';

/// Trainer dashboard — first tab in the trainer shell.
///
/// Layout (matching iOS DashboardView.swift):
///   1. Greeting header
///   2. Overview — horizontal scrolling stats cards
///   3. Quick Actions — grid of action cards
///   4. What's Next — upcoming sessions list
class TrainerDashboardScreen extends StatefulWidget {
  const TrainerDashboardScreen({super.key});

  @override
  State<TrainerDashboardScreen> createState() => _TrainerDashboardScreenState();
}

class _TrainerDashboardScreenState extends State<TrainerDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerDashboardCubit>().loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<TrainerDashboardCubit, TrainerDashboardState>(
        builder: (context, state) {
          return switch (state) {
            TrainerDashboardInitial() || TrainerDashboardLoading() =>
              const _DashboardSkeleton(),
            TrainerDashboardLoaded(:final greeting) => RefreshIndicator(
                onRefresh: () =>
                    context.read<TrainerDashboardCubit>().refresh(),
                child: _DashboardContent(
                  greeting: greeting,
                  state: state,
                ),
              ),
            TrainerDashboardError(:final message) => _ErrorView(
                message: message,
                onRetry: () =>
                    context.read<TrainerDashboardCubit>().loadDashboard(),
              ),
          };
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Content
// ──────────────────────────────────────────────

class _DashboardContent extends StatelessWidget {
  final String greeting;
  final TrainerDashboardLoaded state;

  const _DashboardContent({
    required this.greeting,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 16, bottom: 100),
      children: [
        // Greeting
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            greeting,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Overview — Stats Cards
        const _SectionHeader(title: 'Overview'),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _StatsCard(
                title: 'Revenue',
                value: '\$${state.revenue}',
                trend: state.revenueTrend,
                icon: Icons.trending_up_rounded,
                color: const Color(0xFF34C759),
              ),
              const SizedBox(width: 12),
              _StatsCard(
                title: 'Clients',
                value: '${state.activeClientsCount}',
                trend: 'active',
                icon: Icons.people_rounded,
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              _StatsCard(
                title: 'Check-ins',
                value: '${state.pendingCheckIns}',
                trend: 'to review',
                icon: Icons.check_circle_rounded,
                color: const Color(0xFFAF52DE),
              ),
              const SizedBox(width: 12),
              _StatsCard(
                title: 'Bookings',
                value: '${state.pendingBookings}',
                trend: 'pending',
                icon: Icons.calendar_month_rounded,
                color: const Color(0xFFFF9500),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Quick Actions
        const _SectionHeader(title: 'Quick Actions'),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  title: 'New Program',
                  icon: Icons.assignment_rounded,
                  color: const Color(0xFF34C759),
                  onTap: () => context.push('/trainer/programs'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  title: 'Check-ins',
                  icon: Icons.checklist_rounded,
                  color: const Color(0xFFFF9500),
                  onTap: () => context.push('/trainer/checkins'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  title: 'Events',
                  icon: Icons.event_rounded,
                  color: const Color(0xFFAF52DE),
                  onTap: () => context.push('/trainer/events'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  title: 'Resources',
                  icon: Icons.folder_rounded,
                  color: AppColors.primary,
                  onTap: () => context.push('/trainer/resources'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  title: 'Recipes',
                  icon: Icons.restaurant_menu_rounded,
                  color: const Color(0xFF34C759),
                  onTap: () => context.push('/trainer/recipes'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  title: 'Clients',
                  icon: Icons.people_rounded,
                  color: const Color(0xFF007AFF),
                  onTap: () => context.push('/trainer/clients'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  title: 'Calendar',
                  icon: Icons.calendar_month_rounded,
                  color: const Color(0xFFAF52DE),
                  onTap: () => context.push('/trainer/calendar'),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // What's Next — Upcoming Sessions
        const _SectionHeader(title: "What's Next"),
        if (state.upcomingSessions.isEmpty)
          const _EmptySessions()
        else
          ...state.upcomingSessions.map(
            (session) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: _SessionRow(
                title: session.title,
                subtitle:
                    '${session.clientName} • ${_formatTime(session.start)}',
                color: session.type == 'booking'
                    ? const Color(0xFFAF52DE)
                    : AppColors.primary,
                onTap: () => context.push('/trainer/calendar'),
              ),
            ),
          ),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Components
// ──────────────────────────────────────────────

class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final IconData icon;
  final Color color;

  const _StatsCard({
    required this.title,
    required this.value,
    required this.trend,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 16, color: color),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  trend,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withValues(alpha: 0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  const _SessionRow({
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.schedule_rounded,
              size: 20,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 16,
            color: AppColors.mutedText,
          ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}

class _EmptySessions extends StatelessWidget {
  const _EmptySessions();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          Icon(
            Icons.calendar_month_rounded,
            size: 40,
            color: AppColors.mutedText.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 12),
          const Text(
            'No upcoming sessions.',
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

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.mutedText),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Helpers
// ──────────────────────────────────────────────

String _formatTime(String iso) {
  final dt = DateTime.tryParse(iso);
  if (dt == null) return '';
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final date = DateTime(dt.year, dt.month, dt.day);
  final hour = dt.hour.toString().padLeft(2, '0');
  final minute = dt.minute.toString().padLeft(2, '0');
  if (date == today) return 'Today, $hour:$minute';
  final months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return '${months[dt.month - 1]} ${dt.day} • $hour:$minute';
}
