import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../data/models/privacy_settings_dto.dart';
import '../data/profile_api_service.dart';
import 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  final ProfileApiService _apiService;
  final AuthCubit _authCubit;
  final ResponseCache _cache;

  MoreCubit(this._apiService, this._authCubit, this._cache)
      : super(const MoreState.initial());

  static const _privacyCacheKey = 'profile:privacy';

  /// Load user data and privacy settings.
  ///
  /// Cache-first for privacy settings — if cached data exists, emits loaded
  /// immediately without a loading flash, then silently refreshes.
  ///
  /// Privacy settings are a client-only feature. When the authenticated
  /// user is a trainer, the API call is skipped entirely — the state
  /// loads immediately without privacy data.
  Future<void> loadUserData({bool forceRefresh = false}) async {
    // Get user from AuthCubit's current state
    final authState = _authCubit.state;
    final user = authState is AuthAuthenticated ? authState.user : null;
    final isTrainer = authState is AuthAuthenticated && authState.isTrainer;

    // Skip privacy API call entirely for trainers — it's a client-only endpoint.
    if (isTrainer) {
      emit(MoreState.loaded(user: user));
      return;
    }

    // 1. Check cache first (unless forced refresh)
    if (!forceRefresh) {
      final cached = await _cache.get<PrivacySettingsDto>(
        _privacyCacheKey,
        PrivacySettingsDto.fromJson,
      );
      if (cached != null) {
        emit(MoreState.loaded(user: user, privacy: cached));
        // 2. Silent background refresh
        try {
          final fresh = await _apiService.getPrivacySettings();
          await _cache.set(_privacyCacheKey, fresh.toJson());
          if (!isClosed) {
            emit(MoreState.loaded(user: user, privacy: fresh));
          }
        } catch (_) {
          // Non-critical — cached data is already showing
        }
        return;
      }
    }

    // 3. No cache — show loading and await the network call
    emit(const MoreState.loading());
    try {
      PrivacySettingsDto? privacy;
      try {
        privacy = await _apiService.getPrivacySettings();
        await _cache.set(_privacyCacheKey, privacy.toJson());
      } catch (e) {
        developer.log('Failed to load privacy settings: $e', name: 'more');
        // Non-critical — continue without privacy data
      }
      emit(MoreState.loaded(user: user, privacy: privacy));
    } catch (e) {
      developer.log('MoreCubit.loadUserData failed: $e', name: 'more');
      emit(const MoreState.error(
          'Failed to load profile. Please check your connection.'));
    }
  }

  /// Sign out via AuthCubit.
  Future<void> signOut() async {
    await _authCubit.logout();
  }

  /// Pull-to-refresh — reload user data.
  Future<void> refresh() async {
    await loadUserData(forceRefresh: true);
  }

  /// Load privacy settings from the backend.
  /// Returns the [PrivacySettingsDto] or rethrows on error.
  Future<PrivacySettingsDto> loadPrivacySettings() async {
    return await _apiService.getPrivacySettings();
  }

  /// Update privacy settings on the backend.
  Future<void> updatePrivacySettings(Map<String, dynamic> updates) async {
    await _apiService.updatePrivacySettings(updates);
  }
}
