import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';
import 'package:ziro_fit/core/di/injection.dart';
import 'package:ziro_fit/core/events/event_bus.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../data/home_data.dart';
import '../data/home_repository.dart';
import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';
import '../data/models/client_profile_data.dart';

/// Thin cubit — tanquery manages loading/error states via QueryBuilder.
///
/// Mutations (called from UI) remain here; reads go through tanquery.
///
/// The dashboard queryFn is cache-first — [ResponseCache] provides instant
/// data on cold start (survives tanquery's in-memory loss). After the
/// initial render, a one-shot silent refresh fetches fresh data from the
/// API and updates the tanquery cache via [QueryClient.setQueryData].
@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  final QueryClient _queryClient;
  final AuthCubit _authCubit;
  StreamSubscription<CheckInSubmittedEvent>? _checkInSub;
  Timer? _checkInDebounce;
  bool _initialRefreshDone = false;

  HomeCubit(this._repository, this._queryClient, this._authCubit)
      : super(const HomeState._()) {
    // Debounce CheckInSubmittedEvent → invalidate tanquery cache
    _checkInSub =
        getIt<EventBus>().on<CheckInSubmittedEvent>().listen((_) {
      _checkInDebounce?.cancel();
      _checkInDebounce = Timer(const Duration(milliseconds: 500), () {
        _queryClient.invalidateQueries(queryKey: QueryKey(['home']));
        _repository.invalidateCache();
      });
    });
  }

  /// Fetch dashboard data and active program in parallel.
  ///
  /// This is the tanquery queryFn. It returns cached data immediately,
  /// then fires a one-shot background refresh to revalidate.
  ///
  /// When the authenticated user is a trainer, returns empty/default data
  /// without making any client API calls.
  Future<HomeData> fetchDashboard() async {
    // Skip client API calls when auth hasn't resolved yet (cold start)
    // or when the user is a trainer (router redirect may not have fired yet).
    final authState = _authCubit.state;
    if (authState is! AuthAuthenticated || authState.isTrainer) {
      return HomeData(
        dashboard: ClientDashboardResponse(
          clientData: ClientProfileData(
            id: '',
            userId: '',
            name: '',
            email: '',
          ),
          weightUnit: 'KG',
          upcomingClientSessions: const [],
        ),
      );
    }

    try {
      final results = await Future.wait([
        _repository.getDashboard(),
        _repository.getActiveProgram(),
      ]);

      final data = HomeData(
        dashboard: results[0] as ClientDashboardResponse,
        activeProgram: results[1] as ActiveProgramResponse?,
      );

      // One-shot silent refresh on first call (cold start)
      if (!_initialRefreshDone) {
        _initialRefreshDone = true;
        unawaited(_silentRefreshDashboard());
      }

      return data;
    } catch (e) {
      developer.log('HomeCubit.fetchDashboard failed: $e', name: 'home');
      rethrow;
    }
  }

  /// Silent background refresh of dashboard data.
  ///
  /// Fetches fresh data from the API and updates the tanquery cache
  /// so the UI re-renders silently without any loading indicator.
  Future<void> _silentRefreshDashboard() async {
    try {
      final results = await Future.wait([
        _repository.getDashboard(forceRefresh: true),
        _repository.getActiveProgram(forceRefresh: true),
      ]);

      final freshData = HomeData(
        dashboard: results[0] as ClientDashboardResponse,
        activeProgram: results[1] as ActiveProgramResponse?,
      );

      if (!isClosed) {
        _queryClient.setQueryData(QueryKey(['home']), freshData);
      }
    } catch (e) {
      developer.log('HomeCubit._silentRefreshDashboard failed: $e',
          name: 'home');
    }
  }

  /// Invalidate both tanquery and ResponseCache for dashboard data.
  ///
  /// Call before pull-to-refresh so the queryFn fetches from the API
  /// instead of returning stale ResponseCache data.
  Future<void> invalidateResponseCache() async {
    await _repository.invalidateCache();
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
