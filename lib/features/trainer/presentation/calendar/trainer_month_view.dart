import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_calendar_event_dto.dart';

/// Month grid with event count indicators per day cell.
class TrainerMonthView extends StatelessWidget {
  final List<TrainerCalendarEventDto> events;
  final DateTime focusedDate;
  final void Function(DateTime)? onDayTap;

  const TrainerMonthView({
    super.key,
    required this.events,
    required this.focusedDate,
    this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Build a map: dateOnly -> list of events
    final eventMap = <DateTime, List<TrainerCalendarEventDto>>{};
    for (final e in events) {
      final dt = DateTime.tryParse(e.start);
      if (dt == null) continue;
      final key = DateTime(dt.year, dt.month, dt.day);
      eventMap.putIfAbsent(key, () => []).add(e);
    }

    final firstDay = DateTime(focusedDate.year, focusedDate.month, 1);
    final lastDay = DateTime(focusedDate.year, focusedDate.month + 1, 0);
    final startWeekday = firstDay.weekday % 7; // Monday=0
    final daysInMonth = lastDay.day;

    // Build grid: 7 cols (Mon-Sun), 5-6 rows
    final cells = <DateTime?>[];
    // leading empty cells
    for (var i = 0; i < startWeekday; i++) {
      cells.add(null);
    }
    for (var d = 1; d <= daysInMonth; d++) {
      cells.add(DateTime(focusedDate.year, focusedDate.month, d));
    }

    final rows = (cells.length / 7).ceil();

    return Column(
      children: [
        // Day-of-week headers
        Row(
          children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
              .map((d) => Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(d,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mutedText)),
                      ),
                    ),
                  ))
              .toList(),
        ),
        // Grid
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 0.85,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: rows * 7,
            itemBuilder: (context, index) {
              if (index >= cells.length) return const SizedBox.shrink();
              final date = cells[index];
              if (date == null) return const SizedBox.shrink();

              final dayEvents = eventMap[date] ?? [];
              final isToday = date == today;

              return GestureDetector(
                onTap: () => onDayTap?.call(date),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isToday
                        ? AppColors.primary.withValues(alpha: 0.12)
                        : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isToday ? FontWeight.w700 : FontWeight.w400,
                          color: isToday
                              ? AppColors.primary
                              : AppColors.foreground,
                        ),
                      ),
                      if (dayEvents.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        // Client count circles (max 3 overlapping)
                        SizedBox(
                          height: 16,
                          child: Stack(
                            children: [
                              for (var i = 0;
                                  i < dayEvents.length.clamp(0, 3);
                                  i++)
                                Positioned(
                                  left: i * 8.0,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: i == 0
                                          ? AppColors.primary
                                          : i == 1
                                              ? const Color(0xFFAF52DE)
                                              : const Color(0xFFFF9500),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.card, width: 1.5),
                                    ),
                                  ),
                                ),
                              if (dayEvents.length > 3)
                                Positioned(
                                  left: 24,
                                  child: Text(
                                    '+${dayEvents.length - 3}',
                                    style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.mutedText),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
