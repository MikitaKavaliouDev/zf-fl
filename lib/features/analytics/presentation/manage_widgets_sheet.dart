import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/analytics_cubit.dart';
import '../cubit/analytics_state.dart';

/// Bottom sheet modal for toggling visibility and reordering analytics widgets.
///
/// Matches iOS ManageWidgetsView pattern.
class ManageWidgetsSheet extends StatelessWidget {
  const ManageWidgetsSheet({super.key});

  static const Map<String, String> _widgetLabels = {
    'workoutsPerWeek': 'Workouts Per Week',
    'consistency': 'Consistency',
    'volumeProgression': 'Volume Progression',
    'muscleFocus': 'Muscle Focus',
    'prs': 'Recent PRs',
    'heatMap': 'Activity Heatmap',
    'insights': 'AI Insights',
    'recovery': 'Recovery & Load',
    'weightHistory': 'Weight History',
  };

  static const Map<String, IconData> _widgetIcons = {
    'workoutsPerWeek': Icons.bar_chart_rounded,
    'consistency': Icons.check_circle_outlined,
    'volumeProgression': Icons.trending_up_rounded,
    'muscleFocus': Icons.fitness_center_rounded,
    'prs': Icons.emoji_events_rounded,
    'heatMap': Icons.grid_on_rounded,
    'insights': Icons.psychology_rounded,
    'recovery': Icons.restart_alt_rounded,
    'weightHistory': Icons.monitor_weight_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      'Manage Widgets',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<AnalyticsCubit>().saveWidgetConfig();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Widget list
              Expanded(
                child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
                  builder: (context, state) {
                    if (state is! AnalyticsLoaded) {
                      return const SizedBox.shrink();
                    }
                    final sorted = [...state.widgets.widgets]
                      ..sort((a, b) => a.order.compareTo(b.order));
                    return ReorderableListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: sorted.length,
                      onReorder: (oldIndex, newIndex) {
                        context
                            .read<AnalyticsCubit>()
                            .reorderWidgets(oldIndex, newIndex);
                      },
                      itemBuilder: (context, index) {
                        final item = sorted[index];
                        final label =
                            _widgetLabels[item.type] ?? item.type;
                        final icon =
                            _widgetIcons[item.type] ?? Icons.widgets_outlined;
                        return _WidgetConfigItem(
                          key: ValueKey(item.id),
                          label: label,
                          icon: icon,
                          isVisible: item.isVisible,
                          onToggle: () {
                            context
                                .read<AnalyticsCubit>()
                                .toggleWidgetVisibility(item.id);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WidgetConfigItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isVisible;
  final VoidCallback onToggle;

  const _WidgetConfigItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const Icon(
            Icons.drag_handle_rounded,
            color: AppColors.mutedText,
            size: 24,
          ),
          const SizedBox(width: 12),
          Icon(icon, size: 20, color: AppColors.foreground),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
          Switch(
            value: isVisible,
            onChanged: (_) => onToggle(),
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
