import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_calendar_event_dto.dart';

part 'trainer_dashboard_state.freezed.dart';

@freezed
sealed class TrainerDashboardState with _$TrainerDashboardState {
  const factory TrainerDashboardState.initial() = TrainerDashboardInitial;

  const factory TrainerDashboardState.loading() = TrainerDashboardLoading;

  const factory TrainerDashboardState.loaded({
    required String greeting,
    required int activeClientsCount,
    required int pendingCheckIns,
    required int pendingBookings,
    required String revenue,
    required String revenueTrend,
    @Default([]) List<TrainerCalendarEventDto> upcomingSessions,
  }) = TrainerDashboardLoaded;

  const factory TrainerDashboardState.error(String message) =
      TrainerDashboardError;
}
