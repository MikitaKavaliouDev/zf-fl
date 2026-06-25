import 'package:injectable/injectable.dart';

import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_list_item_dto.dart';
import '../data/models/trainer_preview_media_dto.dart';
import '../data/models/trainer_schedule_dto.dart';
import 'trainer_api_service.dart';

@singleton
class TrainerRepository {
  final TrainerApiService _api;

  TrainerRepository(this._api);

  // ── Trainer List ──

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

  // ── Aggregated Profile ──
  // Uses the single aggregated endpoint that returns everything.

  Future<TrainerDetailDto> getTrainerDetail(String username) async {
    return _api.getTrainerDetail(username);
  }

  // ── Schedule (on-demand) ──

  Future<TrainerScheduleDto> getTrainerSchedule(String username) async {
    return _api.getTrainerSchedule(username);
  }

  // ── Preview Media (images + videos) ──

  Future<List<TrainerPreviewMediaDto>> getPreviewMedia(
      String trainerId) async {
    return _api.getPreviewMedia(trainerId);
  }

  // ── Link Management ──

  Future<void> linkTrainer(String trainerUsername) async {
    await _api.linkTrainer(trainerUsername);
  }

  Future<void> unlinkTrainer() async {
    await _api.unlinkTrainer();
  }

  Future<bool> checkLinkStatus(String trainerUsername) async {
    return _api.checkLinkStatus(trainerUsername);
  }

  // ── Stripe Checkout ──

  Future<String> createCheckoutSession({
    required String type,
    required String id,
  }) async {
    return _api.createCheckoutSession(type: type, id: id);
  }
}
