import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/workout_session_repository.dart';
import 'workout_history_state.dart';

@injectable
class WorkoutHistoryCubit extends Cubit<WorkoutHistoryState> {
  final WorkoutSessionRepository _repository;

  WorkoutHistoryCubit(this._repository) : super(const WorkoutHistoryState.initial());

  /// Fetch history, optionally resetting (replacing the list).
  Future<void> loadHistory({bool reset = true}) async {
    final current = state;
    if (current is WorkoutHistoryLoaded && !reset) {
      emit(current.copyWith(isLoadingMore: true));
    } else {
      emit(const WorkoutHistoryState.loading());
    }
    try {
      final response = await _repository.getHistory(
        cursor: !reset && current is WorkoutHistoryLoaded
            ? current.nextCursor
            : null,
      );
      if (reset) {
        emit(WorkoutHistoryState.loaded(
          sessions: response.sessions,
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
        ));
      } else if (current is WorkoutHistoryLoaded) {
        emit(WorkoutHistoryState.loaded(
          sessions: [...current.sessions, ...response.sessions],
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
        ));
      } else {
        emit(WorkoutHistoryState.loaded(
          sessions: response.sessions,
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
        ));
      }
    } catch (e) {
      emit(const WorkoutHistoryState.error('Failed to load history.'));
    }
  }

  /// Load the next page.
  Future<void> loadMore() async {
    final current = state;
    if (current is! WorkoutHistoryLoaded || !current.hasMore || current.isLoadingMore) return;
    await loadHistory(reset: false);
  }

  /// Pull-to-refresh.
  Future<void> refresh() async {
    final current = state;
    if (current is WorkoutHistoryLoaded) {
      emit(current.copyWith(isRefreshing: true));
    }
    try {
      final response = await _repository.getHistory();
      emit(WorkoutHistoryState.loaded(
        sessions: response.sessions,
        nextCursor: response.nextCursor,
        hasMore: response.hasMore,
      ));
    } catch (e) {
      emit(const WorkoutHistoryState.error('Failed to refresh history.'));
    }
  }

  /// Set a search query to filter sessions locally by name/notes/exercise.
  void setSearchQuery(String query) {
    final current = state;
    if (current is WorkoutHistoryLoaded) {
      emit(current.copyWith(searchQuery: query));
    }
  }

  /// Filter sessions to a specific date.
  void setSelectedDate(DateTime? date) {
    final current = state;
    if (current is WorkoutHistoryLoaded) {
      emit(current.copyWith(selectedDate: date));
    }
  }

  /// Clear the date filter.
  void clearSelectedDate() {
    setSelectedDate(null);
  }

  Future<void> deleteSession(String sessionId) async {
    // For now, just remove from the local list.
    // Backend delete endpoint for completed sessions is not available yet.
    final current = state;
    if (current is! WorkoutHistoryLoaded) return;
    emit(current.copyWith(
      sessions: current.sessions.where((s) => s.id != sessionId).toList(),
    ));
  }
}
