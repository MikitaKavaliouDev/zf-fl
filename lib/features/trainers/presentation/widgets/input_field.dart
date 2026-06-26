import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Tappable text display for weight/reps values with focus highlighting.
///
/// Not a real text input — tapping triggers the custom numeric keyboard
/// overlay rendered by the workout session screen.
class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.text,
    required this.isFocused,
    required this.onTap,
  });

  final String text;
  final bool isFocused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 38,
        decoration: BoxDecoration(
          color: isFocused
              ? AppColors.primary.withValues(alpha: 0.06)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isFocused ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isFocused ? AppColors.primary : AppColors.foreground,
          ),
        ),
      ),
    );
  }
}
