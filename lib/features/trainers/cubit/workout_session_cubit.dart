import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/template_dto.dart';
import '../data/models/workout_session_dto.dart';
import '../data/models/workout_session_response.dart';
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

    // Accumulate elapsed time locally. The initial elapsed is set once
    // from the server's startTime (in start/loadCurrent), then incremented
    // here each tick. This avoids cross-timezone issues from comparing
    // DateTime.now() (local) against a UTC-parsed server timestamp.
    final elapsed = current.elapsed + const Duration(seconds: 1);

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
      // Use a local DateTime.now() as the timer reference point to avoid
      // cross-timezone issues comparing DateTime.now() (local) with the
      // server's UTC string. The initial elapsed is computed once from the
      // server startTime for correctness, then accumulated locally.
      final serverStartTime = DateTime.parse(result.session.startTime);
      final localTimerStart = DateTime.now();
      emit(WorkoutSessionState.active(
        session: result.session,
        logs: result.logs,
        elapsed: localTimerStart.difference(serverStartTime),
        startTime: localTimerStart,
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
  ///
  /// Cache-first — shows cached data immediately (no loading flash), then
  /// silently refreshes. Called on app startup from [main.dart].
  Future<void> loadCurrent({bool isMinimized = true}) async {
    try {
      final result = await _repository.getLiveSession();
      if (result.session != null) {
        // Auto-minimize when resuming from cold start so the user
        // isn't thrown into a full-screen workout unexpectedly.
        final serverStartTime = DateTime.parse(result.session!.startTime);
        final localTimerStart = DateTime.now();
        emit(WorkoutSessionState.active(
          session: result.session!,
          logs: result.logs,
          elapsed: localTimerStart.difference(serverStartTime),
          startTime: localTimerStart,
          isMinimized: isMinimized,
        ));
        _startTimer();
        developer.log(
          'loadCurrent | sessionId=${result.session!.id} '
          '| logCount=${result.logs.length} '
          '| serverStartTime=${result.session!.startTime}',
          name: 'workout',
        );

        // Silent background refresh to revalidate the live session
        _silentRefreshLiveSession(isMinimized: isMinimized);
      } else {
        emit(const WorkoutSessionState.initial());
        _silentRefreshLiveSession(isMinimized: isMinimized);
        developer.log('loadCurrent | no active session', name: 'workout');
      }
    } catch (e) {
      developer.log('loadCurrent failed: $e', name: 'workout');
      // Only emit error if we had no prior data
      if (state is WorkoutSessionInitial) {
        emit(const WorkoutSessionState.error('Failed to load session.'));
      }
    }
  }

  /// Silent background refresh of the live session state.
  Future<void> _silentRefreshLiveSession({bool isMinimized = true}) async {
    try {
      final result =
          await _repository.getLiveSession(forceRefresh: true);
      if (!isClosed && result.session != null) {
        if (result.session!.id !=
            (state is WorkoutSessionActive
                ? (state as WorkoutSessionActive).session.id
                : null)) {
          final serverStartTime =
              DateTime.parse(result.session!.startTime);
          final localTimerStart = DateTime.now();
          emit(WorkoutSessionState.active(
            session: result.session!,
            logs: result.logs,
            elapsed: localTimerStart.difference(serverStartTime),
            startTime: localTimerStart,
            isMinimized: isMinimized,
          ));
          _startTimer();
        }
      }
    } catch (e) {
      developer.log('_silentRefreshLiveSession failed: $e', name: 'workout');
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
        } catch (e) {
          developer.log('resolveConflict cancel failed: $e', name: 'workout');
        }
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

  /// Fetch session history (paginated).
  Future<SessionHistoryResponse> fetchHistory({int limit = 20, String? cursor}) =>
      _repository.getHistory(limit: limit, cursor: cursor);

  // ── Session Detail ──

  /// Fetch session details with exercise logs.
  Future<({WorkoutSessionDto? session, List<ExerciseLogDto> logs})> fetchSessionDetails(
    String sessionId,
  ) =>
      _repository.getSessionDetails(sessionId);

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
    } catch (e) {
      developer.log('startRest failed: $e', name: 'workout');
    }
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
    } catch (e) {
      developer.log('endRest failed: $e', name: 'workout');
    }
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
      