import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'check_in_api_service.dart';
import 'models/check_in_config_dto.dart';
import 'models/check_in_detail_dto.dart';
import 'models/check_in_history_item_dto.dart';
import 'models/check_in_response_dto.dart';
import 'models/check_in_submission_dto.dart';
import 'models/upload_response_dto.dart';

@singleton
class CheckInRepository {
  final CheckInApiService _api;
  final ResponseCache _cache;

  CheckInRepository(this._api, this._cache);

  static const _historyCacheKey = 'checkin:history';
  static const _detailCachePrefix = 'checkin:detail:';

  Future<CheckInConfigDto> getConfig() => _api.getConfig();

  Future<CheckInResponseDto> submitCheckIn(
    CheckInSubmissionDto submission,
  ) =>
      _api.submitCheckIn(submission);

  /// Fetch check-in history — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<List<CheckInHistoryItemDto>> getHistory({bool forceRefresh = false}) async {
    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<Map<String, dynamic>>(
        _historyCacheKey,
        (map) => map,
      );
      if (cached != null) {
        final items = (cached['items'] as List)
            .map((e) =>
                CheckInHistoryItemDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return items;
      }
    }
    // 3. No cache — await the network call
    return _refreshHistory();
  }

  /// Internal: fetch history from API and persist to cache.
  Future<List<CheckInHistoryItemDto>> _refreshHistory() async {
    final response = await _api.getHistory();
    final jsonList = response.map((e) => e.toJson()).toList();
    await _cache.set(_historyCacheKey, {'items': jsonList});
    return response;
  }

  /// Fetch check-in detail — cache-first with background refresh.
  ///
  /// Returns cached data immediately (if available) while triggering a
  /// silent background refresh. When [forceRefresh] is true, bypasses
  /// the cache and awaits the network call directly.
  Future<CheckInDetailDto> getDetail(
    String id, {
    bool forceRefresh = false,
  }) async {
    final cacheKey = '$_detailCachePrefix$id';

    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<CheckInDetailDto>(
        cacheKey,
        CheckInDetailDto.fromJson,
      );
      if (cached != null) {
        return cached;
      }
    }
    // 3. No cache — await the network call
    return _refreshDetail(id, cacheKey);
  }

  /// Internal: fetch detail from API and persist to cache.
  Future<CheckInDetailDto> _refreshDetail(String id, String cacheKey) async {
    final response = await _api.getDetail(id);
    await _cache.set(cacheKey, response.toJson());
    return response;
  }

  /// Invalidate cached check-in data — call after mutations.
  ///
  /// If [detailId] is provided, that specific detail key is also cleared
  /// along with the history key. If null, only the history key is cleared.
  Future<void> invalidateCache({String? detailId}) async {
    await _cache.remove(_historyCacheKey);
    if (detailId != null) {
      await _cache.remove('$_detailCachePrefix$detailId');
    }
  }

  Future<UploadResponseDto> uploadPhoto(String filePath) =>
      _api.uploadPhoto(filePath);
}
