import 'package:flutter/material.dart';

/// Check-in banner with two visual states (completed / pending).
///
/// Matches iOS CheckInBanner — PersonalHomeView.swift lines 617-713.
class CheckInBanner extends StatelessWidget {
  final bool isComplete;
  final VoidCallback onTapCheckIn;
  final bool hasTrainer;

  const CheckInBanner({
    super.key,
    required this.isComplete,
    required this.onTapCheckIn,
    required this.hasTrainer,
  });

  @override
  Widget build(BuildContext context) {
    if (isComplete) {
      return _buildCompleteBanner();
    }
    return _buildPendingBanner();
  }

  Widget _buildCompleteBanner() {
    return Container(
      key: const ValueKey('checkInBannerComplete'),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF22C55E),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Check-in Complete',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Great job! Your trainer will review it shortly.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(
            Icons.verified_rounded,
            size: 36,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildPendingBanner() {
    return GestureDetector(
      key: const ValueKey('checkInBanner'),
      onTap: onTapCheckIn,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFFF97316), Color(0xFFEC4899)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF97316).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Weekly Check-in',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hasTrainer
                        ? 'Update your trainer on your progress'
                        : 'Track your weekly progress',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.check_circle_outline,
              size: 36,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
