import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import 'models/event_detail_dto.dart';
import 'models/explore_metadata.dart';
import 'models/featured_content.dart';
import 'models/paginated_events.dart';

@injectable
class ExploreApiService {
  final Dio _dio;

  ExploreApiService(this._dio);

  /// GET /api/explore/metadata — cities and categories.
  Future<ExploreMetadata> getMetadata() async {
    final response = await _dio.get('/api/explore/metadata');
    final data = response.data['data'] as Map<String, dynamic>;
    return ExploreMetadata.fromJson(data);
  }

  /// GET /api/explore/featured — featured events and trainers.
  Future<FeaturedContent> getFeaturedContent({
    String? cityId,
    double? lat,
    double? lng,
    double? radius,
  }) async {
    final response = await _dio.get(
      '/api/explore/featured',
      queryParameters: {
        'cityId': cityId,
        'lat': lat,
        'lng': lng,
        'radius': radius,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return FeaturedContent.fromJson(data);
  }

  /// GET /api/explore/promoted-trainers — manually promoted trainers.
  Future<List<FeaturedTrainerDto>> getPromotedTrainers({
    String? category,
  }) async {
    final response = await _dio.get(
      '/api/explore/promoted-trainers',
      queryParameters: {'category': category},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final trainers = data['trainers'] as List<dynamic>;
    return trainers
        .map((e) => FeaturedTrainerDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

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
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
    };
    if (query != null && query.isNotEmpty) queryParams['q'] = query;
    if (location != null && location.isNotEmpty) queryParams['location'] = location;
    if (lat != null) queryParams['lat'] = lat;
    if (lng != null) queryParams['lng'] = lng;
    if (sortBy != null) queryParams['sortBy'] = sortBy;
    if (specialties != null && specialties.isNotEmpty) queryParams['specialties'] = specialties;
    if (minRating != null) queryParams['minRating'] = minRating;
    if (trainingTypes != null && trainingTypes.isNotEmpty) queryParams['trainingTypes'] = trainingTypes;

    final response = await _dio.get('/api/trainers', queryParameters: queryParams);
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerListResponse.fromJson(data);
  }

  /// GET /api/events — paginated events list.
  Future<PaginatedEvents> getEvents({
    int page = 1,
    int limit = 12,
    double? lat,
    double? lon,
    String? search,
    String? category,
    bool? isFree,
    String sortBy = 'date_asc',
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      'sortBy': sortBy,
    };
    if (lat != null) queryParams['lat'] = lat;
    if (lon != null) queryParams['lon'] = lon;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (category != null && category.isNotEmpty && category != 'all') {
      queryParams['category'] = category;
    }
    if (isFree != null) queryParams['isFree'] = isFree.toString();

    final response = await _dio.get('/api/events', queryParameters: queryParams);
    final rawData = response.data['data'] as Map<String, dynamic>;
    // Backend nests pagination under {events, pagination: {page, limit, hasMore}}.
    // Flatten to match PaginatedEvents model which expects page/limit/hasMore at top level.
    final Map<String, dynamic> data = Map<String, dynamic>.from(rawData);
    if (data.containsKey('pagination') && data['pagination'] is Map) {
      final pagination = Map<String, dynamic>.from(data['pagination'] as Map);
      data.remove('pagination');
      data.addAll(pagination);
    }
    return PaginatedEvents.fromJson(data);
  }

  /// GET /api/events/{id} — single event detail.
  Future<EventDetailDto> getEventDetail(String id) async {
    final response = await _dio.get('/api/events/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    final event = data['event'] as Map<String, dynamic>;
    return EventDetailDto.fromJson(event);
  }

  /// POST /api/events/{id}/join — join a free event.
  Future<Map<String, dynamic>> joinFreeEvent(String id) async {
    final response = await _dio.post('/api/events/$id/join');
    final data = response.data['data'] as Map<String, dynamic>;
    return data;
  }

  /// POST /api/checkout/session — Stripe checkout for paid events.
  Future<String> createCheckoutSession({
    required String type,
    required String id,
    bool isMobile = true,
  }) async {
    final response = await _dio.post(
      '/api/checkout/session',
      data: {
        'type': type,
        if (type == 'EVENT_TICKET') 'eventId': id else 'packageId': id,
        'isMobile': isMobile,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data['url'] as String;
  }
}
