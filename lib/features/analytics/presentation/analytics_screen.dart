import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/analytics_cubit.dart';
import '../cubit/analytics_state.dart';
import '../data/models/analytics_response_dto.dart';
import 'manage_widgets_sheet.dart';
import 'widgets/consistency_widget.dart';
import 'widgets/heatmap_widget.dart';
import 'widgets/muscle_donut_chart_widget.dart';
import 'widgets/prs_list_widget.dart';
import 'widgets/volume_chart_widget.dart';
import 'widgets/volume_line_chart_widget.dart';
import 'widgets/weight_line_chart_widget.dart';
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
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
          builder: (context, state) {
            return switch (state) {
              AnalyticsInitial() => const SizedBox.shrink(),
              AnalyticsLoading() => const _LoadingView(),
              AnalyticsError(:final message) => _ErrorView(
                  message: message,
                  onRetry: () => context.read<AnalyticsCubit>().loadData(),
                ),
              AnalyticsLoaded() => _LoadedView(state: state),
            };
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
            ),
          ),
          // Performance summary
          if (_hasSummaryData)
            SliverToBoxAdapter(
              child: _PerformanceSummaryWidget(
                analytics: state.analytics,
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
    final analytics = state.analytics;
    final progress = state.progress;

    switch (type) {
      case 'workoutsPerWeek':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Workouts Per Week',
            icon: Icons.bar_chart_rounded,
            child: VolumeChartWidget(data: analytics.volumeHistory),
          ),
        );
      case 'consistency':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Consistency',
            subtitle: 'Workout adherence rate',
            icon: Icons.check_circle_outlined,
            child: ConsistencyWidget(consistency: analytics.consistency),
          ),
        );
      case 'volumeProgression':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Volume Progression',
            subtitle: 'Total volume over time',
            icon: Icons.trending_up_rounded,
            child: VolumeLineChartWidget(data: analytics.volumeHistory),
          ),
        );
      case 'muscleFocus':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Muscle Focus',
            subtitle: 'Distribution by muscle group',
            icon: Icons.fitness_center_rounded,
            child: MuscleDonutChartWidget(
              data: analytics.muscleDistribution,
            ),
          ),
        );
      case 'prs':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Recent PRs',
            subtitle: 'Personal records',
            icon: Icons.emoji_events_rounded,
            child: PRsListWidget(data: analytics.recentPRs),
          ),
        );
      case 'heatMap':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Activity',
            subtitle: 'Last 12 weeks',
            icon: Icons.grid_on_rounded,
            child: HeatmapWidget(heatmapDates: analytics.heatmapDates),
          ),
        );
      case 'weightHistory':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Weight History',
            subtitle: 'From check-ins',
            icon: Icons.monitor_weight_outlined,
            child: WeightLineChartWidget(data: progress.weight),
          ),
        );
      case 'goal':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Fitness Goal',
            icon: Icons.track_changes_rounded,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Icon(Icons.track_changes_rounded, size: 32, color: AppColors.mutedText.withValues(alpha: 0.5)),
                  const SizedBox(height: 8),
                  Text(
                    'Set a fitness goal to track your progress.',
                    style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      case 'insights':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Personal Insights',
            icon: Icons.auto_awesome_rounded,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Icon(Icons.auto_awesome_rounded, size: 32, color: AppColors.mutedText.withValues(alpha: 0.5)),
                  const SizedBox(height: 8),
                  Text(
                    'Log more workouts to see personalized insights here.',
                    style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      case 'recovery':
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: WidgetContainer(
            title: 'Recovery & Load',
            icon: Icons.favorite_border_rounded,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Icon(Icons.favorite_border_rounded, size: 32, color: AppColors.mutedText.withValues(alpha: 0.5)),
                  const SizedBox(height: 8),
                  Text(
                    'Recovery tracking is under development.',
                    style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
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

  const _GlassHeader({required this.onManageWidgets});

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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Measurements coming soon')),
                  );
                },
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

  const _PerformanceSummaryWidget({required this.analytics});

  @override
  Widget build(BuildContext context) {
    final totalVolume = analytics.volumeHistory.fold<double>(
      0,
      (sum, d) => sum + d.volume,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Container(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Volume',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${totalVolume.toStringAsFixed(0)} kg',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consistency',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '${analytics.consistency}%',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        analytics.consistency >= 70
                            ? Icons.trending_up_rounded
                            : Icons.trending_down_rounded,
                        size: 20,
                        color: analytics.consistency >= 70
                            ? Colors.green
                            : Colors.orange,
                      ),
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
