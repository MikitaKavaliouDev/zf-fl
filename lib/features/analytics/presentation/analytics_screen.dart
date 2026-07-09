import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/analytics_cubit.dart';
import '../cubit/analytics_state.dart';
import '../data/models/analytics_response_dto.dart';
import '../domain/widget_registry.dart';
import 'manage_widgets_sheet.dart';
import 'measurements/measurements_sheet.dart';
import 'widget_detail_view.dart';
import 'widgets/exercise_progress_widget.dart';
import 'widgets/widget_container.dart';

/// Main analytics tab screen.
///
/// Matches iOS PersonalAnalyticsView with:
/// - Fixed glass header with "Analytics" title + manage-widgets button
/// - Performance summary card at top
/// - Configurable widget grid (only visible widgets)
/// - Pull-to-refresh
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnalyticsCubit>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('analyticsScreen'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
          builder: (context, state) {
            if (state is AnalyticsInitial) {
              return const SizedBox.shrink();
            }
            if (state is AnalyticsLoading) {
              return const _LoadingView();
            }
            if (state is AnalyticsLoaded) {
              return _LoadedView(state: state);
            }
            if (state is AnalyticsError) {
              return _ErrorView(
                message: state.message,
                onRetry: () => context.read<AnalyticsCubit>().loadData(forceRefresh: true),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

// ── Loaded State ──

class _LoadedView extends StatelessWidget {
  final AnalyticsLoaded state;

  const _LoadedView({required this.state});

  bool get _hasSummaryData =>
      state.analytics.volumeHistory.isNotEmpty || state.analytics.consistency > 0;

  @override
  Widget build(BuildContext context) {
    final widgets = [...state.widgets.widgets]
      ..sort((a, b) => a.order.compareTo(b.order));
    final visibleWidgets = widgets.where((w) => w.isVisible).toList();

    return RefreshIndicator(
      onRefresh: () => context.read<AnalyticsCubit>().refresh(),
      child: CustomScrollView(
        slivers: [
          // Glass header
          SliverToBoxAdapter(
            child: _GlassHeader(
              onManageWidgets: () => _showManageWidgetsSheet(context),
              onOpenMeasurements: () => _showMeasurementsSheet(context),
            ),
          ),
          // Performance summary
          if (_hasSummaryData)
            SliverToBoxAdapter(
              child: _PerformanceSummaryWidget(
                analytics: state.analytics,
                currentStreak: state.currentStreak,
                longestStreak: state.longestStreak,
                volumeTrend: state.volumeTrend,
                consistencyTrend: state.consistencyTrend,
                frequencyTrend: state.frequencyTrend,
                averageVolumeTrend: state.averageVolumeTrend,
              ),
            ),
          // Widget grid
          ...visibleWidgets.map((w) => SliverToBoxAdapter(
                child: _buildWidget(context, w.type),
              )),
          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildWidget(BuildContext context, String type) {
    final entry = widgetRegistry[type];
    if (entry == null) return const SizedBox.shrink();

    // Special case: exerciseProgress needs the fetch callback from context
    Widget child;
    if (type == 'exerciseProgress') {
      child = ExerciseProgressWidget(
        favoriteExercises: state.progress.favoriteExercises,
        onFetchExerciseStats: (exerciseId) =>
            context.read<AnalyticsCubit>().fetchExerciseStats(exerciseId),
      );
    } else {
      child = entry.builder(state.analytics, state.progress);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: GestureDetector(
        onTap: entry.hasDetail ? () => _openDetail(context, type) : null,
        child: WidgetContainer(
          title: entry.title,
          subtitle: entry.subtitle,
          icon: entry.icon,
          child: child,
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, String type) {
    final entry = widgetRegistry[type];
    if (entry == null || !entry.hasDetail) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WidgetDetailView(
          widgetType: type,
          analytics: state.analytics,
          progress: state.progress,
        ),
      ),
    );
  }

  void _showMeasurementsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MeasurementsSheet(weightData: state.progress.weight),
    );
  }

  void _showManageWidgetsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AnalyticsCubit>(),
        child: const ManageWidgetsSheet(),
      ),
    );
  }
}

// ── Glass Header ──

class _GlassHeader extends StatelessWidget {
  final VoidCallback onManageWidgets;
  final VoidCallback onOpenMeasurements;

  const _GlassHeader({
    required this.onManageWidgets,
    required this.onOpenMeasurements,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(color: AppColors.borderMuted),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Analytics',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit_note_rounded, size: 22),
            onPressed: onOpenMeasurements,
            color: AppColors.foreground,
            tooltip: 'Measurements',
          ),
          IconButton(
            icon: const Icon(Icons.grid_view_rounded, size: 22),
            onPressed: onManageWidgets,
            color: AppColors.foreground,
            tooltip: 'Manage widgets',
          ),
        ],
      ),
    );
  }
}

// ── Performance Summary ──

class _PerformanceSummaryWidget extends StatelessWidget {
  final AnalyticsResponseDto analytics;
  final int currentStreak;
  final int longestStreak;
  final double volumeTrend;
  final double consistencyTrend;
  final double frequencyTrend;
  final double averageVolumeTrend;

  const _PerformanceSummaryWidget({
    required this.analytics,
    required this.currentStreak,
    required this.longestStreak,
    required this.volumeTrend,
    required this.consistencyTrend,
    required this.frequencyTrend,
    required this.averageVolumeTrend,
  });

  @override
  Widget build(BuildContext context) {
    final totalVolume = analytics.volumeHistory.fold<double>(
      0,
      (sum, d) => sum + d.volume,
    );
    final avgVolume = analytics.volumeHistory.isNotEmpty
        ? totalVolume / analytics.volumeHistory.length
        : 0.0;

    final weeksCovered = analytics.volumeHistory.length >= 2
        ? (DateTime.parse(analytics.volumeHistory.last.date)
                    .difference(DateTime.parse(analytics.volumeHistory.first.date))
                    .inDays /
                7.0)
            .abs()
            .clamp(0.5, double.infinity)
        : 1.0;
    final frequency = analytics.volumeHistory.length / weeksCovered;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Streak Row ──
          _StreakRow(
            currentStreak: currentStreak,
            longestStreak: longestStreak,
          ),
          const SizedBox(height: 12),
          // ── 2×2 Metric Grid ──
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  icon: Icons.fitness_center_rounded,
                  title: 'Total Volume',
                  value: totalVolume.toStringAsFixed(0),
                  unit: 'kg',
                  trend: volumeTrend,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCard(
                  icon: Icons.check_circle_outlined,
                  title: 'Consistency',
                  value: analytics.consistency.toStringAsFixed(0),
                  unit: '%',
                  trend: consistencyTrend,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  icon: Icons.bar_chart_rounded,
                  title: 'Frequency',
                  value: frequency.toStringAsFixed(1),
                  unit: '/wk',
                  trend: frequencyTrend,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCard(
                  icon: Icons.trending_up_rounded,
                  title: 'Avg Session',
                  value: avgVolume.toStringAsFixed(0),
                  unit: 'kg',
                  trend: averageVolumeTrend,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Streak Row ──

class _StreakRow extends StatelessWidget {
  final int currentStreak;
  final int longestStreak;

  const _StreakRow({
    required this.currentStreak,
    required this.longestStreak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.primary.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          // Current Streak
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CURRENT STREAK',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedText,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$currentStreak',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Icon(
                        Icons.local_fire_department_rounded,
                        size: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Vertical divider
          Container(
            width: 1,
            height: 40,
            color: AppColors.borderMuted,
          ),
          const SizedBox(width: 16),
          // Longest Streak
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LONGEST STREAK',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedText,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$longestStreak',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Metric Card ──

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final double trend;

  const _MetricCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = trend > 0;
    final trendColor = isPositive ? Colors.green : (trend < 0 ? Colors.red : AppColors.mutedText);
    final trendIcon = isPositive
        ? Icons.arrow_upward_rounded
        : (trend < 0 ? Icons.arrow_downward_rounded : Icons.remove_rounded);

    final String trendText;
    if (trend == 0.0) {
      trendText = 'Flat';
    } else {
      trendText = '${isPositive ? '+' : ''}${trend.toStringAsFixed(1)}%';
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + Title row
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.mutedText),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Value + unit
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(width: 3),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Trend badge
          Row(
            children: [
              Icon(trendIcon, size: 14, color: trendColor),
              const SizedBox(width: 2),
              Text(
                trendText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: trendColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Loading State ──

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 60),
        // Skeleton header
        Container(
          height: 32,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.borderMuted,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 24),
        // Skeleton summary card
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.borderMuted,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 16),
        // Skeleton chart
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.borderMuted,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 16),
        // Skeleton chart
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.borderMuted,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}

// ── Error State ──

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

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
      