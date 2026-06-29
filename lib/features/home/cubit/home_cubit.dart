import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';
import 'package:ziro_fit/core/di/injection.dart';
import 'package:ziro_fit/core/events/event_bus.dart';

import '../data/home_data.dart';
import '../data/home_repository.dart';
import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';

/// Thin cubit — tanquery manages loading/error states via QueryBuilder.
///
/// Mutations (called from UI) remain here; reads go through tanquery.
@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  final QueryClient _queryClient;
  StreamSubscription<CheckInSubmittedEvent>? _checkInSub;
  Timer? _checkInDebounce;

  HomeCubit(this._repository, this._queryClient)
      : super(const HomeState._()) {
    // Debounce CheckInSubmittedEvent → invalidate tanquery cache
    _checkInSub =
        getIt<EventBus>().on<CheckInSubmittedEvent>().listen((_) {
      _checkInDebounce?.cancel();
      _checkInDebounce = Timer(const Duration(milliseconds: 500), () {
        _queryClient.invalidateQueries(queryKey: QueryKey(['home']));
      });
    });
  }

  /// Fetch dashboard data and active program in parallel.
  Future<HomeData> fetchDashboard() async {
    try {
      final results = await Future.wait([
        _repository.getDashboard(),
        _repository.getActiveProgram(),
      ]);

      return HomeData(
        dashboard: results[0] as ClientDashboardResponse,
        activeProgram: results[1] as ActiveProgramResponse?,
      );
    } catch (e) {
      developer.log('HomeCubit.fetchDashboard failed: $e', name: 'home');
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    _checkInDebounce?.cancel();
    await _checkInSub?.cancel();
    await super.close();
  }
}

/// Minimal placeholder state — tanquery manages loading/error.
class HomeState {
  const HomeState._();
}
