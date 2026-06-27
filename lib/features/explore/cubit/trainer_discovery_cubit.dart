import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import '../data/explore_api_service.dart';
import '../data/models/paginated_events.dart';

/// Thin wrapper around [ExploreApiService] for the Trainer Discovery screen.
///
/// UI state is managed by tanquery's [InfiniteQueryBuilder]; this cubit only
/// provides pass-through methods so screens never reference
/// [ExploreApiService] directly.
@injectable
class TrainerDiscoveryCubit extends Cubit<TrainerDiscoveryState> {
  final ExploreApiService _api;

  TrainerDiscoveryCubit(this._api) : super(TrainerDiscoveryState.initial);

  /// GET /api/trainers — search/paginated trainer discovery.
  Future<TrainerListResponse> searchTrainers({
    int page = 1,
    int pageSize = 15,
    String? query,
    String? location,
    double? lat,
    double? lng,
    String? sortBy,
    String? specialties,
    double? minRating,
    String? trainingTypes,
  }) =>
      _api.searchTrainers(
        page: page,
        pageSize: pageSize,
        query: query,
        location: location,
        lat: lat,
        lng: lng,
        sortBy: sortBy,
        specialties: specialties,
        minRating: minRating,
        trainingTypes: trainingTypes,
      );

  /// GET /api/events — paginated events.
  Future<PaginatedEvents> getEvents({
    int page = 1,
    int limit = 20,
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
class TrainerDiscoveryState {
  const TrainerDiscoveryState._();
  static const initial = TrainerDiscoveryState._();
}
