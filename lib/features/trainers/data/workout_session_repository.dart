import 'package:injectable/injectable.dart';

import 'models/exercise_dto.dart';
import 'models/exercise_log_dto.dart';
import 'models/workout_session_dto.dart';
import 'models/workout_session_response.dart';
import 'workout_session_api_service.dart';

@singleton
class WorkoutSessionRepository {
  final WorkoutSessionApiService _api;

  WorkoutSessionRepository(this._api);

  /// Start a new session and return it along with any pre-populated logs.
  Future<({WorkoutSessionDto session, List<ExerciseLogDto> logs})> startSession({
    String? clientId,
    String? plannedSessionId,
    String? templateId,
    String? clientPackageId,
  }) async {
    final response = await _api.startSession(
      clientId: clientId,
      plannedSessionId: plannedSessionId,
      templateId: templateId,
      clientPackageId: clientPackageId,
    );
    return (session: response.session, logs: response.exerciseLogs);
  }

  /// Returns the active session DTO along with its parsed exercise logs.
  Future<({WorkoutSessionDto? session, List<ExerciseLogDto> logs})>
      getLiveSession() async {
    final response = await _api.getLiveSession();
    return (session: response.session, logs: response.exerciseLogs);
  }

  Future<LogExerciseResponse> logExercise({
    String? logId,
    required String workoutSessionId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    return _api.logExercise(
      logId: logId,
      workoutSessionId: workoutSessionId,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
      order: order,
      supersetKey: supersetKey,
      orderInSuperset: orderInSuperset,
      isCompleted: isCompleted,
    );
  }

  /// Finish a workout session. Returns the updated session and its logs.
  Future<({WorkoutSessionDto session, List<ExerciseLogDto> logs})> finishSession({
    required String workoutSessionId,
    String? notes,
  }) async {
    final response = await _api.finishSession(
      workoutSessionId: workoutSessionId,
      notes: notes,
    );
    return (
      session: response.session!,
      logs: response.exerciseLogs,
    );
  }

  Future<SessionHistoryResponse> getHistory({
    String? clientId,
    int limit = 20,
    String? cursor,
  }) async {
    return _api.getHistory(
      clientId: clientId,
      limit: limit,
      cursor: cursor,
    );
  }

  /// Start rest timer on backend.
  Future<void> startRest(String sessionId) => _api.startRest(sessionId);

  /// End rest timer on backend.
  Future<void> endRest(String sessionId) => _api.endRest(sessionId);

  Future<List<ExerciseDto>> getExerciseLibrary() =>
      _api.getExerciseLibrary();

  /// Add exercises to an in-progress session. Returns the newly created logs.
  Future<List<ExerciseLogDto>> addExercises({
    required String sessionId,
    required List<String> exerciseIds,
  }) async {
    return _api.addExercises(
      sessionId: sessionId,
      exerciseIds: exerciseIds,
    );
  }
}
