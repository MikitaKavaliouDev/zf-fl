import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/trainer_list_item_dto.dart';
import '../data/explore_repository.dart';
import '../data/models/paginated_events.dart';
import 'trainer_discovery_state.dart';

@injectable
class TrainerDiscoveryCubit extends Cubit<TrainerDiscoveryState> {
  final ExploreRepository _repository;
  Timer? _debounce;

  TrainerDiscoveryCubit(this._repository)
      : super(const TrainerDiscoveryInitial());

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }

  void init({
    String? initialQuery,
    String? initialSpecialty,
    double? initialLat,
    double? initialLng,
    String? initialLocation,
  }) {
    load(
      query: initialQuery,
      specialty: initialSpecialty,
      lat: initialLat,
      lng: initialLng,
      location: initialLocation,
    );
  }

  Future<void> load({
    String? query,
    String? location,
    SortOption sortBy = SortOption.closest,
    String? specialty,
    double minRating = 0,
    double? lat,
    double? lng,
  }) async {
    emit(TrainerDiscoveryLoaded(
      discoveryType: DiscoveryType.all,
      searchQuery: query ?? '',
      location: location,
      sortBy: sortBy,
      specialty: specialty,
      minRating: minRating,
      hasActiveFilters: (location != null && location.isNotEmpty) ||
          specialty != null ||
          minRating > 0,
      trainers: [],
      events: [],
      trainerPage: 1,
      hasMoreTrainers: true,
      eventPage: 1,
      hasMoreEvents: true,
      loadingTrainers: true,
      loadingEvents: true,
    ));

    try {
      final results = await Future.wait([
        _searchTrainers(query: query, sortBy: sortBy, specialty: specialty,
            minRating: minRating, lat: lat, lng: lng),
        _repository.getEvents(
          limit: 20,
          search: query,
          lat: lat,
          lon: lng,
        ),
      ]);

      final trainerListResponse = results[0] as TrainerListResponse;
      final eventsResult = results[1] as PaginatedEvents;

      emit(TrainerDiscoveryLoaded(
        discoveryType: DiscoveryType.all,
        searchQuery: query ?? '',
        location: location,
        sortBy: sortBy,
        specialty: specialty,
        minRating: minRating,
        hasActiveFilters: (location != null && location.isNotEmpty) ||
            specialty != null ||
            minRating > 0,
        trainers: trainerListResponse.trainers,
        events: eventsResult.events,
        trainerPage: 1,
        hasMoreTrainers: trainerListResponse.trainers.length >= 15,
        eventPage: 1,
        hasMoreEvents: eventsResult.hasMore,
        loadingTrainers: false,
        loadingEvents: false,
      ));
    } catch (e) {
      emit(TrainerDiscoveryError(
        'Failed to load results. Please check your connection.',
      ));
    }
  }

  /// Search trainers via GET /api/trainers with filters.
  Future<TrainerListResponse> _searchTrainers({
    String? query,
    String? location,
    SortOption sortBy = SortOption.closest,
    String? specialty,
    double minRating = 0,
    double? lat,
    double? lng,
    int page = 1,
  }) {
    return _repository.searchTrainers(
      query: query,
      location: location,
      lat: lat,
      lng: lng,
      sortBy: sortBy.apiKey,
      specialties: specialty,
      minRating: minRating > 0 ? minRating : null,
    );
  }

  /// Load next page of trainers (infinite scroll).
  Future<void> loadMoreTrainers() async {
    final current = state;
    if (current is! TrainerDiscoveryLoaded) return;
    if (current.loadingTrainers || !current.hasMoreTrainers) return;

    final nextPage = current.trainerPage + 1;
    emit(current.copyWith(loadingTrainers: true));

    try {
      final response = await _searchTrainers(
        query: current.searchQuery.isEmpty ? null : current.searchQuery,
        location: current.location,
        sortBy: current.sortBy,
        specialty: current.specialty,
        minRating: current.minRating,
        page: nextPage,
      );

      emit(current.copyWith(
        trainers: [...current.trainers, ...response.trainers],
        trainerPage: nextPage,
        hasMoreTrainers: response.trainers.length >= 15,
        loadingTrainers: false,
      ));
    } catch (e) {
      developer.log('loadMoreTrainers failed: $e', name: 'trainer_discovery');
      emit(current.copyWith(loadingTrainers: false));
    }
  }

  /// Load next page of events (infinite scroll).
  Future<void> loadMoreEvents() async {
    final current = state;
    if (current is! TrainerDiscoveryLoaded) return;
    if (current.loadingEvents || !current.hasMoreEvents) return;

    final nextPage = current.eventPage + 1;
    emit(current.copyWith(loadingEvents: true));

    try {
      final result = await _repository.getEvents(
        page: nextPage,
        limit: 20,
        search: current.searchQuery.isEmpty ? null : current.searchQuery,
      );

      emit(current.copyWith(
        events: [...current.events, ...result.events],
        eventPage: nextPage,
        hasMoreEvents: result.hasMore,
        loadingEvents: false,
      ));
    } catch (e) {
      developer.log('loadMoreEvents failed: $e', name: 'trainer_discovery');
      emit(current.copyWith(loadingEvents: false));
    }
  }

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final current = state;
      if (current is TrainerDiscoveryLoaded) {
        load(
          query: query.isEmpty ? null : query,
          location: current.location,
          sortBy: current.sortBy,
          specialty: current.specialty,
          minRating: current.minRating,
        );
      } else {
        load(query: query.isEmpty ? null : query);
      }
    });
  }

  void setDiscoveryType(DiscoveryType type) {
    final current = state;
    if (current is TrainerDiscoveryLoaded) {
      emit(current.copyWith(discoveryType: type));
    }
  }

  void applyFilters({
    String? location,
    SortOption? sortBy,
    String? specialty,
    double? minRating,
  }) {
    final current = state;
    if (current is! TrainerDiscoveryLoaded) return;

    load(
      query: current.searchQuery.isEmpty ? null : current.searchQuery,
      location: location ?? current.location,
      sortBy: sortBy ?? current.sortBy,
      specialty: specialty ?? current.specialty,
      minRating: minRating ?? current.minRating,
    );
  }

  void clearFilters() {
    final current = state;
    if (current is! TrainerDiscoveryLoaded) return;
    load(query: current.searchQuery.isEmpty ? null : current.searchQuery);
  }

  Future<void> refresh() async {
    final current = state;
    if (current is TrainerDiscoveryLoaded) {
      await load(
        query: current.searchQuery.isEmpty ? null : current.searchQuery,
        location: current.location,
        sortBy: current.sortBy,
        specialty: current.specialty,
        minRating: current.minRating,
      );
    }
  }
}
