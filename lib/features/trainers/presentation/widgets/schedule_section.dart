import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_schedule_dto.dart';

/// Weekly schedule section with day selector and time slots.
/// Matches iOS scheduleSection (lines 451-525).
class ScheduleSection extends StatefulWidget {
  final TrainerScheduleDto? schedule;
  final bool isLoading;
  final VoidCallback? onDaySelected;

  const ScheduleSection({
    super.key,
    this.schedule,
    this.isLoading = false,
    this.onDaySelected,
  });

  @override
  State<ScheduleSection> createState() => _ScheduleSectionState();
}

class _ScheduleSectionState extends State<ScheduleSection> {
  String _selectedDay = 'Monday';

  static const _days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Schedule'),
        if (widget.isLoading)
          const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (widget.schedule != null)
          _buildScheduleContent()
        else
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              'Loading schedule...',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          ),
      ],
    );
  }

  Widget _buildScheduleContent() {
    final schedule = widget.schedule!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          // Day selector
          SizedBox(
            height: 46,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _days.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final day = _days[index];
                final slots = schedule.availability[day] ?? [];
                final hasSlots = slots.isNotEmpty;
                final isSelected = _selectedDay == day;

                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedDay = day);
                    widget.onDaySelected?.call();
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.mutedSurface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.substring(0, 3).toUpperCase(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : AppColors.foreground,
                          ),
                        ),
                        if (hasSlots)
                          Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                              color: Color(0xFF22C55E),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Time slots
          if (schedule.availability.containsKey(_selectedDay)) ...[
            const SizedBox(height: 4),
            Text(
              'Available on $_selectedDay',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 8),
            _buildTimeSlots(schedule.availability[_selectedDay]!),
          ] else
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'No availability this day',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimeSlots(List<String> slots) {
    if (slots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'No availability this day',
          style: TextStyle(fontSize: 12, color: AppColors.mutedText),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: slots.map((slot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 11,
                color: AppColors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                slot,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            height: 1,
            width: 20,
            child: Divider(),
          ),
          const SizedBox(width: 0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
