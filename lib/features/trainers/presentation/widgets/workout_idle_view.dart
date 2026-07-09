import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Idle state shown when no workout session is active.
///
/// Prompts the user to start a new workout or start from a template.
class WorkoutIdleView extends StatelessWidget {
  final VoidCallback onStartWorkout;
  final VoidCallback onStartFromTemplate;

  const WorkoutIdleView({
    super.key,
    required this.onStartWorkout,
    required this.onStartFromTemplate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center_rounded,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 24),
            const Text(
              'Ready to Workout?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start a new session and track your exercises, sets, and reps.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                key: const ValueKey('startWorkoutButton'),
                onPressed: onStartWorkout,
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start Workout'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                key: const ValueKey('startFromTemplateButton'),
                onPressed: onStartFromTemplate,
                icon: const Icon(Icons.library_books_rounded),
                label: const Text('Start from Template'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
