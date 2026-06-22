import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';

class WorkoutSessionScreen extends StatefulWidget {
  const WorkoutSessionScreen({super.key});

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutSessionCubit>().loadCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            onPressed: () => _showHistory(context),
            tooltip: 'Session History',
          ),
        ],
      ),
      body: BlocConsumer<WorkoutSessionCubit, WorkoutSessionState>(
        listener: (context, state) {
          if (state is WorkoutSessionCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Workout completed! Duration: ${_formatDuration(state.totalDuration)}',
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            WorkoutSessionInitial() => _buildIdle(context),
            WorkoutSessionLoading() => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            WorkoutSessionActive(
              :final elapsed,
              :final isPaused,
              :final logs,
            ) =>
              _buildActive(context, elapsed, isPaused, logs),
            WorkoutSessionCompleted(:final totalDuration) =>
              _buildCompleted(context, totalDuration),
            WorkoutSessionError(:final message) => _buildError(context, message),
          };
        },
      ),
    );
  }

  Widget _buildIdle(BuildContext context) {
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
                onPressed: () =>
                    context.read<WorkoutSessionCubit>().start(),
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start Workout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActive(
    BuildContext context,
    Duration elapsed,
    bool isPaused,
    List<ExerciseLogDto> logs,
  ) {
    // Group logs by exerciseId.
    final grouped = <String, List<ExerciseLogDto>>{};
    final exerciseNames = <String, String>{};
    for (final log in logs) {
      grouped.putIfAbsent(log.exerciseId, () => []);
      grouped[log.exerciseId]!.add(log);
      if (log.exercise != null) {
        exerciseNames[log.exerciseId] = log.exercise!.name;
      }
    }

    return Column(
      children: [
        // Timer Bar
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              const Icon(Icons.timer_outlined, color: AppColors.primary),
              const SizedBox(width: 12),
              Text(
                _formatDuration(elapsed),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
              const Spacer(),
              if (isPaused)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Text(
                    'PAUSED',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
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
          ),
        ),

        // Exercise list
        Expanded(
          child: grouped.isEmpty
              ? _buildEmptyExercises(context)
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: grouped.entries.length + 1, // +1 for add button
                  itemBuilder: (context, index) {
                    if (index == grouped.entries.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 16),
                        child: OutlinedButton.icon(
                          onPressed: () => _showAddExerciseDialog(context),
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: const Text('Add Exercise'),
                        ),
                      );
                    }
                    final entry = grouped.entries.elementAt(index);
                    final exLogs = entry.value;
                    final name = exerciseNames[entry.key] ?? 'Exercise';
                    final muscleGroup = exLogs
                        .firstWhere((l) => l.exercise?.muscleGroup != null,
                        orElse: () => exLogs.first)
                        .exercise?.muscleGroup;
                    return _ExerciseCard(
                      exerciseName: name,
                      muscleGroup: muscleGroup,
                      logs: exLogs,
                      onLogSet: (reps, weight) {
                        context.read<WorkoutSessionCubit>().logSet(
                          exerciseId: entry.key,
                          reps: reps,
                          weight: weight,
                        );
                      },
                    );
                  },
                ),
        ),

        // Bottom controls
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.card,
            border: Border(top: BorderSide(color: AppColors.borderMuted)),
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      if (isPaused) {
                        context.read<WorkoutSessionCubit>().resume();
                      } else {
                        context.read<WorkoutSessionCubit>().pause();
                      }
                    },
                    icon: Icon(isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded),
                    label: Text(isPaused ? 'Resume' : 'Pause'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _confirmFinish(context),
                    icon: const Icon(Icons.stop_rounded),
                    label: const Text('Finish'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyExercises(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fitness_center_rounded,
            size: 48,
            color: AppColors.mutedText.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          const Text(
            'No exercises yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add an exercise to start logging sets.',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showAddExerciseDialog(context),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add Exercise'),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleted(BuildContext context, Duration totalDuration) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              'Workout Complete!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Duration: ${_formatDuration(totalDuration)}',
              style: const TextStyle(fontSize: 16, color: AppColors.mutedText),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () =>
                    context.read<WorkoutSessionCubit>().start(),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('New Workout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  context.read<WorkoutSessionCubit>().loadCurrent(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmFinish(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Finish Workout?'),
        content: const Text('Are you sure you want to end this session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<WorkoutSessionCubit>().finish();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context) async {
    final cubit = context.read<WorkoutSessionCubit>();

    // Fetch exercise library from the backend.
    List<ExerciseDto> allExercises;
    try {
      allExercises = await cubit.fetchExercises();
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load exercise library.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!context.mounted) return;

    // Show a searchable exercise picker dialog.
    final selected = await showDialog<ExerciseDto>(
      context: context,
      builder: (ctx) => _ExercisePickerDialog(exercises: allExercises),
    );

    if (selected != null && context.mounted) {
      cubit.addExercises([selected.id]);
    }
  }

  void _showHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Session history coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Exercise Card — shows an exercise name and its logged sets.
// ─────────────────────────────────────────────────────────────────────────────

class _ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String? muscleGroup;
  final List<ExerciseLogDto> logs;
  final void Function(int reps, double weight) onLogSet;

  const _ExerciseCard({
    required this.exerciseName,
    this.muscleGroup,
    required this.logs,
    required this.onLogSet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    exerciseName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
                if (muscleGroup != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      muscleGroup!,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Set rows
          ...logs.asMap().entries.map((entry) {
            final i = entry.key;
            final log = entry.value;
            return _SetRow(
              setNumber: i + 1,
              reps: log.reps,
              weight: log.weight,
              isCompleted: log.isCompleted,
            );
          }),

          // Divider + Add Set
          const Divider(height: 1, indent: 16, endIndent: 16),
          InkWell(
            onTap: () => _showLogSetDialog(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.add_rounded, size: 16, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text(
                    'Log Set',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogSetDialog(BuildContext context) {
    final repsController = TextEditingController();
    final weightController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log Set'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: repsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Reps',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final reps = int.tryParse(repsController.text) ?? 0;
              final weight = double.tryParse(weightController.text) ?? 0;
              Navigator.of(ctx).pop();
              onLogSet(reps, weight);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Set Row — shows one logged set (set number, reps, weight, completed badge).
// ─────────────────────────────────────────────────────────────────────────────

class _SetRow extends StatelessWidget {
  final int setNumber;
  final int? reps;
  final double? weight;
  final bool isCompleted;

  const _SetRow({
    required this.setNumber,
    this.reps,
    this.weight,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          // Set number
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green.withValues(alpha: 0.15) : AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '$setNumber',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isCompleted ? Colors.green : AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Reps
          Expanded(
            child: Text(
              reps != null ? '$reps reps' : '—',
              style: const TextStyle(fontSize: 14, color: AppColors.foreground),
            ),
          ),

          // Weight
          Text(
            weight != null ? '${weight!.toStringAsFixed(1)} kg' : '—',
            style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),

          const SizedBox(width: 8),

          // Completed badge
          if (isCompleted)
            const Icon(Icons.check_circle_rounded, size: 18, color: Colors.green),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Exercise Picker Dialog — searchable list of exercises from the library
// ─────────────────────────────────────────────────────────────────────────────

class _ExercisePickerDialog extends StatefulWidget {
  final List<ExerciseDto> exercises;
  const _ExercisePickerDialog({required this.exercises});

  @override
  State<_ExercisePickerDialog> createState() => _ExercisePickerDialogState();
}

class _ExercisePickerDialogState extends State<_ExercisePickerDialog> {
  final _searchController = TextEditingController();
  late List<ExerciseDto> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = widget.exercises;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filter(String query) {
    setState(() {
      if (query.isEmpty) {
        _filtered = widget.exercises;
      } else {
        final lower = query.toLowerCase();
        _filtered = widget.exercises.where((e) {
          return e.name.toLowerCase().contains(lower) ||
              (e.muscleGroup?.toLowerCase().contains(lower) ?? false) ||
              (e.category?.toLowerCase().contains(lower) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Exercise'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search exercises…',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
                isDense: true,
              ),
              onChanged: _filter,
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final ex = _filtered[index];
                  return ListTile(
                    dense: true,
                    title: Text(ex.name),
                    subtitle: ex.muscleGroup != null
                        ? Text(ex.muscleGroup!,
                            style: const TextStyle(fontSize: 12))
                        : null,
                    onTap: () => Navigator.of(context).pop(ex),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
