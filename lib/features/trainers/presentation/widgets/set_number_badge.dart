import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Circular badge showing the set number with completion styling.
class SetNumberBadge extends StatelessWidget {
  const SetNumberBadge({
    super.key,
    required this.number,
    this.isCompleted = false,
  });

  final int number;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green.withValues(alpha: 0.15)
            : AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isCompleted ? Colors.green : AppColors.mutedText,
        ),
      ),
    );
  }
}
