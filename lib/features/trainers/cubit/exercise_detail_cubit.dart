import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/exercise_dto.dart';
import '../data/workout_session_repository.dart';
import '../data/models/workout_session_response.dart';
import 'exercise_detail_state.dart';

@injectable
class ExerciseDetailCubit extends Cubit<ExerciseDetailState> {
  final WorkoutSessionRepository _repository;

  ExerciseDetailCubit(this._repository)
      : super(const ExerciseDetailState.initial());

  /// Load exercise detail data from the backend in parallel:
  /// 1. Exercise library (to get the exercise metadata for About tab)
  /// 2. Session history (for History tab)
  /// 3. Exercise stats for e1RM, volume, bestSetVolume (for Charts & Records tabs)
  ///
  /// Stats failures are handled gracefully — if a stats endpoint returns 500,
  /// the exercise detail still loads with empty history.
  Future<void> loadExerciseDetail(String exerciseId) async {
    emit(const ExerciseDetailState.loading());
    try {
      // Required fetches — exercise library + session history must succeed.
      final results = await Future.wait([
        _repository.getExerciseLibrary(),
        _repository.getHistory(limit: 100),
      ]);

      final library = results[0] as List<ExerciseDto>;
      final historyResponse = results[1] as SessionHistoryResponse;

      final exercise = library.cast<ExerciseDto?>().firstWhere(
            (e) => e?.id == exerciseId,
            orElse: () => null,
          );

      if (exercise == null) {
        emit(const ExerciseDetailState.error(
          'Exercise not found in library.',
        ));
        return;
      }

      // Best-effort stats fetches — individual failures are logged but don't
      // block the loaded state. Each falls back to an empty list.
      final e1rmHistory = await _safeFetchStats(
        exerciseId,
        'e1rm',
      );
      final volumeHistory = await _safeFetchStats(
        exerciseId,
        'volume',
      );
      final bestSetVolumeHistory = await _safeFetchStats(
        exerciseId,
        'bestSetVolume',
      );

      emit(ExerciseDetailState.loaded(
        exercise: exercise,
        sessions: historyResponse.sessions,
        e1rmHistory: e1rmHistory,
        volumeHistory: volumeHistory,
        bestSetVolumeHistory: bestSetVolumeHistory,
      ));

      developer.log(
        'loadExerciseDetail | exercise=${exercise.name}($exerciseId) '
        '| sessions=${historyResponse.sessions.length} '
        '| e1rmPoints=${e1rmHistory.length} '
        '| volumePoints=${volumeHistory.length}',
        name: 'exercise-detail',
      );
    } catch (e) {
      developer.log(
        'loadExerciseDetail failed: $e',
        name: 'exercise-detail',
      );
      emit(const ExerciseDetailState.error(
        'Failed to load exercise details.',
      ));
    }
  }

  /// Fetch exercise stats for a metric, returning an empty list on failure.
  Future<List<ExerciseStatPoint>> _safeFetchStats(
    String exerciseId,
    String metric,
  ) async {
    try {
      final data = await _repository.getExerciseStats(
        exerciseId: exerciseId,
        metric: metric,
      );
      final history = data['history'] as List<dynamic>? ?? [];
      return history.map((h) {
        final map = h as Map<String, dynamic>;
        return ExerciseStatPoint(
          date: DateTime.parse(map['date'] as String),
          value: (map['value'] as num).toDouble(),
        );
      }).toList();
    } catch (e) {
      developer.log(
        '_safeFetchStats | exerciseId=$exerciseId metric=$metric failed: $e',
        name: 'exercise-detail',
      );
      return [];
    }
  }

}
