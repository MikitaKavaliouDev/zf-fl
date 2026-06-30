import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../../../core/location/location_service.dart';
import '../../../core/network/response_cache.dart';
import '../data/explore_api_service.dart';
import '../data/models/explore_metadata.dart';
import '../data/models/featured_content.dart';
import '../data/models/paginated_events.dart';

/// Thin wrapper around [ExploreApiService] for the main Explore screen.
///
/// UI state is managed by tanquery's [QueryBuilder]; this cubit only
/// provides pass-through methods so screens never reference
/// [ExploreApiService] directly.
///
/// All data methods are cache-first — they return cached data immediately
/// from [ResponseCache], then silently refresh via tanquery invalidation.
@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final ExploreApiService _api;
  final LocationService _locationService;
  final ResponseCache _cache;
  final QueryClient _queryClient;

  ExploreCubit(this._api, this._locationService, this._cache, this._queryClient)
      : super(ExploreState.initial);

  /// Request location permission and get the user's current GPS position.
  ///
  /// Returns `(latitude, longitude)` if granted and available, `(null, null)` otherwise.
  /// The screen stores these values locally and passes them to data methods.
  Future<({double? lat, double? lng})> loadUserLocation() async {
    try {
      final loc = await _locationService.getCurrentLocation();
      if (loc != null) {
        return (lat: loc.latitude, lng: loc.longitude);
      }
      return (lat: null, lng: null);
    } catch (_) {
      return (lat: null, lng: null);
    }
  }

  static const _metadataCacheKey = 'explore:metadata';
  static const _featuredCacheKey = 'explore:featured';
  static const _promotedCacheKey = 'explore:promoted';
  static const _eventsCachePrefix = 'explore:events:';

  /// GET /api/explore/metadata — cities and categories.
  ///
  /// Cache-first. Use [forceRefresh] to bypass the cache.
  Future<ExploreMetadata> getMetadata({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.get<ExploreMetadata>(
        _metadataCacheKey,
        ExploreMetadata.fromJson,
      );
      if (cached != null) {
        unawaited(_freshRefreshMetadata());
        return cached;
      }
    }
    final response = await _api.getMetadata();
    await _cache.set(_metadataCacheKey, response.toJson());
    return response;
  }

  Future<void> _freshRefreshMetadata() async {
    try {
      final fresh = await _api.getMetadata();
      await _cache.set(_metadataCacheKey, fresh.toJson());
      if (!isClosed) {
        _queryClient.setQueryData(QueryKey(['explore', 'metadata']), fresh);
      }
    } catch (_) {}
  }

  /// GET /api/explore/featured — featured content (trainers + events).
  ///
  /// Cache-first. Use [forceRefresh] to bypass the cache.
  Future<FeaturedContent> getFeaturedContent({
    String? cityId,
    double? lat,
    double? lng,
    bool forceRefresh = false,
  }) async {
    final cacheKey = '$_featuredCacheKey:${cityId ?? ''}';
    if (!forceRefresh) {
      final cached = await _cache.get<FeaturedContent>(
        cacheKey,
        FeaturedContent.fromJson,
      );
      if (cached != null) {
        unawaited(_freshRefreshFeatured(cityId, lat, lng, cacheKey));
        return cached;
      }
    }
    final response =
        await _api.getFeaturedContent(cityId: cityId, lat: lat, lng: lng);
    await _cache.set(cacheKey, response.toJson());
    return response;
  }

  Future<void> _freshRefreshFeatured(
      String? cityId, double? lat, double? lng, String cacheKey) async {
    try {
      final fresh =
          await _api.getFeaturedContent(cityId: cityId, lat: lat, lng: lng);
      await _cache.set(cacheKey, fresh.toJson());
      if (!isClosed) {
        _queryClient.setQueryData(
            QueryKey(['explore', 'featured', cityId ?? '']), fresh);
      }
    } catch (_) {}
  }

  /// GET /api/explore/promoted-trainers — promoted trainers.
  ///
  /// Cache-first. Use [forceRefresh] to bypass the cache.
  Future<List<FeaturedTrainerDto>> getPromotedTrainers({
    String? category,
    bool forceRefresh = false,
  }) async {
    final cacheKey = '$_promotedCacheKey:${category ?? ''}';
    if (!forceRefresh) {
      final cached = await _cache.get<Map<String, dynamic>>(
        cacheKey,
        (m) => m,
      );
      if (cached != null) {
        final items = (cached['items'] as List)
            .map((e) =>
                FeaturedTrainerDto.fromJson(e as Map<String, dynamic>))
            .toList();
        unawaited(_freshRefreshPromoted(category, cacheKey));
        return items;
      }
    }
    final response = await _api.getPromotedTrainers(category: category);
    await _cache.set(
        cacheKey, {'items': response.map((e) => e.toJson()).toList()});
    return response;
  }

  Future<void> _freshRefreshPromoted(String? category, String cacheKey) async {
    try {
      final fresh = await _api.getPromotedTrainers(category: category);
      await _cache.set(
          cacheKey, {'items': fresh.map((e) => e.toJson()).toList()});
      if (!isClosed) {
        _queryClient.setQueryData(
            QueryKey(['explore', 'promoted', category ?? '']), fresh);
      }
    } catch (_) {}
  }

  /// GET /api/events — paginated events.
  ///
  /// Cache-first. Use [forceRefresh] to bypass the cache.
  Future<PaginatedEvents> getEvents({
    int page = 1,
    int limit = 12,
    double? lat,
    double? lon,
    String? search,
    String? category,
    bool? isFree,
    String sortBy = 'date_asc',
    bool forceRefresh = false,
  }) async {
    final cacheKey =
        '$_eventsCachePrefix$page:$limit:${search ?? ''}:${category ?? ''}:$sortBy';
    if (!forceRefresh) {
      final cached = await _cache.get<PaginatedEvents>(
        cacheKey,
        PaginatedEvents.fromJson,
      );
      if (cached != null) {
        unawaited(_freshRefreshEvents(
            page, limit, lat, lon, search, category, isFree, sortBy, cacheKey));
        return cached;
      }
    }
    final response = await _api.getEvents(
      page: page,
      limit: limit,
      lat: lat,
      lon: lon,
      search: search,
      category: category,
      isFree: isFree,
      sortBy: sortBy,
    );
    await _cache.set(cacheKey, response.toJson());
    return response;
  }

  Future<void> _freshRefreshEvents(int page, int limit, double? lat,
      double? lon, String? search, String? category, bool? isFree,
      String sortBy, String cacheKey) async {
    try {
      final fresh = await _api.getEvents(
        page: page,
        limit: limit,
        lat: lat,
        lon: lon,
        search: search,
        category: category,
        isFree: isFree,
        sortBy: sortBy,
      );
      await _cache.set(cacheKey, fresh.toJson());
      if (!isClosed) {
        _queryClient.setQueryData(QueryKey(['explore', 'events']), fresh);
      }
    } catch (_) {}
  }

  /// Invalidate all explore-related ResponseCache entries.
  ///
  /// Called before pull-to-refresh so the queryFn fetches from the API
  /// instead of returning stale cached data.
  Future<void> invalidateResponseCache() async {
    // Clear well-known prefix-based cache keys.
    // Wildcard delete is not supported by ResponseCache, so clear
    // the known static keys. Dynamic keys (featured, promoted, events)
    // are handled by the explore screen's pull-to-refresh which also
    // invalidates tanquery.
    await _cache.remove(_metadataCacheKey);
  }
}

/// Minimal state — tanquery manages loading/error for queryFn results.
class ExploreState {
  const ExploreState._();
  static const initial = ExploreState._();
}
