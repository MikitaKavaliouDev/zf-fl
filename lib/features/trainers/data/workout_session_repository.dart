import 'package:injectable/injectable.dart';

import 'models/exercise_dto.dart';
import 'models/exercise_log_dto.dart';
import 'models/template_dto.dart';
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
    int? rpe,
    String? tempo,
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
      rpe: rpe,
      tempo: tempo,
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
    bool? completeUnfinished,
  }) async {
    final response = await _api.finishSession(
      workoutSessionId: workoutSessionId,
      notes: notes,
      completeUnfinished: completeUnfinished,
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

  /// Cancel a workout session.
  Future<void> cancelSession(String sessionId) =>
      _api.cancelSession(workoutSessionId: sessionId);

  /// Remove an exercise from the active session.
  Future<void> removeExercise({
    required String sessionId,
    required String exerciseId,
  }) =>
      _api.removeExercise(sessionId: sessionId, exerciseId: exerciseId);

  /// Get full session details with exercise logs.
  Future<({WorkoutSessionDto? session, List<ExerciseLogDto> logs})> getSessionDetails(
    String sessionId,
  ) async {
    final response = await _api.getSessionDetails(sessionId);
    return (session: response.session, logs: response.exerciseLogs);
  }

  Future<List<TemplateDto>> getTemplates() => _api.getTemplates();

  Future<TemplateDto> getTemplate(String templateId) =>
      _api.getTemplate(templateId);

  Future<void> saveSessionAsTemplate({
    required String sessionId,
    required String templateName,
  }) =>
      _api.saveSessionAsTemplate(
        sessionId: sessionId,
        templateName: templateName,
      );
}
