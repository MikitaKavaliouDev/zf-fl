import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../data/models/workout_session_response.dart';
import '../data/workout_session_repository.dart';

/// Thin wrapper around [WorkoutSessionRepository] for Workout History.
///
/// Pagination and caching are managed by tanquery's
/// [InfiniteQueryBuilder]; this cubit only provides pass-through methods
/// so screens never reference [WorkoutSessionRepository] directly.
@injectable
class WorkoutHistoryCubit extends Cubit<WorkoutHistoryState> {
  final WorkoutSessionRepository _repository;
  final QueryClient _queryClient;

  WorkoutHistoryCubit(this._repository, this._queryClient)
      : super(const WorkoutHistoryState._());

  /// Fetch a page of workout history. [cursor] is null for the first page.
  Future<SessionHistoryResponse> fetchHistory({String? cursor}) async {
    return _repository.getHistory(cursor: cursor);
  }

  /// Delete a session (local-only; backend endpoint not yet available).
  void deleteSession(String sessionId) {
    _queryClient.invalidateQueries(queryKey: _historyKey);
  }

  QueryKey get _historyKey => QueryKey(['workouts', 'history']);
}

/// Minimal state — tanquery manages loading/error for queryFn results.
class WorkoutHistoryState {
  const WorkoutHistoryState._();
}
