import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/exercise_log_dto.dart';
import '../../data/models/workout_session_dto.dart';
import 'workout_formatting.dart';

/// Lightweight summary model for a single exercise in the completed view.
class ExerciseSummary {
  final String name;
  final String? muscleGroup;
  final String? equipment;
  final String? videoUrl;
  int totalSets = 0;
  int totalReps = 0;
  double totalVolume = 0;

  ExerciseSummary({required this.name, this.muscleGroup, this.equipment, this.videoUrl});
}

/// Post-workout statistics screen shown after a session is completed.
///
/// Displays a rich summary matching the iOS `CompletedSessionDetailView`:
/// header with date/time, stats row (Duration/Volume/Sets), PR records,
/// notes section, and per-exercise set tables.
class WorkoutCompletedView extends StatelessWidget {
  final WorkoutSessionDto session;
  final Duration totalDuration;
  final List<ExerciseLogDto> logs;
  final List<Map<String, dynamic>> newRecords;
  final VoidCallback onNewWorkout;
  final VoidCallback onSaveAsTemplate;
  final VoidCallback onGoHome;

  const WorkoutCompletedView({
    super.key,
    required this.session,
    required this.totalDuration,
    required this.logs,
    required this.newRecords,
    required this.onNewWorkout,
    required this.onSaveAsTemplate,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    final grouped = _buildSummary();
    final totalSets = logs.length;
    final totalVolume = logs.fold<double>(
      0,
      (sum, log) => sum + ((log.weight ?? 0) * (log.reps ?? 0)),
    );

    final startTime = _parseDateTime(session.startTime);
    final endTime = session.endTime != null ? _parseDateTime(session.endTime!) : null;
    final formattedDate = _formatDate(startTime);
    final timeRangeStr = _formatTimeRange(startTime, endTime);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          // ── Header ──
          _buildHeader(formattedDate, timeRangeStr),
          const SizedBox(height: 24),

          // ── Stats row ──
          _buildStatsRow(totalDuration, totalVolume, totalSets),
          const SizedBox(height: 24),

          // ── New Records banner ──
          if (newRecords.isNotEmpty) ...[
            _buildNewRecordsCard(),
            const SizedBox(height: 24),
          ],

          // ── Notes ──
          if (session.notes != null && session.notes!.isNotEmpty) ...[
            _buildNotes(session.notes!),
            const SizedBox(height: 24),
          ],

          const Divider(),

          // ── Exercise set tables ──
          ...grouped.entries.map((entry) => _buildExerciseSection(
            name: entry.value.name,
            muscleGroup: entry.value.muscleGroup,
            logs: entry.value.logs,
          )),

          const SizedBox(height: 32),

          // ── Action buttons ──
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
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: onGoHome,
              icon: const Icon(Icons.home_outlined),
              label: const Text('Go Home'),
              style: TextButton.styleFrom(foregroundColor: AppColors.mutedText),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ──

  Widget _buildHeader(String date, String timeRange) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF007AFF), Color(0xFF7C3AED)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 16),
        const Text(
          'Workout Complete!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(fontSize: 15, color: AppColors.foreground),
        ),
        const SizedBox(height: 2),
        Text(
          timeRange,
          style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
      ],
    );
  }

  // ── Stats Row ──

  Widget _buildStatsRow(Duration duration, double volume, int sets) {
    final durationStr = formatDuration(duration);
    return Row(
      children: [
        Expanded(child: _buildStatCard('Duration', durationStr, Icons.timer_outlined, AppColors.primary)),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard(
            'Volume',
            volume > 0 ? '${volume.toStringAsFixed(0)} kg' : '—',
            Icons.monitor_weight_outlined,
            Colors.orange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard('Sets', '$sets', Icons.repeat_rounded, Colors.green),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }

  // ── New Records ──

  Widget _buildNewRecordsCard() {
    return Container(
      width: double.infinity,
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
              Text(
                'New Personal Records!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...newRecords.take(5).map((r) {
            final exerciseId = r['exerciseId'] as String? ?? '';
            final exerciseName = logs
                .where((l) => l.exerciseId == exerciseId)
                .firstOrNull
                ?.exercise?.name ?? '';
            final recordType = r['recordType'] as String? ?? 'PR';
            final newRecord = r['newRecord'];
            final oldRecord = r['oldRecord'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (exerciseName.isNotEmpty)
                    Text(
                      '$exerciseName — ',
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  Text(
                    '${recordType.toUpperCase()}: $newRecord',
                    style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  if (oldRecord != null)
                    Text(
                      ' (was $oldRecord)',
                      style: const TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ── Notes ──

  Widget _buildNotes(String notes) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.notes_rounded, size: 16, color: AppColors.mutedText),
              SizedBox(width: 6),
              Text(
                'Session Notes',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.mutedText),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(notes, style: const TextStyle(fontSize: 14, color: AppColors.foreground, height: 1.4)),
        ],
      ),
    );
  }

  // ── Exercise Section ──

  Widget _buildExerciseSection({
    required String name,
    required String? muscleGroup,
    required List<ExerciseLogDto> logs,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise name header
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground),
                    ),
                    if (muscleGroup != null)
                      Text(
                        muscleGroup,
                        style: const TextStyle(fontSize: 11, color: AppColors.mutedText),
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${logs.length} ${logs.length == 1 ? 'set' : 'sets'}',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Table header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                SizedBox(width: 28),
                SizedBox(width: 12),
                Expanded(child: Text('WEIGHT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.mutedText))),
                Expanded(child: Text('REPS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.mutedText))),
                Expanded(child: Text('RPE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.mutedText))),
                SizedBox(width: 32),
              ],
            ),
          ),

          // Set rows
          ...logs.asMap().entries.map(
            (entry) => _buildSetRow(entry.key + 1, entry.value),
          ),
        ],
      ),
    );
  }

  Widget _buildSetRow(int setNumber, ExerciseLogDto log) {
    final weightStr = log.weight != null && log.weight! > 0
        ? (log.weight == log.weight!.floorToDouble()
            ? log.weight!.toInt().toString()
            : log.weight!.toStringAsFixed(1))
        : '—';
    final repsStr = log.reps != null && log.reps! > 0
        ? log.reps.toString()
        : '—';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderMuted, width: 0.5)),
      ),
      child: Row(
        children: [
          // Set number badge
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: log.isCompleted
                  ? Colors.green.withValues(alpha: 0.15)
                  : AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '$setNumber',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: log.isCompleted ? Colors.green : AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              weightStr,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.foreground),
            ),
          ),
          Expanded(
            child: Text(
              repsStr,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.foreground),
            ),
          ),
          Expanded(child: _buildRpeBadge(log.rpe)),
          // Completed check circle
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: log.isCompleted ? Colors.green : Colors.transparent,
              border: log.isCompleted ? null : Border.all(color: AppColors.borderMuted),
            ),
            child: log.isCompleted
                ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildRpeBadge(int? rpe) {
    if (rpe == null) {
      return const Text('—', style: TextStyle(fontSize: 14, color: AppColors.mutedText));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        '$rpe',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
      ),
    );
  }

  // ── Summary builder ──

  Map<String, _ExerciseGroup> _buildSummary() {
    final groupped = <String, List<ExerciseLogDto>>{};
    for (final log in logs) {
      groupped.putIfAbsent(log.exerciseId, () => []);
      groupped[log.exerciseId]!.add(log);
    }
    final result = <String, _ExerciseGroup>{};
    for (final entry in groupped.entries) {
      final firstLog = entry.value.first;
      final name = firstLog.exercise?.name ?? entry.key;
      final muscleGroup = firstLog.exercise?.muscleGroup;
      result[entry.key] = _ExerciseGroup(
        name: name,
        muscleGroup: muscleGroup,
        logs: entry.value,
      );
    }
    return result;
  }

  // ── Date helpers ──

  DateTime _parseDateTime(String iso) => DateTime.tryParse(iso) ?? DateTime.now();

  String _formatDate(DateTime dt) {
    const weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  String _formatTimeRange(DateTime start, DateTime? end) {
    final startStr = _formatTime(start);
    if (end == null) return startStr;
    final endStr = _formatTime(end);
    return '$startStr - $endStr';
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour;
    final minute = dt.minute;
    final amPm = hour >= 12 ? 'PM' : 'AM';
    final h = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m $amPm';
  }
}

/// Internal group for an exercise and its set logs.
class _ExerciseGroup {
  final String name;
  final String? muscleGroup;
  final List<ExerciseLogDto> logs;

  const _ExerciseGroup({
    required this.name,
    this.muscleGroup,
    required this.logs,
  });
}
