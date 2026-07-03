import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_calendar_event_dto.dart';

/// Groups sessions by date in a vertical scrolling list.
class TrainerAgendaView extends StatelessWidget {
  final List<TrainerCalendarEventDto> events;
  final DateTime focusedDate;
  final void Function(TrainerCalendarEventDto)? onEventTap;

  const TrainerAgendaView({
    super.key,
    required this.events,
    required this.focusedDate,
    this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_month_rounded,
                size: 48, color: AppColors.mutedText.withValues(alpha: 0.3)),
            const SizedBox(height: 12),
            const Text('No sessions this day',
                style: TextStyle(color: AppColors.mutedText)),
          ],
        ),
      );
    }

    // Group events by date
    final grouped = <String, List<TrainerCalendarEventDto>>{};
    for (final e in events) {
      final date = _dateLabel(e.start);
      grouped.putIfAbsent(date, () => []).add(e);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: grouped.length,
      itemBuilder: (context, index) {
        final date = grouped.keys.elementAt(index);
        final dayEvents = grouped[date]!;
        return _DateGroup(
          label: date,
          events: dayEvents,
          onEventTap: onEventTap,
        );
      },
    );
  }

  String _dateLabel(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final eventDate = DateTime(dt.year, dt.month, dt.day);
    if (eventDate == today) return 'Today';
    final tomorrow = today.add(const Duration(days: 1));
    if (eventDate == tomorrow) return 'Tomorrow';
    return DateFormat('EEEE, MMM d').format(dt);
  }
}

class _DateGroup extends StatelessWidget {
  final String label;
  final List<TrainerCalendarEventDto> events;
  final void Function(TrainerCalendarEventDto)? onEventTap;

  const _DateGroup({
    required this.label,
    required this.events,
    this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foreground)),
        ),
        ...events.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _AgendaEventCard(event: e, onTap: () => onEventTap?.call(e)),
            )),
      ],
    );
  }
}

class _AgendaEventCard extends StatelessWidget {
  final TrainerCalendarEventDto event;
  final VoidCallback? onTap;

  const _AgendaEventCard({required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isBooking = event.type == 'booking';
    final color = isBooking ? const Color(0xFFAF52DE) : AppColors.primary;
    final time = _formatTime(event.start);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Row(
          children: [
            // Time column
            SizedBox(
              width: 48,
              child: Text(time,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground)),
            ),
            const SizedBox(width: 12),
            // Type indicator
            Container(
              width: 3,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(event.clientName,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.mutedText)),
                ],
              ),
            ),
            // Type badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                isBooking ? 'Booking' : 'Session',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return '';
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
