import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/exercise_log_dto.dart';
import 'workout_formatting.dart';

/// Lightweight summary model for a single exercise in the completed view.
class ExerciseSummary {
  final String name;
  int totalSets = 0;
  int totalReps = 0;

  ExerciseSummary({required this.name});
}

/// Completed state shown after a workout session finishes.
///
/// Displays a summary (duration, exercises, sets, reps) and any
/// new personal records. Offers "New Workout" and "Save as Template" actions.
class WorkoutCompletedView extends StatelessWidget {
  final Duration totalDuration;
  final List<ExerciseLogDto> logs;
  final List<Map<String, dynamic>> newRecords;
  final VoidCallback onNewWorkout;
  final VoidCallback onSaveAsTemplate;

  const WorkoutCompletedView({
    super.key,
    required this.totalDuration,
    required this.logs,
    required this.newRecords,
    required this.onNewWorkout,
    required this.onSaveAsTemplate,
  });

  @override
  Widget build(BuildContext context) {
    final summary = _buildSummary();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          const Icon(Icons.check_circle_rounded, size: 72, color: Colors.green),
          const SizedBox(height: 16),
          const Text(
            'Workout Complete!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Duration: ${formatDuration(totalDuration)}',
            style: const TextStyle(fontSize: 15, color: AppColors.mutedText),
          ),
          const SizedBox(height: 24),

          if (summary.isNotEmpty) ...[
            Text(
              '${summary.length} exercises · ${summary.values.fold<int>(0, (s, e) => s + e.totalSets)} sets',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.mutedText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            ...summary.values.map((s) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      s.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      '${s.totalSets} sets${s.totalReps > 0 ? ' · ${s.totalReps} reps' : ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 24),
          ],

          if (newRecords.isNotEmpty) _buildNewRecordsCard(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onNewWorkout,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('New Workout'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onSaveAsTemplate,
              icon: const Icon(Icons.save_rounded),
              label: const Text('Save as Template'),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, ExerciseSummary> _buildSummary() {
    final summary = <String, ExerciseSummary>{};
    for (final log in logs) {
      final name = log.exercise?.name ?? log.exerciseId;
      final entry = summary.putIfAbsent(name, () => ExerciseSummary(name: name));
      entry.totalSets++;
      if (log.reps != null && log.reps! > 0) {
        entry.totalReps += log.reps!;
      }
    }
    return summary;
  }

  Widget _buildNewRecordsCard() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events_rounded, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text('New Records!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),
              ...newRecords.take(3).map((r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '${r['recordType'] ?? 'PR'}: ${r['newRecord']}',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              )),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
