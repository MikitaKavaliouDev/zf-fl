import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Section displaying the user's daily targets.
///
/// Currently shows an empty state with a prompt to set a daily target.
/// The [isEnabled] prop controls whether the section is active.
/// [onTapSetTarget] and [onTapAddTarget] are wired from the parent for navigation.
class DailyTargetsSection extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onTapSetTarget;
  final VoidCallback? onTapAddTarget;

  const DailyTargetsSection({
    super.key,
    required this.isEnabled,
    this.onTapSetTarget,
    this.onTapAddTarget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Daily Targets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              IconButton(
                onPressed: onTapAddTarget,
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.primary,
                  size: 24,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Empty state card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No daily targets set',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onTapSetTarget,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                child: const Text(
                  'Set a Daily Target',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
