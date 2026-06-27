import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Empty state shown when there are no upcoming events.
/// Matches iOS ExploreEmptyEventsView — ExploreEmptyEventsView.swift.
class ExploreEmptyEventsView extends StatelessWidget {
  final VoidCallback? onNotifyMe;

  const ExploreEmptyEventsView({super.key, this.onNotifyMe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_month_outlined,
                size: 36,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Upcoming Events',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Check back later for new workshops, challenges, and community events in your area.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            if (onNotifyMe != null)
              ElevatedButton.icon(
                onPressed: onNotifyMe,
                icon: const Icon(Icons.notifications_outlined, size: 18),
                label: const Text('Notify Me'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
