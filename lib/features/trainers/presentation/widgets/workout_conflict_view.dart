import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Conflict state shown when a workout session already exists.
///
/// Prompts the user to either resume the existing session or start fresh.
class WorkoutConflictView extends StatelessWidget {
  final String existingSessionId;
  final VoidCallback onResumeExisting;
  final VoidCallback onStartFresh;

  const WorkoutConflictView({
    super.key,
    required this.existingSessionId,
    required this.onResumeExisting,
    required this.onStartFresh,
  });

  @override
  Widget build(BuildContext context) {
    final shortId = existingSessionId.length > 8
        ? existingSessionId.substring(0, 8)
        : existingSessionId;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 64,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            const Text(
              'Active Session Found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'You already have an active workout session (ID: $shortId…). '
              'Would you like to resume it or start fresh?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onResumeExisting,
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Resume Existing'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: onStartFresh,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Start Fresh'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
