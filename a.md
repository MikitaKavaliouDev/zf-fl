<response>
  <reasoning>
    I will fix the issues as requested:
    1. Clicking "Next" (transitioning between weight and reps, or transitioning to the next set) should *only* perform a local, in-memory state update to preserve the typed values in the UI, without calling the backend API.
    2. Clicking "Done" (on the last reps field of the exercise) should submit the set/exercise to the API as completed (`isCompleted: true`), which marks it with a green checkmark in the UI, starts the rest timer, and dismisses the keyboard.
    
    To achieve this:
    - I will add an `updateLogLocally` method to `WorkoutSessionCubit` which updates the local logs state in-memory without making an API request.
    - I will create `_syncActiveInputLocally()` in `WorkoutSessionScreen` which calls `updateLogLocally` on the Cubit.
    - I will update `_handleInputNext()` to use `_syncActiveInputLocally()` during intermediate "Next" transitions so that no API calls are made.
    - I will ensure `_handleInputDismiss()` (when keyboard is closed manually or blurred) still calls `_syncActiveInput()` (autosave draft to API with `isCompleted: false`) to prevent any loss of data.
    - I will verify that clicking "Done" calls `_completeSet()` to set the status to completed (`isCompleted: true`) in the UI and save to the API.
  </reasoning>
  <modifications>
    <file path="lib/features/trainers/cubit/workout_session_cubit.dart">
      <![CDATA[
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/template_dto.dart';
import '../data/workout_session_repository.dart';
import 'workout_session_state.dart';

@injectable
class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  final WorkoutSessionRepository _repository;
  Timer? _timer;

  WorkoutSessionCubit(this._repository) : super(const WorkoutSessionState.initial());

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    final current = state;
    if (current is! WorkoutSessionActive || current.isPaused) return;

    // Compute elapsed from startTime (absolute timing, not accumulated)
    final elapsed = current.startTime != null
        ? DateTime.now().difference(current.startTime!)
        : current.elapsed + const Duration(seconds: 1);

    // Countdown rest timer (if restDuration is set)
    int? restRemaining = current.restRemaining;
    if (current.restDuration != null && current.restRemaining != null) {
      final remaining = current.restRemaining!;
      if (remaining > 0) {
        restRemaining = remaining - 1;
      }
      if (restRemaining != null && restRemaining <= 0) {
        // Rest finished
        restRemaining = null;
      }
    }

    // Rest finished toast trigger
    bool showRestFinishedToast = current.showRestFinishedToast;
    if (current.restRemaining != null && current.restRemaining! > 0 && restRemaining == null) {
      // Rest just finished this tick (transitioned from >0 to null)
      showRestFinishedToast = true;
      developer.log(
        'rest_finished | elapsed=${elapsed.inSeconds}s',
        name: 'workout',
      );
      // Auto-reset after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        final s = state;
        if (s is WorkoutSessionActive) {
          emit(s.copyWith(showRestFinishedToast: false));
        }
      });
    }

    // Compute restElapsed from restStartedAt
    Duration newRestElapsed = current.restElapsed;
    if (current.restStartedAt != null) {
      newRestElapsed = DateTime.now().difference(current.restStartedAt!);
    }

    final showWarning = elapsed.inSeconds >= 7200 && !current.showLongSessionWarning;

    emit(current.copyWith(
      elapsed: elapsed,
      restElapsed: newRestElapsed,
      restRemaining: restRemaining,
      showLongSessionWarning: showWarning,
      showRestFinishedToast: showRestFinishedToast,
    ));
  }

  /// Start a new workout session.
  Future<void> start({
    String? clientId,
    String? plannedSessionId,
    String? templateId,
    String? clientPackageId,
  }) async {
    // Don't start if already active — emit conflict state
    if (state is WorkoutSessionActive) {
      final currentState = state as WorkoutSessionActive;
      developer.log(
        'start_conflict | existingSessionId=${currentState.session.id}',
        name: 'workout',
      );
      emit(WorkoutSessionState.conflict(existingSessionId: currentState.session.id));
      return;
    }
    emit(const WorkoutSessionState.loading());
    try {
      final result = await _repository.startSession(
        clientId: clientId,
        plannedSessionId: plannedSessionId,
        templateId: templateId,
        clientPackageId: clientPackageId,
      );
      // Use the server's authoritative startTime so the timer
      // stays accurate even across app restarts or clock drift.
      final serverStartTime = DateTime.parse(result.session.startTime);
      emit(WorkoutSessionState.active(
        session: result.session,
        logs: result.logs,
        elapsed: Duration.zero,
        startTime: serverStartTime,
      ));
      _startTimer();
      developer.log('workout_started | exerciseCount=${result.logs.length}', name: 'analytics');
      developer.log(
        'start | sessionId=${result.session.id} | exerciseCount=${result.logs.length} | serverStartTime=${result.session.startTime}',
        name: 'workout',
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to start session.'));
    }
  }

  /// Load the current live session if one exists.
  Future<void> loadCurrent({bool isMinimized = true}) async {
    emit(const WorkoutSessionState.loading());
    try {
      final result = await _repository.getLiveSession();
      if (result.session != null) {
        // Auto-minimize when resuming from cold start so the user
        // isn't thrown into a full-screen workout unexpectedly.
        // Use the server's startTime for accurate elapsed calculation.
        final serverStartTime = DateTime.parse(result.session!.startTime);
        emit(WorkoutSessionState.active(
          session: result.session!,
          logs: result.logs,
          elapsed: Duration.zero,
          startTime: serverStartTime,
          isMinimized: isMinimized,
        ));
        _startTimer();
        developer.log(
          'loadCurrent | sessionId=${result.session!.id} '
          '| logCount=${result.logs.length} '
          '| serverStartTime=${result.session!.startTime}',
          name: 'workout',
        );
      } else {
        emit(const WorkoutSessionState.initial());
        developer.log('loadCurrent | no active session', name: 'workout');
      }
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to load session.'));
    }
  }

  /// Resolve a session conflict by either starting fresh or continuing existing.
  Future<void> resolveConflict({required bool startNew}) async {
    if (startNew) {
      // Cancel existing, then start fresh
      final current = state;
      if (current is WorkoutSessionConflict) {
        try {
          await _repository.cancelSession(current.existingSessionId);
        } catch (_) {}
      }
      emit(const WorkoutSessionState.initial());
      // Don't auto-restart — user must tap "Start Workout" again
    } else {
      // Continue existing — load the current session
      await loadCurrent(isMinimized: false);
    }
  }

  /// Fetch exercise library from backend (system + custom exercises).
  Future<List<ExerciseDto>> fetchExercises() =>
      _repository.getExerciseLibrary();

  /// Fetch all available templates.
  Future<List<TemplateDto>> fetchTemplates() =>
      _repository.getTemplates();

  /// Get a specific template by ID.
  Future<TemplateDto> getTemplate(String templateId) =>
      _repository.getTemplate(templateId);

  /// Save the completed session as a template.
  Future<void> saveSessionAsTemplate(String templateName) async {
    final current = state;
    if (current is! WorkoutSessionCompleted) return;
    try {
      await _repository.saveSessionAsTemplate(
        sessionId: current.session.id,
        templateName: templateName,
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to save template.'));
    }
  }

  /// Add exercises to the active session.
  /// The new logs are appended directly from the POST response —
  /// no separate reload, no loading flash, timer keeps ticking.
  Future<void> addExercises(List<String> exerciseIds) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      final newLogs = await _repository.addExercises(
        sessionId: current.session.id,
        exerciseIds: exerciseIds,
      );
      emit(current.copyWith(logs: [...current.logs, ...newLogs]));
      final names = newLogs
          .map((l) => l.exercise?.name ?? l.exerciseId)
          .join(', ');
      developer.log(
        'addExercises | count=${newLogs.length} | exercises=[$names]',
        name: 'workout',
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to add exercises.'));
    }
  }

  /// Remove an exercise from the active session.
  Future<void> removeExercise(String exerciseId) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      await _repository.removeExercise(
        sessionId: current.session.id,
        exerciseId: exerciseId,
      );
      final removedName = current.logs
          .where((l) => l.exerciseId == exerciseId)
          .firstOrNull
          ?.exercise?.name ?? exerciseId;
      emit(current.copyWith(
        logs: current.logs.where((l) => l.exerciseId != exerciseId).toList(),
      ));
      developer.log(
        'removeExercise | exercise=$removedName($exerciseId)',
        name: 'workout',
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to remove exercise.'));
    }
  }

  /// Log an exercise set in the active session.
  /// Applies an optimistic local update immediately so the UI feels instant,
  /// then reconciles with the server response.
  Future<void> logSet({
    String? logId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? rpe,
    String? tempo,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;

    // Resolve exercise name from existing logs for readable logging.
    final existingForExercise = current.logs
        .where((l) => l.exerciseId == exerciseId)
        .toList();
    final exerciseName =
        existingForExercise.firstOrNull?.exercise?.name ?? exerciseId;

    // Safely look up the previous completion status of this set log.
    final existingLog = current.logs.where((l) => l.id == logId).firstOrNull;
    final currentIsCompleted = existingLog?.isCompleted ?? false;

    // Use explicitly passed status or fall back to the existing completion status of this set.
    final resolvedIsCompleted = isCompleted ?? currentIsCompleted;

    developer.log(
      'logSet | exercise=$exerciseName($exerciseId) '
      '| reps=$reps | weight=${weight ?? "—"} | rpe=${rpe ?? "—"} '
      '| order=$order | isCompleted=$resolvedIsCompleted '
      '| setId=${logId ?? "new"}',
      name: 'workout',
    );

    // Optimistic update: apply the new set immediately.
    final optimisticLog = ExerciseLogDto(
      id: logId ?? 'opt_${DateTime.now().microsecondsSinceEpoch}',
      clientId: current.session.clientId,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
      rpe: rpe,
      tempo: tempo,
      isCompleted: resolvedIsCompleted,
      order: order,
      supersetKey: supersetKey,
      orderInSuperset: orderInSuperset,
      workoutSessionId: current.session.id,
    );
    final updatedLogs = [...current.logs];
    final idx = updatedLogs.indexWhere((l) => l.id == optimisticLog.id);
    if (idx >= 0) {
      updatedLogs[idx] = optimisticLog;
    } else {
      updatedLogs.add(optimisticLog);
    }
    emit(current.copyWith(logs: updatedLogs));

    // Reconcile with the server response.
    try {
      final response = await _repository.logExercise(
        logId: logId,
        workoutSessionId: current.session.id,
        exerciseId: exerciseId,
        reps: reps,
        weight: weight,
        rpe: rpe,
        tempo: tempo,
        order: order,
        supersetKey: supersetKey,
        orderInSuperset: orderInSuperset,
        isCompleted: resolvedIsCompleted,
      );
      // Use the LATEST active state (not `current`) to avoid overwriting
      // fields set after the optimistic emit (e.g. restStartedAt).
      final latest = state as WorkoutSessionActive;
      final reconciledLogs = [...latest.logs];
      // Replace the optimistic entry (temp ID) with the server-confirmed one at the exact same index.
      final indexToReplace = reconciledLogs.indexWhere((l) => l.id == optimisticLog.id || l.id == response.log.id);
      if (indexToReplace >= 0) {
        reconciledLogs[indexToReplace] = response.log;
      } else {
        reconciledLogs.add(response.log);
      }
      emit(latest.copyWith(logs: reconciledLogs));
      developer.log(
        'logSet_reconciled | exercise=$exerciseName($exerciseId) '
        '| logId=${response.log.id} | reps=${response.log.reps} '
        '| weight=${response.log.weight} | rpe=${response.log.rpe}',
        name: 'workout',
      );

      // Check for PR records
      if (response.newRecords != null && response.newRecords!.isNotEmpty) {
        final latest2 = state as WorkoutSessionActive;
        final newRecords = response.newRecords!.cast<Map<String, dynamic>>();
        final accumulated = [...latest2.sessionNewRecords, ...newRecords];
        emit(latest2.copyWith(
          newPrRecord: true,
          sessionNewRecords: accumulated,
        ));
        // Auto-reset PR flag after 3s (but keep accumulated records)
        Future.delayed(const Duration(seconds: 3), () {
          final s = state;
          if (s is WorkoutSessionActive) {
            emit(s.copyWith(newPrRecord: false));
          }
        });
      }
    } catch (e) {
      // Server rejected — revert the optimistic log without disrupting the UI.
      final currentState = state;
      if (currentState is WorkoutSessionActive) {
        final reverted = currentState.logs
            .where((l) => l.id != optimisticLog.id)
            .toList();
        emit(current.copyWith(logs: reverted));
      }
    }
  }

  /// Update log locally in-memory (no API call).
  void updateLogLocally({
    required String logId,
    required String exerciseId,
    double? weight,
    int? reps,
  }) {
    final current = state;
    if (current is! WorkoutSessionActive) return;

    final updatedLogs = current.logs.map((log) {
      if (log.id == logId) {
        return log.copyWith(
          weight: weight ?? log.weight,
          reps: reps ?? log.reps,
        );
      }
      return log;
    }).toList();

    emit(current.copyWith(logs: updatedLogs));
  }

  /// Finish the active session.
  Future<void> finish({String? notes, bool? completeUnfinished}) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      _timer?.cancel();
      final result = await _repository.finishSession(
        workoutSessionId: current.session.id,
        notes: notes,
        completeUnfinished: completeUnfinished,
      );
      final sessionNewRecords = current.sessionNewRecords;
      emit(WorkoutSessionState.completed(
        session: result.session,
        totalDuration: current.elapsed,
        logs: result.logs,
        newRecords: sessionNewRecords,
        showPrToast: sessionNewRecords.isNotEmpty,
      ));
      developer.log('workout_completed | duration=${current.elapsed.inMinutes}min exerciseCount=${current.logs.length}', name: 'analytics');
      developer.log(
        'finish | sessionId=${result.session.id} | duration=${current.elapsed.inSeconds}s | exerciseCount=${result.logs.length} | newRecords=${sessionNewRecords.length} | notes=${notes ?? "—"}', name: 'workout',
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to finish session.'));
    }
  }

  /// Start the rest timer.
  Future<void> startRest({int? duration}) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(
      restStartedAt: DateTime.now(),
      restElapsed: Duration.zero,
      restDuration: duration,
      restRemaining: duration,
    ));
    developer.log(
      'startRest | duration=${duration ?? "default"}s | elapsed=${current.elapsed.inSeconds}s',
      name: 'workout',
    );
    try {
      await _repository.startRest(current.session.id);
    } catch (_) {}
  }

  /// End the rest timer.
  Future<void> endRest() async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    final wasRemaining = current.restRemaining;
    emit(current.copyWith(
      restStartedAt: null,
      restElapsed: Duration.zero,
      restRemaining: null,
      restDuration: null,
    ));
    developer.log(
      'endRest | remaining=${wasRemaining ?? "—"}s | elapsed=${current.elapsed.inSeconds}s',
      name: 'workout',
    );
    try {
      await _repository.endRest(current.session.id);
    } catch (_) {}
  }

  /// Adjust the rest countdown by [delta] seconds.
  void adjustRest(int delta) {
    final current = state;
    if (current is! WorkoutSessionActive || current.restRemaining == null) return;
    final newRemaining = max(0, current.restRemaining! + delta);
    emit(current.copyWith(
      restRemaining: newRemaining,
      restDuration: max(current.restDuration ?? 0, newRemaining),
    ));
    developer.log(
      'adjustRest | delta=$delta | newRemaining=${newRemaining}s',
      name: 'workout',
    );
  }

  /// Skip the rest timer early.
  Future<void> skipRest() async {
    developer.log('skipRest', name: 'workout');
    await endRest();
  }

  /// Minimize the active session to the mini-player overlay.
  /// The session stays active but the full-screen view is dismissed.
  void minimize() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(isMinimized: true));
    developer.log(
      'minimize | elapsed=${current.elapsed.inSeconds}s',
      name: 'workout',
    );
  }

  /// Maximize the mini-player back to the full workout session view.
  void maximize() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(isMinimized: false));
    developer.log(
      'maximize | elapsed=${current.elapsed.inSeconds}s',
      name: 'workout',
    );
  }

  /// Cancel the active workout session.
  Future<void> cancelSession() async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      _timer?.cancel();
      await _repository.cancelSession(current.session.id);
      emit(const WorkoutSessionState.initial());
      developer.log(
        'cancelSession | sessionId=${current.session.id} '
        '| duration=${current.elapsed.inSeconds}s',
        name: 'workout',
      );
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to cancel session.'));
    }
  }

  /// Pause the timer.
  void pause() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    _timer?.cancel();
    emit(current.copyWith(isPaused: true));
    developer.log(
      'pause | elapsed=${current.elapsed.inSeconds}s | restRemaining=${current.restRemaining ?? "—"}',
      name: 'workout',
    );
  }

  /// Resume the timer.
  void resume() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(isPaused: false));
    _startTimer();
    developer.log(
      'resume | elapsed=${current.elapsed.inSeconds}s',
      name: 'workout',
    );
  }

  /// Clear the new PR record state.
  void clearNewPrRecord() {
    final current = state;
    if (current is WorkoutSessionActive && current.newPrRecord) {
      emit(current.copyWith(newPrRecord: false));
    }
  }

  /// Clear the rest finished toast.
  void clearRestFinishedToast() {
    final current = state;
    if (current is WorkoutSessionActive && current.showRestFinishedToast) {
      emit(current.copyWith(showRestFinishedToast: false));
    }
  }
}
      ]]>
    </file>
    <file path="lib/features/trainers/presentation/workout_session_screen.dart">
      <![CDATA[
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/events/event_bus.dart';
import '../../../core/theme/app_theme.dart';
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

  @override
  void initState() {
    super.initState();
    final cubit = context.read<WorkoutSessionCubit>();
    if (cubit.state is WorkoutSessionActive) {
      // If the session is already active in memory, schedule a post-frame callback
      // to cleanly maximize/restore the session view on load.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cubit.maximize();
      });
    } else {
      cubit.loadCurrent(isMinimized: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WorkoutSessionCubit>();
    final isSessionActive = cubit.state is WorkoutSessionActive;
    final showKeyboard = _focusTarget != null;

    return PopScope(
      canPop: !isSessionActive,
      onPopInvoked: (didPop) {
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
              WorkoutSessionCompleted(:final totalDuration, :final logs, :final newRecords) =>
                WorkoutCompletedView(
                  totalDuration: totalDuration,
                  logs: logs,
                  newRecords: newRecords,
                  onNewWorkout: () => context.read<WorkoutSessionCubit>().start(),
                  onSaveAsTemplate: () => _showSaveAsTemplate(context),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Workout completed! Duration: ${formatDuration(state.totalDuration)}',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      getIt<EventBus>().emit(WorkoutCompletedEvent(
        sessionId: state.session.id,
        duration: state.totalDuration,
      ));
      context.go('/');
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

  void _onTapRpe(
      BuildContext context, String exerciseId, ExerciseLogDto log) {
    showDialog(
      context: context,
      builder: (dialogContext) => RpePicker(
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
          Navigator.of(dialogContext).pop();
        },
      ),
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
      ]]>
    </file>
    <file path="TASKS.md">
      <![CDATA[
- [x] Fix RPE (Rate of Perceived Exertion) modal dialog dismissal and submission issue.
- [x] Fix custom keyboard "Next"/"Done" button behavior: "Next" moves to the next field/set without marking as completed, while "Done" completes and submits the set/exercise on the last reps field.
- [x] Ensure that "Next" transitions save values locally to prevent losing entered inputs without sending any redundant API request.
      ]]>
    </file>
  </modifications>
</response>