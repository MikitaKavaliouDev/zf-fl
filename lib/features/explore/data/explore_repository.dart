import 'package:injectable/injectable.dart';

import '../../trainers/data/models/trainer_list_item_dto.dart';
import 'models/event_detail_dto.dart';
import 'models/explore_metadata.dart';
import 'models/featured_content.dart';
import 'models/paginated_events.dart';
import 'explore_api_service.dart';

@singleton
class ExploreRepository {
  final ExploreApiService _api;

  ExploreRepository(this._api);

  Future<ExploreMetadata> getMetadata() => _api.getMetadata();

  Future<FeaturedContent> getFeaturedContent({
    String? cityId,
    double? lat,
    double? lng,
  }) =>
      _api.getFeaturedContent(cityId: cityId, lat: lat, lng: lng);

  Future<List<FeaturedTrainerDto>> getPromotedTrainers({String? category}) =>
      _api.getPromotedTrainers(category: category);

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
      );

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

  Future<EventDetailDto> getEventDetail(String id) =>
      _api.getEventDetail(id);

  Future<Map<String, dynamic>> joinFreeEvent(String id) =>
      _api.joinFreeEvent(id);

  Future<String> createCheckoutSession({
    required String type,
    required String id,
    bool isMobile = true,
  }) =>
      _api.createCheckoutSession(type: type, id: id, isMobile: isMobile);
}
