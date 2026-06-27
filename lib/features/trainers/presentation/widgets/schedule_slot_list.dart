import 'package:flutter/material.dart';

import 'package:ziro_fit/core/theme/app_theme.dart';

import 'schedule_animations.dart';

// ────────────────────────────────────────────
// Staggered time-slot list with cascading animation
// ────────────────────────────────────────────

class StaggeredSlotList extends StatelessWidget {
  final List<String> slots;
  final String? selectedSlot;
  final Animation<double> animation;
  final ValueChanged<String> onTap;

  const StaggeredSlotList({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.animation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: slots.asMap().entries.map((entry) {
        final idx = entry.key;
        final slot = entry.value;
        final isSelected = selectedSlot == slot;
        final t = CurvedAnimation(
          parent: animation,
          curve: Interval(
            idx * 0.08,
            0.4 + idx * 0.06,
            curve: Curves.easeOutCubic,
          ),
        );
        return FadeTransition(
          opacity: t,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(t),
            child: TapScale(
              child: GestureDetector(
                onTap: () => onTap(slot),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.card,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          isSelected ? AppColors.primary : AppColors.borderMuted,
                    ),
                  ),
                  child: Text(
                    _formatTimeSlot(slot),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppColors.foreground,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _formatTimeSlot(String slot) {
    try {
      final parts = slot.split(':');
      final hour = int.parse(parts[0]);
      final minute = parts.length > 1 ? int.parse(parts[1]) : 0;
      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      final minuteStr = minute > 0 ? ':$minute' : '';
      return '$displayHour$minuteStr $period';
    } catch (_) {
      return slot;
    }
  }
}
