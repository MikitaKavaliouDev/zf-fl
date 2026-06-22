import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/exercise_dto.dart';
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
    emit(current.copyWith(elapsed: current.elapsed + const Duration(seconds: 1)));
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
      final session = await _repository.startSession(
        clientId: clientId,
        plannedSessionId: plannedSessionId,
        templateId: templateId,
        clientPackageId: clientPackageId,
      );
      emit(WorkoutSessionState.active(session: session, elapsed: Duration.zero));
      _startTimer();
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to start session.'));
    }
  }

  /// Load the current live session if one exists.
  Future<void> loadCurrent() async {
    emit(const WorkoutSessionState.loading());
    try {
      final session = await _repository.getLiveSession();
      if (session != null) {
        emit(WorkoutSessionState.active(session: session, elapsed: Duration.zero));
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
  Future<void> addExercises(List<String> exerciseIds) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      await _repository.addExercises(
        sessionId: current.session.id,
        exerciseIds: exerciseIds,
      );
      // Reload to get the updated exercise log list.
      // Capture active state *before* loadCurrent() replaces it.
      final activeState = current;
      try {
        await loadCurrent();
      } catch (_) {
        // Reload failed — exercises were still added to backend.
        // Re-emit the previous active state so the UI doesn't drop to error.
        if (state is WorkoutSessionError) {
          emit(activeState);
        }
      }
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
      final updatedLogs = [...current.logs];
      final idx = updatedLogs.indexWhere((l) => l.id == response.log.id);
      if (idx >= 0) {
        updatedLogs[idx] = response.log;
      } else {
        updatedLogs.add(response.log);
      }
      emit(current.copyWith(logs: updatedLogs));
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to log set.'));
    }
  }

  /// Finish the active session.
  Future<void> finish({String? notes}) async {
    final current = state;
    if (current is! WorkoutSessionActive) return;
    try {
      _timer?.cancel();
      await _repository.finishSession(
        workoutSessionId: current.session.id,
        notes: notes,
      );
      emit(WorkoutSessionState.completed(
        session: current.session,
        totalDuration: current.elapsed,
      ));
    } catch (e) {
      emit(const WorkoutSessionState.error('Failed to finish session.'));
    }
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
