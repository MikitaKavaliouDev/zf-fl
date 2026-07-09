import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
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

  // Local state tracking to prevent duplicate triggers from periodic timer ticks
  bool _lastShowRestFinishedToast = false;
  bool _lastNewPrRecord = false;
  bool _dismissedLongWarning = false;

  /// Composite key that changes whenever the focus target moves.
  /// Used to force BlocSelector-based widgets to rebuild when focus changes
  /// without rebuilding on every 1-second timer tick.
  String get _focusKey {
    if (_focusTarget == null) return 'none';
    return '${_focusTarget!.exerciseId}:${_focusTarget!.setIndex}:${_focusTarget!.fieldType.name}';
  }

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
    final isSessionActive = context.select<WorkoutSessionCubit, bool>(
      (cubit) => cubit.state is WorkoutSessionActive,
    );

    return PopScope(
      canPop: !isSessionActive,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleInputDismiss();
        context.read<WorkoutSessionCubit>().minimize();
      },
      child: Scaffold(
        key: const ValueKey('workoutSessionScreen'),
        appBar: _buildAppBar(),
        body: BlocListener<WorkoutSessionCubit, WorkoutSessionState>(
          listenWhen: _listenWhen,
          listener: _stateListener,
          child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
            buildWhen: (p, c) => c.runtimeType != p.runtimeType,
            builder: (context, state) {
              return switch (state) {
                WorkoutSessionInitial() => WorkoutIdleView(
                    onStartWorkout: () => context.read<WorkoutSessionCubit>().start(),
                    onStartFromTemplate: () => _showTemplatePicker(context),
                  ),
                WorkoutSessionLoading() => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                WorkoutSessionActive() => _buildActiveContent(),
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
              };
            },
          ),
        ),
      ),
    );
  }

  /// Only trigger side-effect listener for specific state changes,
  /// not for every 1-second timer tick.
  bool _listenWhen(WorkoutSessionState previous, WorkoutSessionState current) {
    // Completed → emit event
    if (current is WorkoutSessionCompleted) return true;
    // Error → show error (but only when transitioning, not on refresh)
    if (current is WorkoutSessionError && previous is! WorkoutSessionError) return true;
    if (current is WorkoutSessionActive) {
      // PR flag changed
      if (current.newPrRecord !=
          (previous is WorkoutSessionActive && previous.newPrRecord)) {
        return true;
      }
      // Rest finished toast changed
      if (current.showRestFinishedToast !=
          (previous is WorkoutSessionActive && previous.showRestFinishedToast)) {
        return true;
      }
      // Minimize transition
      if (current.isMinimized !=
          (previous is WorkoutSessionActive && previous.isMinimized)) {
        return true;
      }
    }
    // Non-active → reset local state
    if (current is! WorkoutSessionActive && previous is WorkoutSessionActive) {
      return true;
    }
    return false;
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
        HapticFeedback.mediumImpact();
        Future.delayed(const Duration(milliseconds: 120), () {
          HapticFeedback.heavyImpact();
        });
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
        _lastNewPrRecord = false;
        _lastShowRestFinishedToast = false;
        _dismissedLongWarning = false;
      });
    }
  }

  // ── Active state builder ──────────────────────────────────────────────
  //
  // The active workout view is split into 3 independent BlocSelector segments:
  //
  //   1. _TimerSection     — reads elapsed / isPaused / rest state.
  //      Rebuilds every tick but its subtree is tiny (a row of text + progress bar).
  //
  //   2. _ExerciseListView — reads logs (List<ExerciseLogDto>).
  //      Rebuilds ONLY when exercises/sets are added, removed, or completed —
  //      NOT on every 1-second timer tick.
  //
  //   3. _BottomControlsSection — reads isPaused.
  //      Rebuilds only on pause/resume (infrequent).
  //
  // The keyboard overlay lives outside the BlocBuilder tree so it can
  // respond to local setState (focus target changes) without interfering
  // with the state-driven sections above.

  Widget _buildActiveContent() {
    final showKeyboard = _focusTarget != null;
    const keyboardHeight = 260.0;

    return Stack(
      children: [
        _InteractiveWorkoutSheet(
          onMinimize: () {
            _handleInputDismiss();
            context.read<WorkoutSessionCubit>().minimize();
          },
          onDismissInput: _handleInputDismiss,
          child: Column(
            children: [
              // ── 1. Timer section (BlocSelector — isolated from list) ──
              const _TimerSection(),

              // ── 2. Long-session warning (isolated BlocSelector — only
              //    rebuilds when showLongSessionWarning changes, not on ticks) ──
              _SessionWarningBanner(
                dismissed: _dismissedLongWarning,
                onDismiss: () => setState(() => _dismissedLongWarning = true),
              ),

              // ── 3. Exercise list (BlocSelector — only rebuilds on logs) ──
              // The key changes on focus-change so the list reflects the
              // current focusTarget even when logs haven't changed.
              Expanded(
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.only(bottom: showKeyboard ? keyboardHeight : 0),
                  child: _buildExerciseList(
                    showKeyboard: showKeyboard,
                    focusKey: _focusKey,
                  ),
                ),
              ),

              // ── 4. Bottom controls (BlocSelector — only on pause/resume) ──
              _BottomControlsSection(
                showKeyboard: showKeyboard,
                onFinish: () => _confirmFinish(context),
              ),
            ],
          ),
        ),

        // ── Keyboard overlay (animated slide-up + morphing) ──
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          left: 0,
          right: 0,
          bottom: showKeyboard ? 0 : -keyboardHeight - 40,
          child: showKeyboard
              ? _buildKeyboardOverlay()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildKeyboardOverlay() {
    return Material(
      elevation: 8,
      child: SafeArea(
        top: false,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.08),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: _overlayMode == _InputOverlay.none
              ? WorkoutNumericKeyboard(
                  key: const ValueKey('num'),
                  isWeight: _focusTarget!.isWeight,
                  isLastField: _computeIsLastField(),
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
              : SizedBox(
                  key: const ValueKey('overlay'),
                  child: _buildOverlayContent(),
                ),
        ),
      ),
    );
  }

  /// Compute whether the current focus target is on the last field
  /// of the last set (used by keyboard to show "Done" vs "Next").
  bool _computeIsLastField() {
    if (_focusTarget == null) return false;
    final state = context.read<WorkoutSessionCubit>().state;
    if (state is! WorkoutSessionActive) return false;
    final exLogs = state.logs
        .where((l) => l.exerciseId == _focusTarget!.exerciseId)
        .toList();
    return !_focusTarget!.isWeight &&
        _focusTarget!.setIndex == exLogs.length - 1;
  }

  /// Build the exercise list wrapped in a [BlocSelector] so it ONLY
  /// rebuilds when [logs] change (not on every 1-second timer tick).
  ///
  /// The [focusKey] forces a widget-key change when [_focusTarget] moves,
  /// ensuring the list reflects the updated highlight even when logs
  /// are stable.
  Widget _buildExerciseList({
    required bool showKeyboard,
    required String focusKey,
  }) {
    return BlocSelector<WorkoutSessionCubit, WorkoutSessionState,
        List<ExerciseLogDto>>(
      key: ValueKey('ex-list-$focusKey'),
      selector: (state) =>
          state is WorkoutSessionActive ? state.logs : const [],
      builder: (context, logs) {
        // Group logs by exerciseId
        final grouped = <String, List<ExerciseLogDto>>{};
        final names = <String, String>{};
        for (final log in logs) {
          grouped.putIfAbsent(log.exerciseId, () => []);
          grouped[log.exerciseId]!.add(log);
          if (log.exercise != null) {
            names[log.exerciseId] = log.exercise!.name;
          }
        }

        if (grouped.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fitness_center_rounded,
                    size: 48,
                    color: AppColors.mutedText.withValues(alpha: 0.3)),
                const SizedBox(height: 16),
                const Text('No exercises yet',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mutedText)),
                const SizedBox(height: 8),
                const Text('Add an exercise to start logging sets.',
                    style: TextStyle(
                        fontSize: 14, color: AppColors.mutedText)),
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

        return ListView.builder(
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
            final name = names[entry.key] ?? 'Exercise';
            final muscleGroup = exLogs
                .firstWhere((l) => l.exercise?.muscleGroup != null,
                    orElse: () => exLogs.first)
                .exercise
                ?.muscleGroup;
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

            return RepaintBoundary(
              child: FadeSlideTransition(
                key: ValueKey('exercise-${entry.key}'),
                child: ExerciseCard(
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
                ),
              ),
            );
          },
        );
      },
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
      builder: (_) => ExercisePickerSheet.multiple(
        exercises: allExercises,
        onExercisesSelected: (selected) {
          cubit.addExercises(selected.map((e) => e.id).toList());
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
} // _WorkoutSessionScreenState

// ═════════════════════════════════════════════════════════════════════════════
// Phase 1: BlocSelector-isolated sub-widgets
// ═════════════════════════════════════════════════════════════════════════════

/// Timer bar + rest-finished toast that only rebuilds on timer-related
/// state fields (elapsed, isPaused, restStartedAt, etc.).
///
/// The parent [BlocBuilder] may fire on every tick, but this widget uses
/// [BlocSelector] so its builder only runs when timer/rest fields change.
class _TimerSection extends StatelessWidget {
  const _TimerSection();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkoutSessionCubit, WorkoutSessionState, _TimerData>(
      selector: (state) {
        if (state is! WorkoutSessionActive) return _TimerData();
        return _TimerData(
          elapsed: state.elapsed,
          isPaused: state.isPaused,
          isResting: state.restStartedAt != null,
          restElapsed: state.restElapsed,
          restRemaining: state.restRemaining,
          restDuration: state.restDuration,
          showRestFinishedToast: state.showRestFinishedToast,
        );
      },
      builder: (context, data) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SessionTimerBar(
              elapsed: data.elapsed,
              isPaused: data.isPaused,
              isResting: data.isResting,
              restElapsed: data.restElapsed,
              restRemaining: data.restRemaining,
              restDuration: data.restDuration,
              onRestTimerTap: () => _showRestTimerSheet(context,
                  data.restRemaining ?? data.restElapsed.inSeconds,
                  data.restDuration ?? 120),
            ),
            if (data.showRestFinishedToast)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check_circle_rounded,
                          color: Colors.green, size: 20),
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
              ),
          ],
        );
      },
    );
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

/// Data bundle selected by [BlocSelector] — avoids exposing the full
/// [WorkoutSessionActive] state to the timer subtree.
///
/// Implements [==] and [hashCode] so [BlocSelector] can correctly skip
/// rebuilds when values haven't changed (e.g., two consecutive ticks
/// where only `elapsed` differs by 1 s, but the other fields are stable).
class _TimerData {
  final Duration elapsed;
  final bool isPaused;
  final bool isResting;
  final Duration restElapsed;
  final int? restRemaining;
  final int? restDuration;
  final bool showRestFinishedToast;

  const _TimerData({
    this.elapsed = Duration.zero,
    this.isPaused = false,
    this.isResting = false,
    this.restElapsed = Duration.zero,
    this.restRemaining,
    this.restDuration,
    this.showRestFinishedToast = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TimerData &&
          runtimeType == other.runtimeType &&
          elapsed == other.elapsed &&
          isPaused == other.isPaused &&
          isResting == other.isResting &&
          restElapsed == other.restElapsed &&
          restRemaining == other.restRemaining &&
          restDuration == other.restDuration &&
          showRestFinishedToast == other.showRestFinishedToast;

  @override
  int get hashCode => Object.hash(
        runtimeType,
        elapsed,
        isPaused,
        isResting,
        restElapsed,
        restRemaining,
        restDuration,
        showRestFinishedToast,
      );
}

// ═════════════════════════════════════════════════════════════════════════════
// Long-session warning (isolated BlocSelector — only rebuilds once)
// ═════════════════════════════════════════════════════════════════════════════

/// Renders the "Session exceeds 2 hours" warning banner in its own
/// [BlocSelector] that only selects [showLongSessionWarning].  This field
/// flips once (from `false` to `true`) when the session crosses the 2-hour
/// threshold, so the warning widget rebuilds exactly once — never on every
/// 1-second timer tick.
///
/// Separate from [_TimerSection] so that the tick-sensitive timer bar does
/// not drag the warning into a 60‑times‑per‑minute rebuild cycle.
class _SessionWarningBanner extends StatelessWidget {
  final bool dismissed;
  final VoidCallback onDismiss;

  const _SessionWarningBanner({
    required this.dismissed,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkoutSessionCubit, WorkoutSessionState, bool>(
      selector: (state) =>
          state is WorkoutSessionActive && state.showLongSessionWarning,
      builder: (context, showWarning) {
        if (!showWarning || dismissed) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.orange.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 16,
                  color: Colors.orange,
                ),
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
                  child: const Icon(
                    Icons.close_rounded,
                    size: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Phase 3: Gesture-driven minimize sheet (spring physics)
// ═════════════════════════════════════════════════════════════════════════════

/// Wraps the active workout content in a gesture-driven draggable sheet that
/// scales + translates + rounds corners as the user drags down. A high-velocity
/// or long drag triggers [onMinimize]; otherwise the sheet springs back with
/// physics-based elasticity (interruptible — the user can catch mid‑spring).
class _InteractiveWorkoutSheet extends StatefulWidget {
  final Widget child;
  final VoidCallback onMinimize;
  final VoidCallback onDismissInput;

  const _InteractiveWorkoutSheet({
    required this.child,
    required this.onMinimize,
    required this.onDismissInput,
  });

  @override
  State<_InteractiveWorkoutSheet> createState() =>
      _InteractiveWorkoutSheetState();
}

class _InteractiveWorkoutSheetState extends State<_InteractiveWorkoutSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _dragY = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      // Resist upward drag (prevent overscroll), allow free downward drag
      if (details.delta.dy < 0) {
        _dragY += details.delta.dy * 0.3;
      } else {
        _dragY += details.delta.dy;
      }
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0.0;

    // Dismiss if thrown down with high velocity or dragged past threshold
    if (velocity > 800 || _dragY > 150) {
      widget.onDismissInput();
      widget.onMinimize();
      setState(() => _dragY = 0.0);
      return;
    }

    // Spring back to origin with elastic physics
    // Use a unique key to allow re-targeting the controller listener
    _controller.reset();
    final simulation = SpringSimulation(
      SpringDescription(mass: 1.0, stiffness: 180.0, damping: 15.0),
      _dragY, // start position
      0.0, // end position (origin)
      velocity,
    );
    _controller.addListener(_onSpringTick);
    _controller.animateWith(simulation).then((_) {
      _controller.removeListener(_onSpringTick);
      if (mounted) {
        setState(() => _dragY = 0.0);
      }
    });
  }

  void _onSpringTick() {
    setState(() => _dragY = _controller.value);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // Scale down as user drags down (max 15% shrink)
    final scale = (1.0 - (_dragY / screenHeight)).clamp(0.85, 1.0);
    // Round corners progressively (up to 24pt at full drag extent)
    final borderRadius = (_dragY / 10).clamp(0.0, 24.0);

    return GestureDetector(
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: Transform.translate(
        offset: Offset(0, _dragY.clamp(0, double.infinity)),
        child: Transform.scale(
          scale: scale,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Fade + Slide entry transition for newly added exercise cards
// ═════════════════════════════════════════════════════════════════════════════

/// A one-shot fade-and-slide-up transition that plays when the widget is first
/// inserted into the tree.
///
/// Use a stable [Key] (e.g. `ValueKey(exerciseId)`) to prevent re-animation
/// when the parent list rebuilds for non-structural reasons (timer tick, etc.).
class FadeSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeSlideTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 350),
  });

  @override
  State<FadeSlideTransition> createState() => _FadeSlideTransitionState();
}

class _FadeSlideTransitionState extends State<FadeSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

/// Bottom controls section — only rebuilds on [isPaused] changes.
class _BottomControlsSection extends StatelessWidget {
  final bool showKeyboard;
  final VoidCallback onFinish;

  const _BottomControlsSection({
    required this.showKeyboard,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkoutSessionCubit, WorkoutSessionState, bool>(
      selector: (state) =>
          state is WorkoutSessionActive && state.isPaused,
      builder: (context, isPaused) {
        return WorkoutBottomControls(
          isPaused: isPaused,
          showKeyboard: showKeyboard,
          onPauseResume: () {
            if (isPaused) {
              context.read<WorkoutSessionCubit>().resume();
            } else {
              context.read<WorkoutSessionCubit>().pause();
            }
          },
          onFinish: onFinish,
        );
      },
    );
  }
}
      