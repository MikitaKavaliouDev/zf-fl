import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
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

    Duration newRestElapsed = current.restElapsed;
    if (current.restStartedAt != null) {
      newRestElapsed = DateTime.now().difference(current.restStartedAt!);
    }

    emit(current.copyWith(
      elapsed: current.elapsed + const Duration(seconds: 1),
      restElapsed: newRestElapsed,
    ));
  }

  /// Start a new workout session.
  Future<void> start({
    String? clientId,
    String? plannedSessionId,
    String? templateId,
    String? clientPackageId,
  }) async {
    emit(const WorkoutSessionState.loading());
    try {
      final result = await _repository.startSession(
        clientId: clientId,
        plannedSessionId: plannedSessionId,
        templateId: templateId,
        clientPackageId: clientPackageId,
      );
      emit(WorkoutSessionState.active(
        session: result.session,
        logs: result.logs,
        elapsed: Duration.zero,
      ));
      _startTimer();
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to start session.'));
    }
  }

  /// Load the current live session if one exists.
  Future<void> loadCurrent() async {
    emit(const WorkoutSessionState.loading());
    try {
      final result = await _repository.getLiveSession();
      if (result.session != null) {
        emit(WorkoutSessionState.active(
          session: result.session!,
          logs: result.logs,
          elapsed: Duration.zero,
        ));
        _startTimer();
      } else {
        emit(const WorkoutSessionState.initial());
      }
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to load session.'));
    }
  }

  /// Fetch exercise library from backend (system + custom exercises).
  Future<List<ExerciseDto>> fetchExercises() =>
      _repository.getExerciseLibrary();

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
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to add exercises.'));
    }
  }

  /// Remove an exercise from the active session.
  Future<void> removeExercise(String exerciseId) async {
    // Backend removal not supported in MVP.
    // TODO: Call DELETE /api/workout-sessions/$sessionId/exercises/$exerciseId
    // when the backend endpoint is available.
  }

  /// Log an exercise set in the active session.
  /// Applies an optimistic local update immediately so the UI feels instant,
  /// then reconciles with the server response.
  Future<void> logSet({
    String? logId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;

    // Optimistic update: apply the new set immediately.
    final optimisticLog = ExerciseLogDto(
      id: logId ?? 'opt_${DateTime.now().microsecondsSinceEpoch}',
      clientId: current.session.clientId,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
      isCompleted: isCompleted ?? true,
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
        order: order,
        supersetKey: supersetKey,
        orderInSuperset: orderInSuperset,
        isCompleted: isCompleted ?? true,
      );
      // Use the LATEST active state (not `current`) to avoid overwriting
      // fields set after the optimistic emit (e.g. restStartedAt).
      final latest = state as WorkoutSessionActive;
      final reconciledLogs = [...latest.logs];
      // Replace the optimistic entry (temp ID) with the server-confirmed one.
      reconciledLogs.removeWhere((l) => l.id == optimisticLog.id);
      reconciledLogs.add(response.log);
      emit(latest.copyWith(logs: reconciledLogs));
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

  /// Finish the active session.
  Future<void> finish({String? notes}) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      _timer?.cancel();
      final result = await _repository.finishSession(
        workoutSessionId: current.session.id,
        notes: notes,
      );
      emit(WorkoutSessionState.completed(
        session: result.session,
        totalDuration: current.elapsed,
        logs: result.logs,
      ));
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to finish session.'));
    }
  }

  /// Start the rest timer.
  Future<void> startRest() async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(
      restStartedAt: DateTime.now(),
      restElapsed: Duration.zero,
    ));
    try {
      await _repository.startRest(current.session.id);
    } catch (_) {
      // Rest API call is optional — local timer runs independently.
    }
  }

  /// End the rest timer.
  Future<void> endRest() async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(
      restStartedAt: null,
      restElapsed: Duration.zero,
    ));
    try {
      await _repository.endRest(current.session.id);
    } catch (_) {}
  }

  /// Pause the timer.
  void pause() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    _timer?.cancel();
    emit(current.copyWith(isPaused: true));
  }

  /// Resume the timer.
  void resume() {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    emit(current.copyWith(isPaused: false));
    _startTimer();
  }
}
