import 'package:injectable/injectable.dart';

import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_list_item_dto.dart';
import '../data/models/trainer_package_dto.dart';
import 'trainer_api_service.dart';

@singleton
class TrainerRepository {
  final TrainerApiService _api;

  TrainerRepository(this._api);

  Future<List<TrainerListItemDto>> getTrainers({
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
    final response = await _api.getTrainers(
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
    return response.trainers;
  }

  Future<int> getTotalTrainerCount({
    int pageSize = 15,
    String? query,
    String? location,
  }) async {
    final response = await _api.getTrainers(
      pageSize: pageSize,
      query: query,
      location: location,
    );
    return response.totalTrainers;
  }

  Future<TrainerDetailDto> getTrainerDetail(String username) async {
    return _api.getTrainerDetail(username);
  }

  Future<List<TrainerPackageDto>> getTrainerPackages(String username) async {
    return _api.getTrainerPackages(username);
  }

  Future<void> linkTrainer(String trainerUsername) async {
    await _api.linkTrainer(trainerUsername);
  }
}
