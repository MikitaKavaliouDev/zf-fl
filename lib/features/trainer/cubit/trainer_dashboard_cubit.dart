import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/trainer_calendar_event_dto.dart';
import '../data/trainer_calendar_api_service.dart';
import '../data/trainer_checkin_api_service.dart';
import '../data/trainer_dashboard_api_service.dart';
import 'trainer_dashboard_state.dart';

@injectable
class TrainerDashboardCubit extends Cubit<TrainerDashboardState> {
  final TrainerDashboardApiService _api;
  final TrainerCalendarApiService _calendarApi;
  final TrainerCheckInApiService _checkInApi;

  TrainerDashboardCubit(
    this._api,
    this._calendarApi,
    this._checkInApi,
  ) : super(const TrainerDashboardState.initial());

  /// Fetch dashboard data by aggregating from available endpoints.
  Future<void> loadDashboard() async {
    emit(const TrainerDashboardState.loading());
    try {
      // Load stats from available endpoints in parallel
      final results = await Future.wait([
        _api.getSessionCreationData(), // clients + templates
        _checkInApi.getCheckIns(status: 'PENDING'),
        _calendarApi.getCalendarEvents(
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 7)),
        ),
      ]);

      final creationData = results[0] as Map<String, dynamic>;
      final checkInList = results[1] as List<dynamic>;
      final calendarEventList = results[2] as List<TrainerCalendarEventDto>;

      final now = DateTime.now();
      final hour = now.hour;
      final greeting = hour < 12
          ? 'Good morning'
          : hour < 17
              ? 'Good afternoon'
              : 'Good evening';

      final clients = creationData['clients'] as List<dynamic>? ?? [];
      final pendingCheckIns = checkInList.length;

      emit(TrainerDashboardState.loaded(
        greeting: greeting,
        activeClientsCount: clients.length,
        pendingCheckIns: pendingCheckIns,
        pendingBookings: 0,
        revenue: '0',
        revenueTrend: '',
        upcomingSessions: calendarEventList,
      ));
    } catch (e) {
      developer.log('Dashboard load failed: $e', name: 'trainer');
      emit(TrainerDashboardState.error(e.toString()));
    }
  }

  /// Pull-to-refresh: re-fetch dashboard data.
  Future<void> refresh() async {
    emit(const TrainerDashboardState.loading());
    await loadDashboard();
  }
}
