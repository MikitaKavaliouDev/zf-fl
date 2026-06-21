import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/promoted_trainer_dto.dart';
import 'models/trainer_detail_dto.dart';
import 'models/trainer_list_item_dto.dart';
import 'models/trainer_package_dto.dart';

@injectable
class TrainerApiService {
  final Dio _dio;

  TrainerApiService(this._dio);

  Future<List<PromotedTrainerDto>> getPromotedTrainers({
    String? category,
  }) async {
    final response = await _dio.get(
      '/api/explore/promoted-trainers',
      queryParameters: {
        'category': ?category,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final trainers = data['trainers'] as List<dynamic>;
    return trainers
        .map((e) =>
            PromotedTrainerDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

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
    final response = await _dio.get(
      '/api/trainers',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'q': ?query,
        'location': ?location,
        'lat': ?lat,
        'lng': ?lng,
        'sortBy': ?sortBy,
        'specialties': ?specialties,
        'minRating': ?minRating,
        'trainingTypes': ?trainingTypes,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerListResponse.fromJson(data);
  }

  Future<TrainerDetailDto> getTrainerDetail(String username) async {
    final response = await _dio.get('/api/trainers/$username');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerDetailDto.fromJson(data);
  }

  Future<List<TrainerPackageDto>> getTrainerPackages(String username) async {
    final response = await _dio.get('/api/trainers/$username/packages');
    final data = response.data['data'] as Map<String, dynamic>;
    final packages = data['packages'] as List<dynamic>;
    return packages
        .map((e) => TrainerPackageDto.fromJson(e as Map<String, dynamic>))
          .toList();
  }

  Future<void> linkTrainer(String trainerUsername) async {
    await _dio.post(
      '/api/client/trainer/link',
      data: {'trainerUsername': trainerUsername},
    );
  }
}
