import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_list_item_dto.dart';
import '../data/models/trainer_preview_media_dto.dart';
import '../data/models/trainer_schedule_dto.dart';
import 'trainer_api_service.dart';

@singleton
class TrainerRepository {
  final TrainerApiService _api;
  final ResponseCache _cache;

  TrainerRepository(this._api, this._cache);

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

  /// Fetch trainer detail — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<TrainerDetailDto> getTrainerDetail(
    String username, {
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'trainer:detail:$username';

    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<TrainerDetailDto>(
        cacheKey,
        TrainerDetailDto.fromJson,
      );
      if (cached != null) {
        return cached;
      }
    }
    // 3. No cache — await the network call
    return _refreshTrainerDetail(username, cacheKey);
  }

  /// Internal: fetch from API and persist to cache.
  Future<TrainerDetailDto> _refreshTrainerDetail(
    String username,
    String cacheKey,
  ) async {
    final response = await _api.getTrainerDetail(username);
    await _cache.set(cacheKey, response.toJson());
    return response;
  }

  /// Invalidate cached trainer detail(s).
  ///
  /// If [username] is provided, only that specific trainer's cache is
  /// cleared. If null, all trainer detail caches are cleared.
  Future<void> invalidateCache([String? username]) async {
    if (username != null) {
      await _cache.remove('trainer:detail:$username');
    }
    // If username is null, we could clear all trainer detail caches,
    // but there's no wildcard delete in ResponseCache. For now this
    // is a no-op for null; callers always provide a specific username.
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
