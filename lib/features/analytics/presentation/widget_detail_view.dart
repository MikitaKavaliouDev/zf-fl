import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import 'widgets/consistency_widget.dart';
import 'widgets/heatmap_widget.dart';
import 'widgets/insights_widget.dart';
import 'widgets/muscle_donut_chart_widget.dart';
import 'widgets/prs_list_widget.dart';
import 'widgets/volume_chart_widget.dart';
import 'widgets/volume_line_chart_widget.dart';
import 'widgets/weight_line_chart_widget.dart';

/// Full-screen expanded detail view for an analytics widget.
///
/// Matches iOS WidgetDetailView with larger charts and data lists.
class WidgetDetailView extends StatelessWidget {
  final String widgetType;
  final AnalyticsResponseDto analytics;
  final ProgressResponseDto progress;

  const WidgetDetailView({
    super.key,
    required this.widgetType,
    required this.analytics,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Sheet-style header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                border: const Border(
                  bottom: BorderSide(color: AppColors.borderMuted),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40), // balance
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded chart
                    _buildChart(context),
                    const SizedBox(height: 24),
                    // Data list
                    if (_hasList) ...[
                      Text(
                        _listTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildList(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _title {
    switch (widgetType) {
      case 'workoutsPerWeek':
        return 'Workouts Per Week';
      case 'consistency':
        return 'Consistency';
      case 'volumeProgression':
        return 'Volume Progression';
      case 'muscleFocus':
        return 'Muscle Focus';
      case 'prs':
        return 'Recent PRs';
      case 'heatMap':
        return 'Activity';
      case 'weightHistory':
        return 'Weight History';
      case 'insights':
        return 'Personal Insights';
      default:
        return 'Detail';
    }
  }

  bool get _hasList {
    return widgetType == 'prs' || widgetType == 'muscleFocus';
  }

  String get _listTitle {
    switch (widgetType) {
      case 'prs':
        return 'Records Log';
      case 'muscleFocus':
        return 'Muscle Breakdown';
      default:
        return '';
    }
  }

  Widget _buildChart(BuildContext context) {
    switch (widgetType) {
      case 'workoutsPerWeek':
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
              const Text(
                'Workouts Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: VolumeChartWidget(data: analytics.volumeHistory),
              ),
            ],
          ),
        );

      case 'consistency':
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(
            children: [
              const Text(
                'Consistency',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 120,
                child: ConsistencyWidget(
                  consistency: analytics.consistency.toInt(),
                ),
              ),
            ],
          ),
        );

      case 'volumeProgression':
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
              const Text(
                'Volume Progression',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: VolumeLineChartWidget(data: analytics.volumeHistory),
              ),
            ],
          ),
        );

      case 'muscleFocus':
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
              const Text(
                'Muscle Focus',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              MuscleDonutChartWidget(data: analytics.muscleDistribution),
            ],
          ),
        );

      case 'prs':
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: const Text(
            'Personal Records',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        );

      case 'heatMap':
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
              const Text(
                'Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              HeatmapWidget(heatmapDates: analytics.heatmapDates),
            ],
          ),
        );

      case 'weightHistory':
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
              const Text(
                'Weight History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: WeightLineChartWidget(data: progress.weight),
              ),
            ],
          ),
        );

      case 'insights':
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: InsightsWidget(volumeHistory: analytics.volumeHistory),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildList() {
    switch (widgetType) {
      case 'prs':
        return PRsListWidget(data: analytics.recentPRs);
      case 'muscleFocus':
        return MuscleDonutChartWidget(data: analytics.muscleDistribution);
      default:
        return const SizedBox.shrink();
    }
  }
}
