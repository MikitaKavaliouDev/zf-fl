import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/explore_api_service.dart';
import '../data/models/explore_metadata.dart';
import '../data/models/featured_content.dart';
import '../data/models/paginated_events.dart';

/// Thin wrapper around [ExploreApiService] for the main Explore screen.
///
/// UI state is managed by tanquery's [QueryBuilder]; this cubit only
/// provides pass-through methods so screens never reference
/// [ExploreApiService] directly.
@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final ExploreApiService _api;

  ExploreCubit(this._api) : super(ExploreState.initial);

  /// GET /api/explore/metadata — cities and categories.
  Future<ExploreMetadata> getMetadata() => _api.getMetadata();

  /// GET /api/explore/featured — featured content (trainers + events).
  Future<FeaturedContent> getFeaturedContent({
    String? cityId,
    double? lat,
    double? lng,
  }) =>
      _api.getFeaturedContent(cityId: cityId, lat: lat, lng: lng);

  /// GET /api/explore/promoted-trainers — promoted trainers.
  Future<List<FeaturedTrainerDto>> getPromotedTrainers({
    String? category,
  }) =>
      _api.getPromotedTrainers(category: category);

  /// GET /api/events — paginated events.
  Future<PaginatedEvents> getEvents({
    int page = 1,
    int limit = 12,
    double? lat,
    double? lon,
    String? search,
    String? category,
    bool? isFree,
    String sortBy = 'date_asc',
  }) =>
      _api.getEvents(
        page: page,
        limit: limit,
        lat: lat,
        lon: lon,
        search: search,
        category: category,
        isFree: isFree,
        sortBy: sortBy,
      );
}

/// Minimal state — tanquery manages loading/error for queryFn results.
class ExploreState {
  const ExploreState._();
  static const initial = ExploreState._();
}
