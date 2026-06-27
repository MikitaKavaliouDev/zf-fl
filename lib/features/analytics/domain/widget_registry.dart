import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import '../presentation/widgets/consistency_widget.dart';
import '../presentation/widgets/goals_widget.dart';
import '../presentation/widgets/heatmap_widget.dart';
import '../presentation/widgets/insights_widget.dart';
import '../presentation/widgets/muscle_donut_chart_widget.dart';
import '../presentation/widgets/prs_list_widget.dart';
import '../presentation/widgets/recovery_widget.dart';
import '../presentation/widgets/volume_chart_widget.dart';
import '../presentation/widgets/volume_line_chart_widget.dart';
import '../presentation/widgets/weight_line_chart_widget.dart';

class WidgetTypeEntry {
  final String title;
  final String? subtitle;
  final IconData icon;
  final bool hasDetail;
  final Widget Function(AnalyticsResponseDto, ProgressResponseDto) builder;
  final Widget Function(AnalyticsResponseDto, ProgressResponseDto)?
      detailChartBuilder;
  final String? detailListTitle;
  final Widget Function(AnalyticsResponseDto, ProgressResponseDto)?
      detailListBuilder;

  const WidgetTypeEntry({
    required this.title,
    this.subtitle,
    required this.icon,
    this.hasDetail = true,
    required this.builder,
    this.detailChartBuilder,
    this.detailListTitle,
    this.detailListBuilder,
  });
}

final Map<String, WidgetTypeEntry> widgetRegistry = {
  'workoutsPerWeek': WidgetTypeEntry(
    title: 'Workouts Per Week',
    icon: Icons.bar_chart_rounded,
    builder: (a, _) => VolumeChartWidget(data: a.volumeHistory),
    detailChartBuilder: (a, _) => _detailCard(
      'Workouts Activity',
      SizedBox(
        height: 250,
        child: VolumeChartWidget(data: a.volumeHistory),
      ),
    ),
  ),
  'consistency': WidgetTypeEntry(
    title: 'Consistency',
    subtitle: 'Workout adherence rate',
    icon: Icons.check_circle_outlined,
    builder: (a, _) => ConsistencyWidget(consistency: a.consistency.toInt()),
    detailChartBuilder: (a, _) => _detailCard(
      'Consistency',
      SizedBox(
        height: 120,
        child: ConsistencyWidget(consistency: a.consistency.toInt()),
      ),
    ),
  ),
  'volumeProgression': WidgetTypeEntry(
    title: 'Volume Progression',
    subtitle: 'Total volume over time',
    icon: Icons.trending_up_rounded,
    builder: (a, _) => VolumeLineChartWidget(data: a.volumeHistory),
    detailChartBuilder: (a, _) => _detailCard(
      'Volume Progression',
      SizedBox(
        height: 250,
        child: VolumeLineChartWidget(data: a.volumeHistory),
      ),
    ),
  ),
  'muscleFocus': WidgetTypeEntry(
    title: 'Muscle Focus',
    subtitle: 'Distribution by muscle group',
    icon: Icons.fitness_center_rounded,
    builder: (a, _) => MuscleDonutChartWidget(data: a.muscleDistribution),
    detailChartBuilder: (a, _) => _detailCard(
      'Muscle Focus',
      MuscleDonutChartWidget(data: a.muscleDistribution),
    ),
    detailListTitle: 'Muscle Breakdown',
    detailListBuilder: (a, _) =>
        MuscleDonutChartWidget(data: a.muscleDistribution),
  ),
  'prs': WidgetTypeEntry(
    title: 'Recent PRs',
    subtitle: 'Personal records',
    icon: Icons.emoji_events_rounded,
    builder: (a, _) => PRsListWidget(data: a.recentPRs),
    detailChartBuilder: (a, _) => _detailCard(
      'Personal Records',
      const SizedBox.shrink(),
    ),
    detailListTitle: 'Records Log',
    detailListBuilder: (a, _) => PRsListWidget(data: a.recentPRs),
  ),
  'heatMap': WidgetTypeEntry(
    title: 'Activity',
    subtitle: 'Last 12 weeks',
    icon: Icons.grid_on_rounded,
    builder: (a, _) => HeatmapWidget(heatmapDates: a.heatmapDates),
    detailChartBuilder: (a, _) => _detailCard(
      'Activity',
      HeatmapWidget(heatmapDates: a.heatmapDates),
    ),
  ),
  'weightHistory': WidgetTypeEntry(
    title: 'Weight History',
    subtitle: 'From check-ins',
    icon: Icons.monitor_weight_outlined,
    builder: (a, p) => WeightLineChartWidget(data: p.weight),
    detailChartBuilder: (a, p) => _detailCard(
      'Weight History',
      SizedBox(
        height: 250,
        child: WeightLineChartWidget(data: p.weight),
      ),
    ),
  ),
  'goal': WidgetTypeEntry(
    title: 'Fitness Goal',
    icon: Icons.track_changes_rounded,
    hasDetail: false,
    builder: (_, _) => const GoalsWidget(),
  ),
  'insights': WidgetTypeEntry(
    title: 'Personal Insights',
    icon: Icons.auto_awesome_rounded,
    builder: (a, _) => InsightsWidget(volumeHistory: a.volumeHistory),
    detailChartBuilder: (a, _) => _detailCard(
      'Personal Insights',
      InsightsWidget(volumeHistory: a.volumeHistory),
    ),
  ),
  'recovery': WidgetTypeEntry(
    title: 'Recovery & Load',
    subtitle: 'Training load analysis',
    icon: Icons.favorite_border_rounded,
    hasDetail: false,
    builder: (_, _) => const RecoveryWidget(),
  ),
};

/// Common detail card wrapper for expanded chart views.
Widget _detailCard(String title, Widget child) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.borderMuted),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    ),
  );
}
