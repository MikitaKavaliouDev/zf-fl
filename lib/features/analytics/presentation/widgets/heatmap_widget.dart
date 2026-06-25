import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Simple grid-based activity heatmap showing workout days over ~12 weeks.
class HeatmapWidget extends StatelessWidget {
  final List<String> heatmapDates;

  const HeatmapWidget({super.key, required this.heatmapDates});

  @override
  Widget build(BuildContext context) {
    if (heatmapDates.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No activity data yet',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
        ),
      );
    }

    final dateSet = heatmapDates.toSet();
    final now = DateTime.now();
    const totalDays = 84; // ~12 weeks

    // Build cells for the last 84 days
    final cells = <_HeatmapCell>[];
    for (int i = totalDays - 1; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final dateStr = _formatDate(date);
      cells.add(_HeatmapCell(
        date: date,
        dateStr: dateStr,
        hasWorkout: dateSet.contains(dateStr),
      ));
    }

    // Group into weeks (7 days each)
    final weeks = <List<_HeatmapCell>>[];
    for (int i = 0; i < cells.length; i += 7) {
      weeks.add(cells.sublist(i, (i + 7).clamp(0, cells.length)));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Month labels
        SizedBox(
          height: 16,
          child: Row(
            children: _buildMonthLabels(now, totalDays),
          ),
        ),
        const SizedBox(height: 4),
        // Grid
        SizedBox(
          height: weeks.length * 14.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: weeks.map((week) {
              return Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Column(
                  children: week.map((cell) {
                    return Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: cell.hasWorkout
                            ? AppColors.primary.withValues(alpha: 0.7)
                            : AppColors.borderMuted,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        // Legend
        Row(
          children: [
            _legendItem(false, 'No workout'),
            const SizedBox(width: 12),
            _legendItem(true, 'Workout'),
          ],
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  List<Widget> _buildMonthLabels(DateTime now, int totalDays) {
    final start = now.subtract(Duration(days: totalDays - 1));
    final labels = <Widget>[];
    for (int i = 0; i <= 3; i++) {
      final month = DateTime(start.year, start.month + i, 1);
      if (month.isAfter(now.add(const Duration(days: 1)))) break;
      if (labels.isNotEmpty) labels.add(const SizedBox(width: 60));
      labels.add(
        Text(
          _monthAbbr(month.month),
          style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
        ),
      );
    }
    return labels;
  }

  String _monthAbbr(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return months[month - 1];
  }
}

class _HeatmapCell {
  final DateTime date;
  final String dateStr;
  final bool hasWorkout;

  const _HeatmapCell({
    required this.date,
    required this.dateStr,
    required this.hasWorkout,
  });
}

Widget _legendItem(bool active, String label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: active
? AppColors.primary.withValues(alpha: 0.7)
                              : AppColors.borderMuted,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      const SizedBox(width: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
      ),
    ],
  );
}
