import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_calendar_event_dto.dart';

part 'trainer_calendar_state.freezed.dart';

/// View mode for the calendar screen.
enum CalendarViewMode { agenda, day, month }

@freezed
sealed class TrainerCalendarState with _$TrainerCalendarState {
  const factory TrainerCalendarState.initial() = TrainerCalendarInitial;

  const factory TrainerCalendarState.loading() = TrainerCalendarLoading;

  const factory TrainerCalendarState.loaded({
    required DateTime focusedDate,
    @Default(CalendarViewMode.agenda) CalendarViewMode viewMode,
    @Default([]) List<TrainerCalendarEventDto> events,
  }) = TrainerCalendarLoaded;

  const factory TrainerCalendarState.error(String message) =
      TrainerCalendarError;
}
