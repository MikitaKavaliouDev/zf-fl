import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:ziro_fit/core/location/location_service.dart';
import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';
import 'package:ziro_fit/features/explore/data/explore_api_service.dart';
import 'package:ziro_fit/features/explore/data/explore_map_local_service.dart';
import 'package:ziro_fit/features/explore/data/models/explore_event_dto.dart';
import 'package:ziro_fit/features/explore/data/models/paginated_events.dart';

/// Manages map state: trainers + events loading, clustering, filtering, search.
///
/// Ported from iOS [TrainerMapViewModel] which loads trainers and events
/// in parallel via `withThrowingTaskGroup` and clusters based on zoom level.
@injectable
class ExploreMapCubit extends Cubit<ExploreMapState> {
  final ExploreApiService _apiService;
  final LocationService _locationService;
  final ExploreMapLocalService _localService;

  int _trainerPage = 1;
  int _eventPage = 1;

  /// Keeps the effective filter mode across state resets.
  /// Prevents the race condition where [load] emits [ExploreMapLoading]
  /// and loses the filter mode that was set before the call.
  MapFilterMode _currentFilterMode = MapFilterMode.all;

  /// Keeps the current search query across state resets.
  String? _searchQuery;

  ExploreMapCubit(
    this._apiService,
    this._locationService,
    this._localService,
  ) : super(const ExploreMapState.initial());

  /// Load trainers and events in parallel (like iOS withThrowingTaskGroup).
  ///
  /// When [reset] is true, resets pagination and emits [ExploreMapLoading].
  /// The search query and filter mode are read from private fields to avoid
  /// losing them during the async gap after emitting [ExploreMapLoading].
  ///
  /// Cache-first behavior (unless [forceRefresh] is true):
  ///   1. Try Drift cache → if hit, emit [ExploreMapLoaded] immediately
  ///   2. Always fetch fresh data from the network in the background
  ///   3. On network success → write to cache + emit updated state
  ///   4. On network failure + had cached data → keep showing cached silently
  Future<void> load({bool reset = true, bool forceRefresh = false}) async {
    bool hasCachedData = false;

    if (reset) {
      _trainerPage = 1;
      _eventPage = 1;

      // Step 1: Serve cached data immediately unless force-refreshing.
      if (!forceRefresh) {
        hasCachedData = await _tryLoadFromCache();
      }

      // Step 2: Show spinner only when there's no cached data to show.
      if (!hasCachedData) {
        emit(const ExploreMapState.loading());
      }
    }

    // Step 3: Always fetch from network in the background.
    try {
      final loc = await _locationService.getCurrentLocation();
      final userLat = loc?.latitude;
      final userLng = loc?.longitude;

      // Load trainers and events in parallel (like iOS withThrowingTaskGroup).
      final results = await Future.wait([
        _apiService.searchTrainers(
          page: _trainerPage,
          pageSize: 30,
          lat: userLat,
          lng: userLng,
          query: _searchQuery,
          specialties:
              _currentFilterMode == MapFilterMode.yoga ? 'Yoga' : null,
        ),
        _apiService.getEvents(
          page: _eventPage,
          limit: 30,
          lat: userLat,
          lon: userLng,
          search: _searchQuery,
        ),
      ]);

      final trainerResponse = results[0] as TrainerListResponse;
      final eventResponse = results[1] as PaginatedEvents;

      // Apply filter mode to the response data.
      //   all     → show both
      //   trainers → show trainers only
      //   events  → show events only
      //   yoga   → show trainers filtered by yoga specialty (server-side)
      final showTrainers = _currentFilterMode != MapFilterMode.events;
      final showEvents = _currentFilterMode == MapFilterMode.all ||
          _currentFilterMode == MapFilterMode.events;

      final trainers =
          showTrainers ? trainerResponse.trainers : <TrainerListItemDto>[];
      final events =
          showEvents ? eventResponse.events : <ExploreEventDto>[];

      // Build clusters at default zoom 11.
      final clusters = _buildClusters(trainers, events, 11.0);

      // Step 4: Write fresh data to Drift cache (fire-and-forget).
      unawaited(_cacheResults(trainers, events, userLat, userLng));

      emit(ExploreMapState.loaded(
        trainers: trainers,
        events: events,
        clusters: clusters,
        filterMode: _currentFilterMode,
        searchQuery: _searchQuery,
        hasMoreTrainers:
            trainerResponse.currentPage < trainerResponse.totalPages,
        hasMoreEvents: eventResponse.hasMore,
        userLat: userLat,
        userLng: userLng,
      ));
    } catch (e) {
      // Step 5: Only show error if we had no cached data to fall back on.
      if (!hasCachedData) {
        emit(ExploreMapState.error(e.toString()));
      }
      // If cached data was shown, silently keep it — the next load()
      // attempt (e.g. pull-to-refresh) will try again.
    }
  }

  /// Try to emit [ExploreMapLoaded] from Drift cached data.
  ///
  /// Returns `true` if cached data was found and emitted, `false` otherwise.
  Future<bool> _tryLoadFromCache() async {
    try {
      final cachedTrainers = await _localService.cachedTrainers();
      final cachedEvents = await _localService.cachedEvents();
      final cachedLoc = await _localService.cachedLocation();

      if (cachedTrainers == null || cachedEvents == null) return false;

      // Rebuild clusters from cached data at default zoom 11.
      final clusters = _buildClusters(cachedTrainers, cachedEvents, 11.0);

      emit(ExploreMapState.loaded(
        trainers: cachedTrainers,
        events: cachedEvents,
        clusters: clusters,
        filterMode: _currentFilterMode,
        searchQuery: _searchQuery,
        // We don't know pagination from cache, so assume no more pages.
        hasMoreTrainers: false,
        hasMoreEvents: false,
        userLat: cachedLoc?.lat,
        userLng: cachedLoc?.lng,
      ));

      return true;
    } catch (e) {
      // Cache read/parse failure is non-fatal — fall through to network.
      return false;
    }
  }

  /// Persist fresh data to Drift cache (fire-and-forget).
  Future<void> _cacheResults(
    List<TrainerListItemDto> trainers,
    List<ExploreEventDto> events,
    double? userLat,
    double? userLng,
  ) async {
    try {
      await _localService.cacheTrainers(trainers);
      await _localService.cacheEvents(events);
      if (userLat != null && userLng != null) {
        await _localService.cacheLocation(userLat, userLng);
      }
    } catch (_) {
      // Cache write failure is non-fatal.
    }
  }

  /// Load next pages of trainers and events (infinite scroll on map).
  Future<void> loadMore() async {
    final current = state;
    if (current is! ExploreMapLoaded || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    _trainerPage++;
    _eventPage++;

    try {
      final loc = await _locationService.getCurrentLocation();
      final results = await Future.wait([
        _apiService.searchTrainers(
          page: _trainerPage,
          pageSize: 30,
          lat: loc?.latitude,
          lng: loc?.longitude,
          query: _searchQuery,
        ),
        _apiService.getEvents(
          page: _eventPage,
          limit: 30,
          lat: loc?.latitude,
          lon: loc?.longitude,
          search: _searchQuery,
        ),
      ]);

      final trainerResponse = results[0] as TrainerListResponse;
      final eventResponse = results[1] as PaginatedEvents;

      final allTrainers = [...current.trainers, ...trainerResponse.trainers];
      final allEvents = [...current.events, ...eventResponse.events];
      final clusters =
          _buildClusters(allTrainers, allEvents, current.zoomLevel);

      emit(current.copyWith(
        trainers: allTrainers,
        events: allEvents,
        clusters: clusters,
        hasMoreTrainers:
            trainerResponse.currentPage < trainerResponse.totalPages,
        hasMoreEvents: eventResponse.hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(current.copyWith(isLoadingMore: false));
    }
  }

  /// Change filter mode.
  ///
  /// Switching to/from [MapFilterMode.yoga] requires a server reload
  /// because yoga filtering uses the `specialties` API param. All other
  /// transitions are applied locally by filtering the already-loaded data.
  void setFilter(MapFilterMode mode) {
    final current = state;
    if (current is! ExploreMapLoaded) return;

    _currentFilterMode = mode;

    // Yoga mode requires a server reload (specialty filter).
    // The private [_currentFilterMode] is already updated above so [load]
    // will use the correct filter when emitting the new state.
    // Force-refresh because cached data is never yoga-filtered.
    if (mode == MapFilterMode.yoga || current.filterMode == MapFilterMode.yoga) {
      load(reset: true, forceRefresh: true);
      return;
    }

    // All other modes: filter locally.
    final showTrainers = mode != MapFilterMode.events;
    final showEvents =
        mode == MapFilterMode.all || mode == MapFilterMode.events;

    final filteredTrainers =
        showTrainers ? current.trainers : <TrainerListItemDto>[];
    final filteredEvents =
        showEvents ? current.events : <ExploreEventDto>[];
    final clusters =
        _buildClusters(filteredTrainers, filteredEvents, current.zoomLevel);

    emit(current.copyWith(
      filterMode: mode,
      clusters: clusters,
      selectedClusterId: null,
      selectedTrainer: null,
      selectedEvent: null,
    ));
  }

  /// Recalculate clusters when zoom level changes.
  void setZoomLevel(double zoom) {
    final current = state;
    if (current is! ExploreMapLoaded) return;

    final showTrainers = current.filterMode != MapFilterMode.events;
    final showEvents = current.filterMode == MapFilterMode.all ||
        current.filterMode == MapFilterMode.events;
    final filteredTrainers =
        showTrainers ? current.trainers : <TrainerListItemDto>[];
    final filteredEvents =
        showEvents ? current.events : <ExploreEventDto>[];
    final clusters = _buildClusters(filteredTrainers, filteredEvents, zoom);

    emit(current.copyWith(clusters: clusters, zoomLevel: zoom));
  }

  /// Set search query and reload from backend with the query param.
  ///
  /// Always force-refreshes because cached data has no search query applied.
  void search(String query) {
    _searchQuery = query.isEmpty ? null : query;
    load(reset: true, forceRefresh: true);
  }

  /// Select a cluster by its ID (shows cluster detail popup).
  void selectCluster(String? clusterId) {
    final current = state;
    if (current is! ExploreMapLoaded) return;
    emit(current.copyWith(
      selectedClusterId: clusterId,
      selectedTrainer: null,
      selectedEvent: null,
    ));
  }

  /// Select a trainer for detail preview.
  void selectTrainer(TrainerListItemDto trainer) {
    final current = state;
    if (current is! ExploreMapLoaded) return;
    emit(current.copyWith(
      selectedTrainer: trainer,
      selectedEvent: null,
      selectedClusterId: null,
    ));
  }

  /// Select an event for detail preview.
  void selectEvent(ExploreEventDto event) {
    final current = state;
    if (current is! ExploreMapLoaded) return;
    emit(current.copyWith(
      selectedEvent: event,
      selectedTrainer: null,
      selectedClusterId: null,
    ));
  }

  /// Clear all selections.
  void clearSelection() {
    final current = state;
    if (current is! ExploreMapLoaded) return;
    emit(current.copyWith(
      selectedClusterId: null,
      selectedTrainer: null,
      selectedEvent: null,
    ));
  }

  // ---------------------------------------------------------------------------
  // Clustering (ported from iOS calculateClusters() in TrainerMapView.swift)
  // ---------------------------------------------------------------------------

  /// Build clusters using dynamic epsilon based on zoom level.
  ///
  /// iOS uses `max(0.0001, zoomFactor / 15.0)` in degrees.
  /// At zoom 11 (latitudeDelta ≈ 0.1), epsilon ≈ 0.0067° ≈ 740 m.
  /// Convert to meters: 1° ≈ 111 320 m at equator.
  /// Formula: `max(30, min(10000, 200000 / 2^zoom))`.
  List<MapCluster> _buildClusters(
    List<TrainerListItemDto> trainers,
    List<ExploreEventDto> events,
    double zoom,
  ) {
    final epsilonMeters = _calculateClusterRadius(zoom);
    final items = <MapItem>[];
    final clusters = <MapCluster>[];

    // Collect all items with valid coordinates.
    for (final trainer in trainers) {
      final loc = _getTrainerLocation(trainer);
      if (loc != null) {
        items.add(MapItem.trainer(trainer));
      }
    }

    for (final event in events) {
      if (event.latitude != 0 || event.longitude != 0) {
        items.add(MapItem.event(event));
      }
    }

    // Greedy cluster assignment: first item creates a cluster, subsequent
    // items join the first cluster within epsilonMeters.
    for (final item in items) {
      final coord = _getItemCoordinate(item);
      if (coord == null) continue;

      final existingIndex = clusters.indexWhere((cluster) {
        final distance = const latlong.Distance().distance(
          latlong.LatLng(cluster.latitude, cluster.longitude),
          coord,
        );
        return distance < epsilonMeters;
      });

      if (existingIndex >= 0) {
        final existing = clusters[existingIndex];
        clusters[existingIndex] = MapCluster(
          id: existing.id,
          latitude: existing.latitude,
          longitude: existing.longitude,
          items: [...existing.items, item],
        );
      } else {
        final stableId =
            'cluster_${coord.latitude.toStringAsFixed(4)}_${coord.longitude.toStringAsFixed(4)}';
        clusters.add(MapCluster(
          id: stableId,
          latitude: coord.latitude,
          longitude: coord.longitude,
          items: [item],
        ));
      }
    }

    return clusters;
  }

  /// Dynamic cluster radius based on zoom level.
  ///
  /// Matches iOS behavior:
  ///   zoom 11 → ~740 m    (latitudeDelta ≈ 0.1)
  ///   zoom 15 → ~45 m
  ///   zoom  8 → ~6000 m
  double _calculateClusterRadius(double zoom) {
    return (200000 / (1 << zoom.toInt())).clamp(30, 10000).toDouble();
  }

  /// Extract the first valid location from a trainer's profile.
  latlong.LatLng? _getTrainerLocation(TrainerListItemDto trainer) {
    final locations = trainer.profile?.locations;
    if (locations == null || locations.isEmpty) return null;
    final loc = locations.first;
    if (loc.latitude == null || loc.longitude == null) return null;
    return latlong.LatLng(loc.latitude!, loc.longitude!);
  }

  /// Extract coordinate from a [MapItem] regardless of its variant.
  latlong.LatLng? _getItemCoordinate(MapItem item) {
    return item.when(
      trainer: (trainer) => _getTrainerLocation(trainer),
      event: (event) {
        if (event.latitude == 0 && event.longitude == 0) return null;
        return latlong.LatLng(event.latitude, event.longitude);
      },
    );
  }
}
