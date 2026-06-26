import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import 'workout_formatting.dart';

/// Combined timer bar showing the session timer, rest countdown,
/// rest progress bar, and long-session warning.
///
/// Extracted from the monolithic _buildActive method — SRP.
class SessionTimerBar extends StatelessWidget {
  const SessionTimerBar({
    super.key,
    required this.elapsed,
    required this.isPaused,
    required this.isResting,
    required this.restElapsed,
    this.restRemaining,
    this.restDuration,
    required this.showLongSessionWarning,
    required this.dismissedLongWarning,
    required this.onRestTimerTap,
    required this.onDismissLongWarning,
  });

  final Duration elapsed;
  final bool isPaused;
  final bool isResting;
  final Duration restElapsed;
  final int? restRemaining;
  final int? restDuration;
  final bool showLongSessionWarning;
  final bool dismissedLongWarning;
  final VoidCallback onRestTimerTap;
  final VoidCallback onDismissLongWarning;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          _SessionTimerRow(
            elapsed: elapsed,
            isPaused: isPaused,
            isResting: isResting,
            restElapsed: restElapsed,
          ),
          if (isResting) _RestProgressSection(
            restRemaining: restRemaining,
            restElapsed: restElapsed,
            restDuration: restDuration,
            onTap: onRestTimerTap,
          ),
          if (showLongSessionWarning && !dismissedLongWarning)
            _LongSessionWarning(onDismiss: onDismissLongWarning),
        ],
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────────────

class _SessionTimerRow extends StatelessWidget {
  const _SessionTimerRow({
    required this.elapsed,
    required this.isPaused,
    required this.isResting,
    required this.restElapsed,
  });

  final Duration elapsed;
  final bool isPaused;
  final bool isResting;
  final Duration restElapsed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.timer_outlined, color: AppColors.primary),
        const SizedBox(width: 12),
        Text(
          formatDuration(elapsed),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
        const Spacer(),
        if (isPaused)
          _StatusBadge(
            label: 'PAUSED',
            backgroundColor: Colors.orange.withValues(alpha: 0.1),
            textColor: Colors.orange,
          )
        else if (isResting)
          _StatusBadge(
            label: formatRestDuration(restElapsed),
            backgroundColor: Colors.orange.withValues(alpha: 0.1),
            textColor: Colors.orange,
          )
        else
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

class _RestProgressSection extends StatelessWidget {
  const _RestProgressSection({
    this.restRemaining,
    required this.restElapsed,
    this.restDuration,
    required this.onTap,
  });

  final int? restRemaining;
  final Duration restElapsed;
  final int? restDuration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final progress = (restRemaining != null && restDuration != null && restDuration! > 0)
        ? restRemaining! / restDuration!
        : 0.0;

    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 6,
                  width: double.infinity,
                  color: AppColors.mutedSurface,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.timer_outlined, size: 14, color: Colors.orange),
                  const SizedBox(width: 6),
                  Text(
                    restRemaining != null
                        ? formatCountdown(restRemaining!)
                        : formatRestDuration(restElapsed),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: const Text(
                      'OPEN',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LongSessionWarning extends StatelessWidget {
  const _LongSessionWarning({required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, size: 16, color: Colors.orange),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Session exceeds 2 hours',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: onDismiss,
              child: const Icon(Icons.close_rounded, size: 16, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
