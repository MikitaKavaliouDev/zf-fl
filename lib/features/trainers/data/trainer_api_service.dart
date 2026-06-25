import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/promoted_trainer_dto.dart';
import 'models/trainer_detail_dto.dart';
import 'models/trainer_list_item_dto.dart';
import 'models/trainer_package_dto.dart';
import 'models/trainer_preview_media_dto.dart';
import 'models/trainer_schedule_dto.dart';

@injectable
class TrainerApiService {
  final Dio _dio;

  TrainerApiService(this._dio);

  // ── Promoted Trainers ──

  Future<List<PromotedTrainerDto>> getPromotedTrainers({
    String? category,
  }) async {
    final queryParams = <String, dynamic>{};
    if (category != null) queryParams['category'] = category;
    final response = await _dio.get(
      '/api/explore/promoted-trainers',
      queryParameters: queryParams,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final trainers = data['trainers'] as List<dynamic>;
    return trainers
        .map((e) =>
            PromotedTrainerDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Trainer List / Search ──

  Future<TrainerListResponse> getTrainers({
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
    if (query != null) queryParams['q'] = query;
    if (location != null) queryParams['location'] = location;
    if (lat != null) queryParams['lat'] = lat;
    if (lng != null) queryParams['lng'] = lng;
    if (sortBy != null) queryParams['sortBy'] = sortBy;
    if (specialties != null) queryParams['specialties'] = specialties;
    if (minRating != null) queryParams['minRating'] = minRating;
    if (trainingTypes != null) queryParams['trainingTypes'] = trainingTypes;

    final response = await _dio.get(
      '/api/trainers',
      queryParameters: queryParams,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerListResponse.fromJson(data);
  }

  // ── Aggregated Trainer Profile (single call for everything) ──

  Future<TrainerDetailDto> getTrainerDetail(String username) async {
    final response = await _dio.get('/api/trainers/$username');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerDetailDto.fromJson(data);
  }

  // ── Standalone Endpoints (as fallbacks) ──

  Future<List<TrainerPackageDto>> getTrainerPackages(String username) async {
    final response = await _dio.get('/api/trainers/$username/packages');
    final data = response.data['data'] as Map<String, dynamic>;
    final packages = data['packages'] as List<dynamic>;
    return packages
        .map((e) => TrainerPackageDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Preview media (images + videos) for the trainer profile carousel.
  /// [trainerId] can be a UUID or a username (backend handles lookup).
  Future<List<TrainerPreviewMediaDto>> getPreviewMedia(String trainerId) async {
    final response = await _dio.get('/api/trainer/preview/$trainerId');
    final data = response.data['data'] as Map<String, dynamic>;
    final media = data['media'] as List<dynamic>;
    return media
        .map((e) =>
            TrainerPreviewMediaDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<TrainerScheduleDto> getTrainerSchedule(String username) async {
    final response = await _dio.get('/api/trainers/$username/schedule');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerScheduleDto.fromJson(data);
  }

  // ── Link/Unlink ──

  Future<void> linkTrainer(String trainerUsername) async {
    await _dio.post(
      '/api/client/trainer/link',
      data: {'trainerUsername': trainerUsername},
    );
  }

  Future<void> unlinkTrainer() async {
    await _dio.delete('/api/client/trainer/link');
  }

  Future<bool> checkLinkStatus(String trainerUsername) async {
    final response = await _dio.get(
      '/api/client/trainer/link',
      queryParameters: {'trainerUsername': trainerUsername},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data['isLinked'] as bool;
  }

  // ── Stripe Checkout ──

  Future<String> createCheckoutSession({
    required String type,
    required String id,
    bool isMobile = true,
  }) async {
    final response = await _dio.post(
      '/api/checkout/session',
      data: {
        'type': type,
        if (type == 'PACKAGE_SALE') 'packageId': id,
        'isMobile': isMobile,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data['url'] as String;
  }
}
