import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// GitHub-style 365-day activity heatmap with intensity levels.
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

    final dateCounts = _countPerDay(heatmapDates);
    final now = DateTime.now();
    const totalDays = 365;

    // Build cells for the last 365 days, starting on Sunday
    final cells = _buildCells(dateCounts, now, totalDays);
    // Pad to start on Sunday
    final padded = _padToSunday(cells, now, totalDays);

    // Group into weeks (7 days each)
    final weeks = <List<_HeatmapCell>>[];
    for (int i = 0; i < padded.length; i += 7) {
      weeks.add(padded.sublist(i, (i + 7).clamp(0, padded.length)));
    }

    // Month labels
    final monthLabels = _buildMonthLabels(now, totalDays, weeks.length);

    final totalWorkouts = heatmapDates.length;

    const cellSize = 10.0;
    const cellSpacing = 2.0;
    const step = cellSize + cellSpacing;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month labels row
          SizedBox(
            height: 16,
            child: Row(
              children: [
                // Spacer for weekday labels
                const SizedBox(width: 24),
                ...monthLabels,
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Grid with weekday labels
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Weekday labels
              const SizedBox(
                width: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0),
                    _WeekdayLabel(text: 'Mon'),
                    SizedBox(height: cellSpacing),
                    SizedBox(height: step),
                    _WeekdayLabel(text: 'Wed'),
                    SizedBox(height: cellSpacing),
                    SizedBox(height: step),
                    _WeekdayLabel(text: 'Fri'),
                  ],
                ),
              ),
              // Grid columns
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: weeks.asMap().entries.map((entry) {
                  final week = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(right: cellSpacing),
                    child: Column(
                      children: week.map((cell) {
                        return Tooltip(
                          message: cell.hasWorkout
                              ? '${cell.dateStr}: ${cell.intensity} workout${cell.intensity > 1 ? 's' : ''}'
                              : cell.dateStr,
                          child: Container(
                            width: cellSize,
                            height: cellSize,
                            margin: const EdgeInsets.only(bottom: cellSpacing),
                            decoration: BoxDecoration(
                              color: _intensityColor(cell.intensity),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Legend + total count
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Less',
                style: TextStyle(fontSize: 10, color: AppColors.mutedText),
              ),
              const SizedBox(width: 6),
              ...[0, 1, 2, 3, 4].map((level) => Container(
                    width: cellSize,
                    height: cellSize,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: _intensityColor(level),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )),
              const SizedBox(width: 6),
              const Text(
                'More',
                style: TextStyle(fontSize: 10, color: AppColors.mutedText),
              ),
              const SizedBox(width: 12),
              Text(
                '$totalWorkouts Workouts',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, int> _countPerDay(List<String> dates) {
    final counts = <String, int>{};
    for (final d in dates) {
      counts[d] = (counts[d] ?? 0) + 1;
    }
    return counts;
  }

  List<_HeatmapCell> _buildCells(
      Map<String, int> dateCounts, DateTime now, int totalDays) {
    final cells = <_HeatmapCell>[];
    for (int i = totalDays - 1; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final dateStr = _formatDate(date);
      final count = dateCounts[dateStr] ?? 0;
      cells.add(_HeatmapCell(
        date: date,
        dateStr: dateStr,
        intensity: count,
      ));
    }
    return cells;
  }

  List<_HeatmapCell> _padToSunday(
      List<_HeatmapCell> cells, DateTime now, int totalDays) {
    final firstDate = now.subtract(Duration(days: totalDays - 1));
    // weekday: 1=Mon...7=Sun in Dart
    final weekday = firstDate.weekday;
    // days to prepend to make first column start on Monday
    final daysToPrepend = weekday - 1;
    if (daysToPrepend <= 0) return cells;
    final padding = List.generate(
      daysToPrepend,
      (i) {
        final d = firstDate.subtract(Duration(days: daysToPrepend - i));
        return _HeatmapCell(
          date: d,
          dateStr: _formatDate(d),
          intensity: 0,
        );
      },
    );
    return [...padding, ...cells];
  }

  Color _intensityColor(int count) {
    if (count == 0) return AppColors.borderMuted;
    if (count == 1) return const Color(0xFF34C759).withValues(alpha: 0.3);
    if (count == 2) return const Color(0xFF34C759).withValues(alpha: 0.5);
    if (count == 3) return const Color(0xFF34C759).withValues(alpha: 0.7);
    return const Color(0xFF34C759); // 4+
  }

  String _formatDate(DateTime date) {
    return '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  List<Widget> _buildMonthLabels(
      DateTime now, int totalDays, int totalWeeks) {
    final start = now.subtract(Duration(days: totalDays - 1));
    final labels = <Widget>[];
    int? lastMonth;
    int? lastWeekCol;

    for (int i = 0; i < totalDays; i++) {
      final date = start.add(Duration(days: i));
      final month = date.month;
      if (month != lastMonth) {
        final weekCol = i ~/ 7;
        if (lastWeekCol == null || weekCol - lastWeekCol >= 2) {
          labels.add(
            Padding(
              padding: EdgeInsets.only(left: weekCol * 12.0),
              child: Text(
                _monthAbbr(month),
                style: const TextStyle(
                    fontSize: 10, color: AppColors.mutedText),
              ),
            ),
          );
          lastWeekCol = weekCol;
        }
        lastMonth = month;
      }
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

class _WeekdayLabel extends StatelessWidget {
  final String text;
  const _WeekdayLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w500,
        color: AppColors.mutedText,
      ),
    );
  }
}

class _HeatmapCell {
  final DateTime date;
  final String dateStr;
  final int intensity;

  bool get hasWorkout => intensity > 0;

  const _HeatmapCell({
    required this.date,
    required this.dateStr,
    required this.intensity,
  });
}
