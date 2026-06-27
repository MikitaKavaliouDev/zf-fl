import 'package:flutter/material.dart';

import 'package:ziro_fit/core/theme/app_theme.dart';

import 'schedule_animations.dart';

// ────────────────────────────────────────────
// Diagonal cross-out painter for past dates
// ────────────────────────────────────────────

class CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CrossPainter({required this.color, this.strokeWidth = 1.5});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(4, 4),
      Offset(size.width - 4, size.height - 4),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - 4, 4),
      Offset(4, size.height - 4),
      paint,
    );
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}

// ────────────────────────────────────────────
// Calendar Day Cell with spring-selection and
// smooth color morphing
// ────────────────────────────────────────────

class DayCell extends StatelessWidget {
  final int day;
  final DateTime date;
  final int slotCount;
  final bool isPast;
  final bool isToday;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.day,
    required this.date,
    required this.slotCount,
    required this.isPast,
    required this.isToday,
    required this.isSelected,
    required this.onTap,
  });

  Color _heatColor(int count) {
    if (count == 0) return AppColors.borderMuted;
    if (count <= 2) return const Color(0xFFBBF7D0);
    if (count <= 4) return const Color(0xFF4ADE80);
    return const Color(0xFF16A34A);
  }

  Color _textColor(int count) {
    if (count >= 3) return Colors.white;
    return AppColors.foreground;
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = isPast && !isToday;
    final heat = isDisabled ? AppColors.borderMuted : _heatColor(slotCount);
    final txtColor = isSelected
        ? Colors.white
        : isDisabled
            ? AppColors.mutedText.withAlpha(80)
            : _textColor(slotCount);
    final bgColor = isSelected ? AppColors.primary : heat;
    final borderColor = isToday && !isSelected
        ? AppColors.primary.withAlpha(100)
        : Colors.transparent;

    return TapScale(
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          height: 38,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: SelectionSpring(
            isSelected: isSelected,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isToday || isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                      color: txtColor,
                      decoration:
                          isDisabled ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.mutedText.withAlpha(120),
                      decorationThickness: 1.5,
                    ),
                    child: Text('$day'),
                  ),
                ),
                if (isDisabled)
                  Positioned.fill(
                    child: CustomPaint(
                        painter: CrossPainter(
                          color: AppColors.mutedText.withAlpha(60),
                        ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
