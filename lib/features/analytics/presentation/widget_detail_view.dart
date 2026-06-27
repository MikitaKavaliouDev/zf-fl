import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import '../domain/widget_registry.dart';

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
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
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
                    widgetRegistry[widgetType]?.title ?? 'Detail',
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
                    if (widgetRegistry[widgetType]?.detailListBuilder != null) ...[
                      Text(
                        widgetRegistry[widgetType]?.detailListTitle ?? '',
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

  Widget _buildChart(BuildContext context) {
    final entry = widgetRegistry[widgetType];
    if (entry?.detailChartBuilder != null) {
      return entry!.detailChartBuilder!(analytics, progress);
    }
    return const SizedBox.shrink();
  }

  Widget _buildList() {
    final entry = widgetRegistry[widgetType];
    if (entry?.detailListBuilder != null) {
      return entry!.detailListBuilder!(analytics, progress);
    }
    return const SizedBox.shrink();
  }
}
