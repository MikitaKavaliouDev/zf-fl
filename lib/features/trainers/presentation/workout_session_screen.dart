import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/events/event_bus.dart';
import '../../../core/theme/app_theme.dart';
import '../../sync/workout_realtime_service.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/template_dto.dart';
import 'widgets/cancel_workout_dialog.dart';
import 'widgets/exercise_card.dart';
import 'widgets/exercise_picker_sheet.dart';
import 'widgets/finish_workout_dialog.dart';
import 'widgets/plate_calculator.dart';
import 'widgets/rest_timer_sheet.dart';
import 'widgets/rpe_picker.dart';
import 'widgets/save_as_template_dialog.dart';
import 'widgets/session_timer_bar.dart';
import 'widgets/template_picker_dialog.dart';
import 'widgets/workout_bottom_controls.dart';
import 'widgets/workout_completed_view.dart';
import 'widgets/workout_conflict_view.dart';
import 'widgets/workout_error_view.dart';
import 'widgets/workout_formatting.dart';
import 'widgets/workout_idle_view.dart';
import 'widgets/workout_numeric_keyboard.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Input overlay modes (local to this screen)
// ─────────────────────────────────────────────────────────────────────────────

enum _InputOverlay { none, plateCalculator, rpePicker }

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
  FocusTarget? _focusTarget;
  String _activeInputText = '';
  _InputOverlay _overlayMode = _InputOverlay.none;
  bool _dismissedLongWarning = false;
  double _dragOffset = 0;

  // Local state tracking to prevent duplicate triggers from periodic timer ticks
  bool _lastShowRestFinishedToast = false;
  bool _lastNewPrRecord = false;

  // ElevenLabs AI Coach Realtime subscription
  StreamSubscription<AIWorkoutEvent>? _aiEventSub;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<WorkoutSessionCubit>();
    if (cubit.state is WorkoutSessionActive) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cubit.maximize();
      });
    } else {
      cubit.loadCurrent(isMinimized: false);
    }

    // Listen for AI coach events from Supabase Realtime
    // (subscription lifecycle managed by VoiceCoachCubit)
    _aiEventSub = getIt<WorkoutRealtimeService>().events.listen((event) {
      if (!mounted) return;
      _handleAIEvent(event, cubit);
    });
  }

  @override
  void dispose() {
    _aiEventSub?.cancel();
    _aiEventSub = null;
    super.dispose();
  }

  /// Handle AI coach realtime events and update the workout session cubit.
  void _handleAIEvent(AIWorkoutEvent event, WorkoutSessionCubit cubit) {
    switch (event) {
      case AISessionStarted(:final sessionId):
        developer.log(
          '[AIEvent] Session started: $sessionId',
          name: 'workout',
        );
        cubit.loadCurrent(isMinimized: false);

      case AIExerciseAdded(:final sessionId, :final exerciseId):
        developer.log(
          '[AIEvent] Exercise added: $exerciseId to $sessionId',
          name: 'workout',
        );
        cubit.loadCurrent(isMinimized: false);

      case AISetLogged(:final exerciseId, :final reps, :final weight):
        developer.log(
          '[AIEvent] Set logged: $reps x ${weight}kg for $exerciseId',
          name: 'workout',
        );
        cubit.loadCurrent(isMinimized: false);

      case AIRestStarted(:final durationSeconds):
        developer.log(
          '[AIEvent] Rest started: ${durationSeconds}s',
          name: 'workout',
        );
        cubit.startRest(duration: durationSeconds);
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WorkoutSessionCubit>();
    final isSessionActive = cubit.state is WorkoutSessionActive;
    final showKeyboard = _focusTarget != null;

    return PopScope(
      canPop: !isSessionActive,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleInputDismiss();
        cubit.minimize();
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: BlocConsumer<WorkoutSessionCubit, WorkoutSessionState>(
          listener: _stateListener,
          builder: (context, state) {
            return switch (state) {
              WorkoutSessionInitial() => WorkoutIdleView(
                  onStartWorkout: () => context.read<WorkoutSessionCubit>().start(),
                  onStartFromTemplate: () => _showTemplatePicker(context),
                ),
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
                :final showRestFinishedToast,
                :final sessionNewRecords,
              ) =>
                _buildActive(
                  context, elapsed, isPaused, logs, restStartedAt, restElapsed,
                  restRemaining, showRestFinishedToast, sessionNewRecords,
                  showKeyboard,
                ),
              WorkoutSessionCompleted(:final session, :final totalDuration, :final logs, :final newRecords) =>
                WorkoutCompletedView(
                  session: session,
                  totalDuration: totalDuration,
                  logs: logs,
                  newRecords: newRecords,
                  onNewWorkout: () => context.read<WorkoutSessionCubit>().start(),
                  onSaveAsTemplate: () => _showSaveAsTemplate(context),
                  onGoHome: () => context.go('/'),
                ),
              WorkoutSessionConflict(:final existingSessionId) =>
                WorkoutConflictView(
                  existingSessionId: existingSessionId,
                  onResumeExisting: () =>
                      context.read<WorkoutSessionCubit>().resolveConflict(startNew: false),
                  onStartFresh: () =>
                      context.read<WorkoutSessionCubit>().resolveConflict(startNew: true),
                ),
              WorkoutSessionError(:final message) =>
                WorkoutErrorView(
                  message: message,
                  onRetry: () => context.read<WorkoutSessionCubit>().loadCurrent(),
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }

  void _stateListener(BuildContext context, WorkoutSessionState state) {
    if (state is WorkoutSessionCompleted) {
      getIt<EventBus>().emit(WorkoutCompletedEvent(
        sessionId: state.session.id,
        duration: state.totalDuration,
      ));
    }
    if (state is WorkoutSessionActive) {
      if (state.newPrRecord && !_lastNewPrRecord) {
        _lastNewPrRecord = true;
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
      } else if (!state.newPrRecord) {
        _lastNewPrRecord = false;
      }

      if (state.showRestFinishedToast && !_lastShowRestFinishedToast) {
        _lastShowRestFinishedToast = true;
        HapticFeedback.mediumImpact();
      } else if (!state.showRestFinishedToast) {
        _lastShowRestFinishedToast = false;
      }

      if (state.isMinimized) {
        context.pop();
      }
    }
    if (state is! WorkoutSessionActive) {
      setState(() {
        _dismissedLongWarning = false;
        _lastNewPrRecord = false;
        _lastShowRestFinishedToast = false;
      });
    }
  }

  // ── Active state builder ──────────────────────────────────────────────

  Widget _buildActive(
    BuildContext context,
    Duration elapsed,
    bool isPaused,
    List<ExerciseLogDto> logs,
    DateTime? restStartedAt,
    Duration restElapsed,
    int? restRemaining,
    bool showRestFinishedToast,
    List<Map<String, dynamic>> sessionNewRecords,
    bool showKeyboard,
  ) {
    final grouped = <String, List<ExerciseLogDto>>{};
    final exerciseNames = <String, String>{};
    for (final log in logs) {
      grouped.putIfAbsent(log.exerciseId, () => []);
      grouped[log.exerciseId]!.add(log);
      if (log.exercise != null) {
        exerciseNames[log.exerciseId] = log.exercise!.name;
      }
    }

    final isResting = restStartedAt != null;

    // Compute isLastField for keyboard
    bool isLastField = false;
    if (showKeyboard && _focusTarget != null) {
      final exLogs = grouped[_focusTarget!.exerciseId] ?? [];
      isLastField = !_focusTarget!.isWeight &&
          _focusTarget!.setIndex == exLogs.length - 1;
    }

    return Stack(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) {
              setState(() => _dragOffset += details.delta.dy);
            }
          },
          onVerticalDragEnd: (details) {
            if (_dragOffset > 120) {
              _handleInputDismiss();
              context.read<WorkoutSessionCubit>().minimize();
            }
            setState(() => _dragOffset = 0);
          },
          child: Transform.translate(
            offset: Offset(0, _dragOffset),
            child: Column(
              children: [
                // Timer bar
                SessionTimerBar(
                  elapsed: elapsed,
                  isPaused: isPaused,
                  isResting: isResting,
                  restElapsed: restElapsed,
                  restRemaining: restRemaining,
                  restDuration: (context.read<WorkoutSessionCubit>().state
                          as WorkoutSessionActive)
                      .restDuration,
                  showLongSessionWarning: elapsed.inSeconds >= 7200,
                  dismissedLongWarning: _dismissedLongWarning,
                  onRestTimerTap: () => _showRestTimerSheet(
                    context,
                    restRemaining ?? restElapsed.inSeconds,
                    (context.read<WorkoutSessionCubit>().state
                            as WorkoutSessionActive)
                        .restDuration ?? 120,
                  ),
                  onDismissLongWarning: () =>
                      setState(() => _dismissedLongWarning = true),
                ),

                // Rest finished toast
                if (showRestFinishedToast) _buildRestFinishedToast(),

                // Exercise list with dynamic bottom padding when keyboard is open
                Expanded(
                  child: grouped.isEmpty
                      ? _buildEmptyExercises(context)
                      : ListView.builder(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, showKeyboard ? 280 : 16),
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
                            final supersetKey = exLogs
                                .firstWhere((l) => l.supersetKey != null,
                                    orElse: () => exLogs.first)
                                .supersetKey;
                            final firstEx = exLogs
                                .firstWhere((l) => l.exercise != null,
                                    orElse: () => exLogs.first)
                                .exercise;
                            final coachNotes = exLogs
                                .firstWhere((l) => l.notes != null,
                                    orElse: () => exLogs.first)
                                .notes;
                            final coachVideoUrl = firstEx?.videoUrl;
                            return ExerciseCard(
                              exerciseName: name,
                              muscleGroup: muscleGroup,
                              exerciseId: entry.key,
                              logs: exLogs,
                              supersetKey: supersetKey,
                              coachNotes: coachNotes,
                              coachVideoUrl: coachVideoUrl,
                              focusTarget: _focusTarget,
                              activeInputText: _activeInputText,
                              onTapWeight: (logIndex) => _triggerInput(
                                exerciseId: entry.key,
                                setIndex: logIndex,
                                fieldType: FieldType.weight,
                                currentValue: exLogs[logIndex].weight,
                              ),
                              onTapReps: (logIndex) => _triggerInput(
                                exerciseId: entry.key,
                                setIndex: logIndex,
                                fieldType: FieldType.reps,
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

                // Bottom controls
                WorkoutBottomControls(
                  isPaused: isPaused,
                  showKeyboard: showKeyboard,
                  onPauseResume: () {
                    if (isPaused) {
                      context.read<WorkoutSessionCubit>().resume();
                    } else {
                      context.read<WorkoutSessionCubit>().pause();
                    }
                  },
                  onFinish: () => _confirmFinish(context),
                ),
              ],
            ),
          ),
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
                child: _overlayMode == _InputOverlay.none
                    ? WorkoutNumericKeyboard(
                        isWeight: _focusTarget!.isWeight,
                        isLastField: isLastField,
                        text: _activeInputText,
                        onTextChanged: (v) => setState(() => _activeInputText = v),
                        onNext: _handleInputNext,
                        onDismiss: _handleInputDismiss,
                        onAction: () {
                          setState(() {
                            _overlayMode = _focusTarget!.isWeight
                                ? _InputOverlay.plateCalculator
                                : _InputOverlay.rpePicker;
                          });
                        },
                      )
                    : _buildOverlayContent(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOverlayContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              onPressed: () => setState(() => _overlayMode = _InputOverlay.none),
              icon: const Icon(Icons.keyboard_rounded, size: 16),
              label: const Text('Keyboard'),
            ),
          ),
          const SizedBox(height: 8),
          if (_overlayMode == _InputOverlay.plateCalculator)
            PlateCalculator.inline(
              targetWeight: double.tryParse(
                  _activeInputText.replaceAll(',', '.')) ?? 0,
            )
          else
            RpePicker.inline(
              currentRpe: _getCurrentRpe(),
              onSelected: (rpe) {
                _applyRpe(rpe);
                setState(() => _overlayMode = _InputOverlay.none);
              },
            ),
        ],
      ),
    );
  }

  int? _getCurrentRpe() {
    if (_focusTarget == null) return null;
    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) return null;
    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();
    if (_focusTarget!.setIndex >= exLogs.length) return null;
    return exLogs[_focusTarget!.setIndex].rpe;
  }

  void _applyRpe(int? rpe) {
    if (_focusTarget == null || rpe == null) return;
    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) return;
    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();
    if (_focusTarget!.setIndex >= exLogs.length) return;
    final log = exLogs[_focusTarget!.setIndex];
    cubit.logSet(
      logId: log.id,
      exerciseId: _focusTarget!.exerciseId,
      reps: log.reps ?? 0,
      weight: log.weight,
      isCompleted: log.isCompleted,
      rpe: rpe,
    );
  }

  Widget _buildRestFinishedToast() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
            SizedBox(width: 8),
            Text(
              'Rest Finished!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
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

  // ── Input system ──────────────────────────────────────────────────────

  void _triggerInput({
    required String exerciseId,
    required int setIndex,
    required FieldType fieldType,
    double? currentValue,
  }) {
    _syncActiveInput();

    final target = FocusTarget(
      exerciseId: exerciseId,
      setIndex: setIndex,
      fieldType: fieldType,
    );

    setState(() {
      _focusTarget = target;
      _activeInputText = formatInputValue(currentValue);
    });
    developer.log(
      'nav_focus | exercise=$exerciseId | set=$setIndex | field=${fieldType.name} '
      '| value=${_activeInputText.isNotEmpty ? _activeInputText : "empty"}',
      name: 'workout',
    );
  }

  void _syncActiveInput() {
    if (_focusTarget == null || _activeInputText.isEmpty) return;

    final value = double.tryParse(_activeInputText.replaceAll(',', '.'));
    if (value == null) return;

    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) return;

    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();

    if (_focusTarget!.setIndex >= exLogs.length) return;
    final log = exLogs[_focusTarget!.setIndex];

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

  void _syncActiveInputLocally() {
    if (_focusTarget == null || _activeInputText.isEmpty) return;

    final value = double.tryParse(_activeInputText.replaceAll(',', '.'));
    if (value == null) return;

    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    if (state is! WorkoutSessionActive) return;

    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();

    if (_focusTarget!.setIndex >= exLogs.length) return;
    final log = exLogs[_focusTarget!.setIndex];

    if (_focusTarget!.isWeight) {
      cubit.updateLogLocally(
        logId: log.id,
        exerciseId: _focusTarget!.exerciseId,
        weight: value,
      );
    } else {
      cubit.updateLogLocally(
        logId: log.id,
        exerciseId: _focusTarget!.exerciseId,
        reps: value.toInt(),
      );
    }
  }

  void _handleInputNext() {
    if (_focusTarget == null) return;

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

    if (setIndex >= exLogs.length) {
      _handleInputDismiss();
      return;
    }

    final log = exLogs[setIndex];

    if (_focusTarget!.isWeight) {
      // 1. We are on weight. Save draft weight value locally and move to reps.
      _syncActiveInputLocally();
      
      final exerciseName = log.exercise?.name ?? exerciseId;
      developer.log(
        'nav_next | exercise=$exerciseName | set=$setIndex | field=weight→reps',
        name: 'workout',
      );
      _setFocusDelayed(
        exerciseId: exerciseId,
        setIndex: setIndex,
        fieldType: FieldType.reps,
        currentValue: log.reps?.toDouble(),
      );
    } else {
      // 2. We are on reps.
      final nextIndex = setIndex + 1;
      if (nextIndex < exLogs.length) {
        // There is a next set. Save draft reps value locally and move to next set's weight.
        _syncActiveInputLocally();
        
        developer.log(
          'nav_next | exercise=${exLogs[nextIndex].exercise?.name ?? exerciseId} '
          '| set=$setIndex→$nextIndex | field=reps→weight',
          name: 'workout',
        );
        _setFocusDelayed(
          exerciseId: exerciseId,
          setIndex: nextIndex,
          fieldType: FieldType.weight,
          currentValue: exLogs[nextIndex].weight,
        );
      } else {
        // This is the last field of the last set!
        // Tapping 'Done' should submit the set/exercise as completed!
        _completeSet(
          exerciseId: exerciseId,
          setIndex: setIndex,
          log: log,
        );
      }
    }
  }

  void _setFocusDelayed({
    required String exerciseId,
    required int setIndex,
    required FieldType fieldType,
    double? currentValue,
  }) {
    setState(() {
      _focusTarget = FocusTarget(
        exerciseId: exerciseId,
        setIndex: setIndex,
        fieldType: fieldType,
      );
      _activeInputText = formatInputValue(currentValue);
    });
  }

  void _handleInputDismiss() {
    _syncActiveInput();
    if (_focusTarget != null) {
      developer.log(
        'nav_dismiss | exercise=${_focusTarget!.exerciseId} '
        '| set=${_focusTarget!.setIndex} | field=${_focusTarget!.isWeight ? "weight" : "reps"}',
        name: 'workout',
      );
    }
    setState(() {
      _focusTarget = null;
      _activeInputText = '';
    });
  }

  void _completeSet({
    required String exerciseId,
    required int setIndex,
    required ExerciseLogDto log,
  }) {
    HapticFeedback.mediumImpact();
    final cubit = context.read<WorkoutSessionCubit>();

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
    developer.log(
      '_completeSet | exercise=${log.exercise?.name ?? exerciseId} | set=$setIndex '
      '| reps=$reps | weight=${weight ?? "—"} | completed=$becomingCompleted',
      name: 'workout',
    );
    cubit.logSet(
      logId: log.id,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
      isCompleted: becomingCompleted,
    );

    if (becomingCompleted) {
      cubit.startRest();
    }

    if (_focusTarget != null &&
        _focusTarget!.exerciseId == exerciseId &&
        _focusTarget!.setIndex == setIndex) {
      setState(() {
        _focusTarget = null;
        _activeInputText = '';
      });
    }
  }

  void _addSet(String exerciseId) {
    developer.log('_addSet | exerciseId=$exerciseId', name: 'workout');
    context.read<WorkoutSessionCubit>().logSet(
      exerciseId: exerciseId,
      reps: 0,
      weight: 0,
      isCompleted: false,
    );
  }

  // ── Dialogs ───────────────────────────────────────────────────────────

  void _confirmFinish(BuildContext context) {
    HapticFeedback.mediumImpact();
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
    HapticFeedback.mediumImpact();
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

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExercisePickerSheet.single(
        exercises: allExercises,
        onExerciseSelected: (selected) {
          cubit.addExercises([selected.id]);
        },
      ),
    );
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
    if (name != null && name.isNotEmpty && mounted) {
      context.read<WorkoutSessionCubit>().saveSessionAsTemplate(name);
      if (mounted) {
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
}
      