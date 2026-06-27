import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/analytics_cubit.dart';
import '../cubit/analytics_state.dart';

/// iOS-style bottom sheet for toggling widget visibility and reordering.
///
/// Active widgets (green switches, drag handle), available widgets (add
/// button). Matches iOS ManageWidgetsView.
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
    'exerciseProgress': 'Exercise Progress',
    'goal': 'Fitness Goal',
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
    'exerciseProgress': Icons.show_chart_rounded,
    'goal': Icons.track_changes_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
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
              // Header with ZiroSheetHeader-style layout
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 40), // balance
                    const Expanded(
                      child: Text(
                        'Manage Widgets',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
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
                    final active = sorted.where((w) => w.isVisible).toList();
                    final available =
                        sorted.where((w) => !w.isVisible).toList();

                    return ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.only(bottom: 24),
                      children: [
                        // Active Widgets section
                        if (active.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                            child: Text(
                              'ACTIVE WIDGETS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedText,
                              ),
                            ),
                          ),
                          ReorderableListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: active.length,
                            onReorderItem: (oldIndex, newIndex) {
                              final cubit = context.read<AnalyticsCubit>();
                              final s = cubit.state;
                              if (s is AnalyticsLoaded) {
                                final allSorted = [...s.widgets.widgets]
                                  ..sort((a, b) => a.order.compareTo(b.order));
                                final activeIndices = allSorted
                                    .asMap()
                                    .entries
                                    .where((e) => e.value.isVisible)
                                    .map((e) => e.key)
                                    .toList();
                                if (oldIndex < activeIndices.length &&
                                    newIndex < activeIndices.length) {
                                  cubit.reorderWidgets(
                                      activeIndices[oldIndex],
                                      activeIndices[newIndex]);
                                }
                              }
                            },
                            itemBuilder: (context, index) {
                              final item = active[index];
                              final label =
                                  _widgetLabels[item.type] ?? item.type;
                              final icon =
                                  _widgetIcons[item.type] ?? Icons.widgets_outlined;
                              return _ActiveWidgetItem(
                                key: ValueKey(item.id),
                                label: label,
                                icon: icon,
                                onToggle: () {
                                  context
                                      .read<AnalyticsCubit>()
                                      .toggleWidgetVisibility(item.id);
                                },
                              );
                            },
                          ),
                        ],
                        // Available Widgets section
                        if (available.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                            child: Text(
                              'AVAILABLE WIDGETS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedText,
                              ),
                            ),
                          ),
                          ...available.map((item) {
                            final label =
                                _widgetLabels[item.type] ?? item.type;
                            final icon =
                                _widgetIcons[item.type] ?? Icons.widgets_outlined;
                            return _AvailableWidgetItem(
                              label: label,
                              icon: icon,
                              onAdd: () {
                                context
                                    .read<AnalyticsCubit>()
                                    .toggleWidgetVisibility(item.id);
                              },
                            );
                          }),
                        ],
                        if (active.isEmpty && available.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(32),
                            child: Center(
                              child: Text(
                                'All widgets are active',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.mutedText),
                              ),
                            ),
                          ),
                      ],
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

class _ActiveWidgetItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onToggle;

  const _ActiveWidgetItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          // Drag handle
          const Icon(
            Icons.drag_handle_rounded,
            color: AppColors.mutedText,
            size: 24,
          ),
          const SizedBox(width: 12),
          // Icon
          Icon(icon, size: 20, color: AppColors.foreground),
          const SizedBox(width: 12),
          // Label
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
          // iOS green switch
          SizedBox(
            height: 28,
            child: Transform.scale(
              scale: 0.85,
              child: CupertinoSwitch(
                value: true,
                onChanged: (_) => onToggle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailableWidgetItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onAdd;

  const _AvailableWidgetItem({
    required this.label,
    required this.icon,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 24), // align with drag handle space
          Icon(icon, size: 20, color: AppColors.mutedText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            color: AppColors.primary,
            iconSize: 24,
            onPressed: onAdd,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

/// A Cupertino-style switch since we can't import cupertino directly without
/// the full CupertinoApp. This matches iOS appearance.
class CupertinoSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;

  const CupertinoSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor = const Color(0xFF34C759),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Container(
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          color: value ? activeColor : AppColors.borderMuted,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(2),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
