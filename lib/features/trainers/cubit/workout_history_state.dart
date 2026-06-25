import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/workout_session_dto.dart';

part 'workout_history_state.freezed.dart';

@freezed
sealed class WorkoutHistoryState with _$WorkoutHistoryState {
  const factory WorkoutHistoryState.initial() = WorkoutHistoryInitial;
  const factory WorkoutHistoryState.loading() = WorkoutHistoryLoading;
  const factory WorkoutHistoryState.loaded({
    required List<WorkoutSessionDto> sessions,
    String? nextCursor,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default('') String searchQuery,
    DateTime? selectedDate,
  }) = WorkoutHistoryLoaded;
  const factory WorkoutHistoryState.error(String message) = WorkoutHistoryError;
}
