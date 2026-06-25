import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// Dynamic insight widget that compares recent vs previous session volume.
///
/// Matches iOS PersonalInsights behavior.
class InsightsWidget extends StatelessWidget {
  final List<VolumeDataPoint> volumeHistory;

  const InsightsWidget({super.key, required this.volumeHistory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            size: 32,
            color: AppColors.primary,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              _insightText,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String get _insightText {
    if (volumeHistory.length < 2) {
      return 'Log more workouts to see personalized insights and trends here.';
    }

    final last = volumeHistory[volumeHistory.length - 1];
    final prev = volumeHistory[volumeHistory.length - 2];
    final diff = last.volume - prev.volume;

    if (diff > 0) {
      return 'You lifted ${diff.toStringAsFixed(0)} kg more volume than your previous session! Great progressive overload.';
    } else if (diff < 0) {
      return 'You lifted ${(-diff).toStringAsFixed(0)} kg less volume than your previous session. Keep pushing!';
    } else {
      return 'Your total volume matched your last session perfectly. Consistency is key!';
    }
  }
}
