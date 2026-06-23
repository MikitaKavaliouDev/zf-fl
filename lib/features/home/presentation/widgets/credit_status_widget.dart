import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Card showing the client's remaining session credits.
///
/// Matches iOS CreditStatusWidget — PersonalHomeView.swift lines 473-476.
class CreditStatusWidget extends StatelessWidget {
  final int remainingCredits;

  const CreditStatusWidget({super.key, required this.remainingCredits});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Purple ticket icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_activity_rounded,
              size: 22,
              color: Color(0xFF8B5CF6),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Session Credits',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$remainingCredits Remaining',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
