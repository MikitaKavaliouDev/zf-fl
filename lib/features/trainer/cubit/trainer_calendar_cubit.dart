import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/create_session_request_dto.dart';
import '../data/models/session_creation_data_dto.dart';
import '../data/models/update_session_request_dto.dart';
import '../data/trainer_calendar_api_service.dart';
import 'trainer_calendar_state.dart';

@injectable
class TrainerCalendarCubit extends Cubit<TrainerCalendarState> {
  final TrainerCalendarApiService _api;

  TrainerCalendarCubit(this._api)
      : super(const TrainerCalendarState.initial());

  Future<void> loadEvents({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    emit(const TrainerCalendarState.loading());
    try {
      final events = await _api.getCalendarEvents(startDate: startDate, endDate: endDate);
      emit(TrainerCalendarState.loaded(
        focusedDate: startDate,
        events: events,
      ));
    } catch (e) {
      developer.log('Calendar load failed: $e', name: 'trainer');
      emit(TrainerCalendarState.error(e.toString()));
    }
  }

  void setViewMode(CalendarViewMode mode) {
    final current = state;
    if (current is TrainerCalendarLoaded) {
      emit(current.copyWith(viewMode: mode));
    }
  }

  void setFocusedDate(DateTime date) {
    final current = state;
    if (current is TrainerCalendarLoaded) {
      emit(current.copyWith(focusedDate: date));
    }
  }

  Future<void> createSession(CreateSessionRequestDto request) async {
    try {
      await _api.createSession(request);
      // Reload current month
      if (state is TrainerCalendarLoaded) {
        final loaded = state as TrainerCalendarLoaded;
        final start = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month);
        final end = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month + 1, 0);
        await loadEvents(startDate: start, endDate: end);
      }
    } catch (e) {
      developer.log('Create session failed: $e', name: 'trainer');
    }
  }

  Future<void> updateSession(
    String id,
    UpdateSessionRequestDto request,
  ) async {
    try {
      await _api.updateSession(id, request);
      if (state is TrainerCalendarLoaded) {
        final loaded = state as TrainerCalendarLoaded;
        final start = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month);
        final end = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month + 1, 0);
        await loadEvents(startDate: start, endDate: end);
      }
    } catch (e) {
      developer.log('Update session failed: $e', name: 'trainer');
    }
  }

  Future<SessionCreationDataDto> getSessionCreationData() async {
    return _api.getSessionCreationData();
  }

  Future<void> deleteSession(String id) async {
    try {
      await _api.deleteSession(id);
      if (state is TrainerCalendarLoaded) {
        final loaded = state as TrainerCalendarLoaded;
        final start = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month);
        final end = DateTime(loaded.focusedDate.year,
            loaded.focusedDate.month + 1, 0);
        await loadEvents(startDate: start, endDate: end);
      }
    } catch (e) {
      developer.log('Delete session failed: $e', name: 'trainer');
    }
  }
}
