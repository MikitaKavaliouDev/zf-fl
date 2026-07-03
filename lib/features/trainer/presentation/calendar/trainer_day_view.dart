import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_calendar_event_dto.dart';

/// Hour-based timeline view (06:00 – 22:00).
class TrainerDayView extends StatelessWidget {
  final List<TrainerCalendarEventDto> events;
  final DateTime focusedDate;
  final void Function(TrainerCalendarEventDto)? onEventTap;

  const TrainerDayView({
    super.key,
    required this.events,
    required this.focusedDate,
    this.onEventTap,
  });

  static const _startHour = 6;
  static const _endHour = 22;
  static const _hourHeight = 60.0;
  static const _timeColumnWidth = 48.0;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 16, bottom: 100),
      child: SizedBox(
        height: (_endHour - _startHour) * _hourHeight,
        child: Stack(
          children: [
            // Hour grid lines
            ...List.generate(_endHour - _startHour, (i) {
              final hour = _startHour + i;
              final top = i * _hourHeight;
              return Positioned(
                left: _timeColumnWidth,
                top: top,
                right: 0,
                child: Container(
                  height: _hourHeight,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: i == 0 ? AppColors.borderActive : AppColors.borderMuted,
                        width: i == 0 ? 1 : 0.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2),
                    child: Text(
                      '${hour.toString().padLeft(2, '0')}:00',
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.mutedText),
                    ),
                  ),
                ),
              );
            }),
            // Event blocks
            ...events.map((e) {
              final start = DateTime.tryParse(e.start);
              final end = DateTime.tryParse(e.end);
              if (start == null || end == null) return const SizedBox.shrink();

              final startMinutes =
                  (start.hour - _startHour) * 60 + start.minute;
              final endMinutes =
                  (end.hour - _startHour) * 60 + end.minute;
              final duration = endMinutes - startMinutes;
              final top = (startMinutes / 60) * _hourHeight;
              final height = (duration / 60) * _hourHeight;

              if (top < 0 || top > (_endHour - _startHour) * _hourHeight) {
                return const SizedBox.shrink();
              }

              final isBooking = e.type == 'booking';
              final color =
                  isBooking ? const Color(0xFFAF52DE) : AppColors.primary;

              return Positioned(
                left: _timeColumnWidth + 8,
                top: top,
                right: 0,
                height: height.clamp(24, _hourHeight * 2),
                child: GestureDetector(
                  onTap: () => onEventTap?.call(e),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(color: color, width: 3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (height > 30)
                          Text(
                            e.clientName,
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.mutedText),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            // Current time indicator (only if today)
            ..._buildTimeIndicator(now),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTimeIndicator(DateTime now) {
    final isToday = now.year == focusedDate.year &&
        now.month == focusedDate.month &&
        now.day == focusedDate.day;
    if (!isToday) return const [];
    final nowMinutes = (now.hour - _startHour) * 60 + now.minute;
    final indicatorTop = (nowMinutes / 60) * _hourHeight;
    if (indicatorTop < 0 ||
        indicatorTop > (_endHour - _startHour) * _hourHeight) {
      return const [];
    }
    return [
      Positioned(
        left: _timeColumnWidth,
        top: indicatorTop,
        right: 0,
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(height: 1, color: Colors.red),
            ),
          ],
        ),
      ),
    ];
  }
}
