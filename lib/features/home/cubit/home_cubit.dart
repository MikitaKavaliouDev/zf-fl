import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/di/injection.dart';
import 'package:ziro_fit/core/events/event_bus.dart';

import '../data/home_repository.dart';
import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  StreamSubscription<CheckInSubmittedEvent>? _checkInSub;

  HomeCubit(this._repository) : super(const HomeState.initial()) {
    _checkInSub = getIt<EventBus>().on<CheckInSubmittedEvent>().listen((_) {
      refresh();
    });
  }

  /// Fetch dashboard data and active program in parallel.
  Future<void> fetchDashboard() async {
    emit(const HomeState.loading());
    try {
      final results = await Future.wait([
        _repository.getDashboard(),
        _repository.getActiveProgram(),
      ]);

      final dashboard = results[0] as ClientDashboardResponse;
      final activeProgram = results[1] as ActiveProgramResponse?;

      emit(HomeState.loaded(
        dashboard: dashboard,
        activeProgram: activeProgram,
      ));
    } catch (e) {
      developer.log('HomeCubit.fetchDashboard failed: $e', name: 'home');
      emit(const HomeState.error(
        'Failed to load dashboard. Please check your connection.',
      ));
    }
  }

  /// Refresh from current loaded state.
  Future<void> refresh() async {
    await fetchDashboard();
  }

  @override
  Future<void> close() async {
    await _checkInSub?.cancel();
    await super.close();
  }
}
