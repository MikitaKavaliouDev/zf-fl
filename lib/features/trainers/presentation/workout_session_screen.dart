import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../core/theme/app_theme.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/template_dto.dart';
import 'widgets/cancel_workout_dialog.dart';
import 'widgets/finish_workout_dialog.dart';
import 'widgets/rest_timer_sheet.dart';
import 'widgets/rpe_picker.dart';
import 'widgets/save_as_template_dialog.dart';
import 'widgets/template_picker_dialog.dart';
import 'widgets/workout_numeric_keyboard.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Focus / input system types (local to this screen)
// ─────────────────────────────────────────────────────────────────────────────

enum _FieldType { weight, reps }

class _FocusTarget {
  final String exerciseId;
  final int setIndex;
  final _FieldType fieldType;

  const _FocusTarget({
    required this.exerciseId,
    required this.setIndex,
    required this.fieldType,
  });

  bool get isWeight => fieldType == _FieldType.weight;
  bool get isReps => fieldType == _FieldType.reps;

  String logKey(String exerciseId, int setIndex) => '${exerciseId}_$setIndex';
}

// ─────────────────────────────────────────────────────────────────────────────
// Screen
// ─────────────────────────────────────────────────────────────────────────────

class WorkoutSessionScreen extends StatefulWidget {
  const WorkoutSessionScreen({super.key});

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  // ── Input system state ───────────────────────────────────────────────
  _FocusTarget? _focusTarget;
  String _activeInputText = '';
  bool _dismissedLongWarning = false;

  @override
  void initState() {
    super.initState();
    context.read<WorkoutSessionCubit>().loadCurrent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
        actions: [
          if (context.read<WorkoutSessionCubit>().state is WorkoutSessionActive)
            IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => _confirmCancel(context),
              tooltip: 'Cancel Workout',
            ),
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
          if (state is WorkoutSessionActive && state.newPrRecord) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text('🏆 New Personal Record!'),
                  ],
                ),
                backgroundColor: Colors.green.shade700,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 3),
              ),
            );
          }
          // Reset long warning dismissal on session end
          if (state is! WorkoutSessionActive) {
            setState(() => _dismissedLongWarning = false);
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
              :final restStartedAt,
              :final restElapsed,
              :final restRemaining,
              :final showLongSessionWarning,
            ) =>
              _buildActive(
                context, elapsed, isPaused, logs, restStartedAt, restElapsed, restRemaining,
              ),
            WorkoutSessionCompleted(:final totalDuration, :final logs) =>
              _buildCompleted(context, totalDuration, logs),
            WorkoutSessionError(:final message) => _buildError(context, message),
          };
        },
      ),
    );
  }

  // ── State builders ────────────────────────────────────────────────────

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
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showTemplatePicker(context),
                icon: const Icon(Icons.library_books_rounded),
                label: const Text('Start from Template'),
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
    DateTime? restStartedAt,
    Duration restElapsed,
    int? restRemaining,
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

    final showKeyboard = _focusTarget != null;
    final isResting = restStartedAt != null;

    return Stack(
      children: [
        // Main content
        Column(
          children: [
            // Timer Bar (session timer + optional rest timer)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: Column(
                children: [
                  // Session timer row
                  Row(
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
                      else if (isResting)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            _formatRestDuration(restElapsed),
                            style: const TextStyle(
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
                  // Rest timer progress bar
                  if (isResting) ...[
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _showRestTimerSheet(
                        context,
                        restRemaining ?? restElapsed.inSeconds,
                        (context.read<WorkoutSessionCubit>().state as WorkoutSessionActive).restDuration ?? 120,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.timer_outlined,
                              size: 14, color: Colors.orange),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              restRemaining != null
                                  ? _formatCountdown(restRemaining)
                                  : _formatDuration(restElapsed),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
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
                    ),
                  ],
                  // Long session warning
                  if (elapsed.inSeconds >= 7200 && !_dismissedLongWarning)
                    Padding(
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
                                style: TextStyle(fontSize: 12, color: Colors.orange, fontWeight: FontWeight.w500),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _dismissedLongWarning = true),
                              child: const Icon(Icons.close_rounded, size: 16, color: Colors.orange),
                            ),
                          ],
                        ),
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
                      itemCount: grouped.entries.length + 1,
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
                          exerciseId: entry.key,
                          logs: exLogs,
                          focusTarget: _focusTarget,
                          activeInputText: _activeInputText,
                          onTapWeight: (logIndex) => _triggerInput(
                            exerciseId: entry.key,
                            setIndex: logIndex,
                            fieldType: _FieldType.weight,
                            currentValue: exLogs[logIndex].weight,
                          ),
                          onTapReps: (logIndex) => _triggerInput(
                            exerciseId: entry.key,
                            setIndex: logIndex,
                            fieldType: _FieldType.reps,
                            currentValue: exLogs[logIndex].reps?.toDouble(),
                          ),
                          onComplete: (logIndex) => _completeSet(
                            exerciseId: entry.key,
                            setIndex: logIndex,
                            log: exLogs[logIndex],
                          ),
                          onAddSet: () => _addSet(entry.key),
                          onRemove: () => _confirmRemoveExercise(
                            context, entry.key, name,
                          ),
                        );
                      },
                    ),
            ),

            // Bottom controls (hidden when keyboard is active)
            AnimatedOpacity(
              opacity: showKeyboard ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              child: showKeyboard
                  ? const SizedBox.shrink()
                  : Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppColors.card,
                        border: Border(top: BorderSide(color: AppColors.borderMuted)),
                      ),
                      child: SafeArea(
                        top: false,
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
            ),
          ],
        ),

        // Keyboard overlay
        if (showKeyboard)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              elevation: 8,
              child: SafeArea(
                top: false,
                child: WorkoutNumericKeyboard(
                  isWeight: _focusTarget!.isWeight,
                  text: _activeInputText,
                  onTextChanged: (v) => setState(() => _activeInputText = v),
                  onNext: _handleInputNext,
                  onDismiss: _handleInputDismiss,
                  // Plate calc / RPE not implemented yet
                ),
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

  Widget _buildCompleted(
    BuildContext context,
    Duration totalDuration,
    List<ExerciseLogDto> logs,
  ) {
    // Group logs by exercise to show per-exercise summary.
    final summary = <String, _ExerciseSummary>{};
    for (final log in logs) {
      final name = log.exercise?.name ?? log.exerciseId;
      final entry = summary.putIfAbsent(name, () => _ExerciseSummary(name: name));
      entry.totalSets++;
      if (log.reps != null && log.reps! > 0) {
        entry.totalReps += log.reps!;
      }
    }

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
            'Duration: ${_formatDuration(totalDuration)}',
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

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.read<WorkoutSessionCubit>().start(),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('New Workout'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showSaveAsTemplate(context),
              icon: const Icon(Icons.save_rounded),
              label: const Text('Save as Template'),
            ),
          ),
        ],
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

  // ── Input system ──────────────────────────────────────────────────────

  /// Set focus on a weight/reps field and show the keyboard.
  void _triggerInput({
    required String exerciseId,
    required int setIndex,
    required _FieldType fieldType,
    double? currentValue,
  }) {
    _syncActiveInput();

    final target = _FocusTarget(
      exerciseId: exerciseId,
      setIndex: setIndex,
      fieldType: fieldType,
    );

    setState(() {
      _focusTarget = target;
      // Pre-populate from existing value or reset to empty.
      _activeInputText = _formatValue(currentValue);
    });
  }

  /// Sync the active input text to the cubit via a logSet call.
  void _syncActiveInput() {
    if (_focusTarget == null || _activeInputText.isEmpty) return;

    final value = double.tryParse(_activeInputText.replaceAll(',', '.'));
    if (value == null) return;

    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) return;

    // Find the exercise logs for this exercise
    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();

    if (_focusTarget!.setIndex >= exLogs.length) return;
    final log = exLogs[_focusTarget!.setIndex];

    // Sync the edited value via logSet (optimistic update).
    if (_focusTarget!.isWeight) {
      cubit.logSet(
        logId: log.id,
        exerciseId: _focusTarget!.exerciseId,
        reps: log.reps ?? 0,
        weight: value,
        isCompleted: log.isCompleted,
      );
    } else {
      cubit.logSet(
        logId: log.id,
        exerciseId: _focusTarget!.exerciseId,
        reps: value.toInt(),
        weight: log.weight,
        isCompleted: log.isCompleted,
      );
    }
  }

  /// Advance to the next field: weight → reps → next set → dismiss.
  void _handleInputNext() {
    if (_focusTarget == null) return;

    // Sync current value before moving
    _syncActiveInput();

    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) {
      _handleInputDismiss();
      return;
    }

    final exerciseId = _focusTarget!.exerciseId;
    final setIndex = _focusTarget!.setIndex;
    final exLogs = state.logs
        .where((l) => l.exerciseId == exerciseId)
        .toList();

    if (_focusTarget!.isWeight) {
      // Move to reps for the same set
      _setFocusDelayed(
        exerciseId: exerciseId,
        setIndex: setIndex,
        fieldType: _FieldType.reps,
        currentValue: setIndex < exLogs.length
            ? exLogs[setIndex].reps?.toDouble()
            : null,
      );
    } else {
      // Move to next set's weight, or dismiss
      final nextIndex = setIndex + 1;
      if (nextIndex < exLogs.length) {
        _setFocusDelayed(
          exerciseId: exerciseId,
          setIndex: nextIndex,
          fieldType: _FieldType.weight,
          currentValue: exLogs[nextIndex].weight,
        );
      } else {
        // No more sets — dismiss keyboard
        _handleInputDismiss();
      }
    }
  }

  /// Helper to set focus (used after sync in handleInputNext).
  void _setFocusDelayed({
    required String exerciseId,
    required int setIndex,
    required _FieldType fieldType,
    double? currentValue,
  }) {
    setState(() {
      _focusTarget = _FocusTarget(
        exerciseId: exerciseId,
        setIndex: setIndex,
        fieldType: fieldType,
      );
      _activeInputText = _formatValue(currentValue);
    });
  }

  /// Dismiss the keyboard.
  void _handleInputDismiss() {
    _syncActiveInput();
    setState(() {
      _focusTarget = null;
      _activeInputText = '';
    });
  }

  /// Complete a set: sync edits and mark as completed.
  void _completeSet({
    required String exerciseId,
    required int setIndex,
    required ExerciseLogDto log,
  }) {
    final cubit = context.read<WorkoutSessionCubit>();

    // If this set's field is focused, sync the active text first.
    double? weight = log.weight;
    int reps = log.reps ?? 0;

    if (_focusTarget != null &&
        _focusTarget!.exerciseId == exerciseId &&
        _focusTarget!.setIndex == setIndex) {
      final parsed =
          double.tryParse(_activeInputText.replaceAll(',', '.'));
      if (parsed != null) {
        if (_focusTarget!.isWeight) {
          weight = parsed;
        } else {
          reps = parsed.toInt();
        }
      }
    }

    final becomingCompleted = !log.isCompleted;
    cubit.logSet(
      logId: log.id,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
      isCompleted: becomingCompleted,
    );

    // Auto-start rest timer when completing a set.
    if (becomingCompleted) {
      cubit.startRest();
    }

    // Dismiss keyboard if this set was focused.
    if (_focusTarget != null &&
        _focusTarget!.exerciseId == exerciseId &&
        _focusTarget!.setIndex == setIndex) {
      setState(() {
        _focusTarget = null;
        _activeInputText = '';
      });
    }
  }

  /// Add a new empty set for an exercise.
  void _addSet(String exerciseId) {
    context.read<WorkoutSessionCubit>().logSet(
      exerciseId: exerciseId,
      reps: 0,
      weight: 0,
      isCompleted: false,
    );
  }

  /// Format a numeric value for the input field.
  String _formatValue(double? value) {
    if (value == null || value == 0) return '';
    if (value == value.floorToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1).replaceAll('.', ',');
  }

  // ── Dialogs ───────────────────────────────────────────────────────────

  void _confirmFinish(BuildContext context) {
    // Dismiss keyboard first if active.
    if (_focusTarget != null) {
      _handleInputDismiss();
    }

    showDialog(
      context: context,
      builder: (_) => FinishWorkoutDialog(
        onCompleteUnfinished: () {
          Navigator.of(context).pop();
          context.read<WorkoutSessionCubit>().finish(completeUnfinished: true);
        },
        onDiscardUnfinished: () {
          Navigator.of(context).pop();
          context.read<WorkoutSessionCubit>().finish(completeUnfinished: false);
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _confirmCancel(BuildContext context) {
    // Dismiss keyboard first if active.
    if (_focusTarget != null) {
      _handleInputDismiss();
    }

    showDialog(
      context: context,
      builder: (_) => CancelWorkoutDialog(
        onConfirm: () {
          Navigator.of(context).pop();
          context.read<WorkoutSessionCubit>().cancelSession();
        },
        onDismiss: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context) async {
    final cubit = context.read<WorkoutSessionCubit>();

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

    final selected = await showDialog<ExerciseDto>(
      context: context,
      builder: (ctx) => _ExercisePickerDialog(exercises: allExercises),
    );

    if (selected != null && context.mounted) {
      cubit.addExercises([selected.id]);
    }
  }

  void _confirmRemoveExercise(
      BuildContext context, String exerciseId, String exerciseName) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Remove Exercise?'),
        content: Text('Remove "$exerciseName" from this session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context
                  .read<WorkoutSessionCubit>()
                  .removeExercise(exerciseId);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _showHistory(BuildContext context) {
    context.push('/workout/history');
  }

  void _showTemplatePicker(BuildContext context) async {
    final cubit = context.read<WorkoutSessionCubit>();
    List<TemplateDto> templates;
    try {
      templates = await cubit.fetchTemplates();
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load templates.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!context.mounted) return;

    if (templates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No templates available.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final selected = await showDialog<TemplateDto>(
      context: context,
      builder: (_) => TemplatePickerDialog(templates: templates),
    );

    if (selected != null && context.mounted) {
      final template = await cubit.getTemplate(selected.id);
      if (template.exercises.isNotEmpty && context.mounted) {
        cubit.start(templateId: template.id);
      }
    }
  }

  void _showSaveAsTemplate(BuildContext context) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => const SaveAsTemplateDialog(),
    );
    if (name != null && context.mounted) {
      context.read<WorkoutSessionCubit>().saveSessionAsTemplate(name);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Template "$name" saved!'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showRestTimerSheet(
      BuildContext context, int remainingSeconds, int totalSeconds) {
    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    final isResting =
        state is WorkoutSessionActive && state.restStartedAt != null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => RestTimerSheet(
        isRunning: isResting,
        remainingSeconds: remainingSeconds,
        totalSeconds: totalSeconds,
        onStartTimer: (duration) {
          cubit.startRest(duration: duration);
        },
        onAdjust: (delta) {
          cubit.adjustRest(delta);
        },
        onSkip: () {
          cubit.endRest();
        },
        onDismiss: () => Navigator.of(context).pop(),
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

  /// Format rest timer duration as "m:ss" (e.g. "1:30").
  String _formatRestDuration(Duration d) {
    final totalSec = d.inSeconds;
    final m = totalSec ~/ 60;
    final s = totalSec.remainder(60);
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  String _formatCountdown(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds.remainder(60);
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Exercise Card — shows an exercise name and its interactive set rows.
// ─────────────────────────────────────────────────────────────────────────────

class _ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String? muscleGroup;
  final String exerciseId;
  final List<ExerciseLogDto> logs;
  final _FocusTarget? focusTarget;
  final String activeInputText;
  final void Function(int logIndex) onTapWeight;
  final void Function(int logIndex) onTapReps;
  final void Function(int logIndex) onComplete;
  final VoidCallback onAddSet;
  final VoidCallback onRemove;

  const _ExerciseCard({
    required this.exerciseName,
    this.muscleGroup,
    required this.exerciseId,
    required this.logs,
    this.focusTarget,
    required this.activeInputText,
    required this.onTapWeight,
    required this.onTapReps,
    required this.onComplete,
    required this.onAddSet,
    required this.onRemove,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                const SizedBox(width: 4),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'remove') {
                      onRemove();
                    }
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 'remove',
                      child: Row(
                        children: [
                          Icon(Icons.remove_circle_outline,
                              size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Remove', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.more_vert_rounded,
                      size: 18, color: AppColors.mutedText),
                ),
              ],
            ),
          ),

          // Table header
          _buildTableHeader(),

          // Set rows
          ...logs.asMap().entries.map((entry) {
            final i = entry.key;
            final log = entry.value;
            final isWeightFocused = focusTarget?.exerciseId == exerciseId &&
                focusTarget?.setIndex == i &&
                focusTarget?.isWeight == true;
            final isRepsFocused = focusTarget?.exerciseId == exerciseId &&
                focusTarget?.setIndex == i &&
                focusTarget?.isReps == true;

            return _SetRow(
              key: ValueKey(log.id),
              setNumber: i + 1,
              weight: log.weight,
              reps: log.reps,
              rpe: log.rpe,
              isCompleted: log.isCompleted,
              isWeightFocused: isWeightFocused,
              isRepsFocused: isRepsFocused,
              activeInputText: activeInputText,
              onTapWeight: () => onTapWeight(i),
              onTapReps: () => onTapReps(i),
              onComplete: () => onComplete(i),
              onTapRpe: () => _onTapRpe(context, exerciseId, log),
            );
          }),

          // Add Set button
          const Divider(height: 1, indent: 16, endIndent: 16),
          InkWell(
            onTap: onAddSet,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.add_rounded, size: 16, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text(
                    'Add Set',
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

  Widget _buildTableHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 28), // set number column
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'WEIGHT',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.mutedText,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'REPS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.mutedText,
              ),
            ),
          ),
          SizedBox(width: 36), // checkbox column
        ],
      ),
    );
  }

  void _onTapRpe(BuildContext context, String exerciseId, ExerciseLogDto log) {
    showDialog(
      context: context,
      builder: (_) => RpePicker(
        currentRpe: log.rpe,
        onSelected: (rpe) {
          if (context.mounted) {
            final cubit = context.read<WorkoutSessionCubit>();
            cubit.logSet(
              logId: log.id,
              exerciseId: exerciseId,
              reps: log.reps ?? 0,
              weight: log.weight,
              isCompleted: log.isCompleted,
              rpe: rpe,
            );
          }
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Set Row — inline-editable weight/reps with completion checkbox.
// ─────────────────────────────────────────────────────────────────────────────

class _SetRow extends StatelessWidget {
  final int setNumber;
  final double? weight;
  final int? reps;
  final int? rpe;
  final bool isCompleted;
  final bool isWeightFocused;
  final bool isRepsFocused;
  final String activeInputText;
  final VoidCallback onTapWeight;
  final VoidCallback onTapReps;
  final VoidCallback onComplete;
  final VoidCallback onTapRpe;

  const _SetRow({
    super.key,
    required this.setNumber,
    this.weight,
    this.reps,
    this.rpe,
    this.isCompleted = false,
    this.isWeightFocused = false,
    this.isRepsFocused = false,
    required this.activeInputText,
    required this.onTapWeight,
    required this.onTapReps,
    required this.onComplete,
    required this.onTapRpe,
  });

  @override
  Widget build(BuildContext context) {
    final weightText = _displayWeight();
    final repsText = _displayReps();

    return Container(
      color: isCompleted ? Colors.green.withValues(alpha: 0.06) : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Set number
          _SetNumberBadge(
            number: setNumber,
            isCompleted: isCompleted,
          ),
          const SizedBox(width: 12),

          // Weight field (tappable)
          Expanded(
            child: _InputField(
              text: weightText,
              isFocused: isWeightFocused,
              onTap: onTapWeight,
            ),
          ),

          const SizedBox(width: 4),

          // Reps field (tappable)
          Expanded(
            child: _InputField(
              text: repsText,
              isFocused: isRepsFocused,
              onTap: onTapReps,
            ),
          ),

          const SizedBox(width: 4),

          // RPE indicator
          GestureDetector(
            onTap: onTapRpe,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: rpe != null
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                rpe != null ? '$rpe' : 'RPE',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: rpe != null ? AppColors.primary : AppColors.mutedText,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Completion checkbox
          GestureDetector(
            onTap: onComplete,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: isCompleted ? Colors.green : AppColors.borderMuted,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check_rounded,
                      size: 18, color: Colors.white)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  String _displayWeight() {
    if (isWeightFocused) {
      return activeInputText.isEmpty ? '0' : activeInputText;
    }
    if (weight == null || weight == 0) return '—';
    if (weight == weight!.floorToDouble()) {
      return weight!.toInt().toString();
    }
    return weight!.toStringAsFixed(1);
  }

  String _displayReps() {
    if (isRepsFocused) {
      return activeInputText.isEmpty ? '0' : activeInputText;
    }
    if (reps == null || reps == 0) return '—';
    return reps.toString();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Set Number Badge
// ─────────────────────────────────────────────────────────────────────────────

class _SetNumberBadge extends StatelessWidget {
  final int number;
  final bool isCompleted;

  const _SetNumberBadge({
    required this.number,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color:
            isCompleted ? Colors.green.withValues(alpha: 0.15) : AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isCompleted ? Colors.green : AppColors.mutedText,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Input Field — tappable text field for weight/reps with focus highlight.
// ─────────────────────────────────────────────────────────────────────────────

class _InputField extends StatelessWidget {
  final String text;
  final bool isFocused;
  final VoidCallback onTap;

  const _InputField({
    required this.text,
    required this.isFocused,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 38,
        decoration: BoxDecoration(
          color: isFocused ? AppColors.primary.withValues(alpha: 0.06) : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isFocused ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isFocused ? AppColors.primary : AppColors.foreground,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Exercise Summary — lightweight model for the completed screen
// ─────────────────────────────────────────────────────────────────────────────

class _ExerciseSummary {
  final String name;
  int totalSets = 0;
  int totalReps = 0;
  _ExerciseSummary({required this.name});
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

  // Simple fuzzy/typo-tolerant search: each character in the query must appear
  // in order in the target string, but not necessarily consecutively.
  bool _fuzzyMatch(String text, String query) {
    if (query.isEmpty) return true;
    final t = text.toLowerCase();
    final q = query.toLowerCase();
    int ti = 0;
    for (int qi = 0; qi < q.length; qi++) {
      ti = t.indexOf(q[qi], ti);
      if (ti == -1) return false;
      ti++;
    }
    return true;
  }

  void _filter(String query) {
    setState(() {
      if (query.isEmpty) {
        _filtered = widget.exercises;
      } else {
        final lower = query.toLowerCase();
        _filtered = widget.exercises.where((e) {
          return _fuzzyMatch(e.name, lower) ||
              _fuzzyMatch(e.muscleGroup ?? '', lower) ||
              _fuzzyMatch(e.category ?? '', lower);
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
                hintText: 'Search exercises...',
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
