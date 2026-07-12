import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/storefront_requests.dart';
import '../data/models/stripe_status_dto.dart';
import '../data/storefront_local_service.dart';
import '../data/trainer_storefront_api_service.dart';
import 'storefront_state.dart';

@injectable
class StorefrontCubit extends Cubit<StorefrontState> {
  final TrainerStorefrontApiService _apiService;
  final StorefrontLocalService _localService;

  StorefrontCubit(this._apiService, this._localService)
      : super(const StorefrontState.initial());

  // ──────────────────────────────────────────────────────────────
  // Public API
  // ──────────────────────────────────────────────────────────────

  /// Cache-first load: show cached data instantly, then refresh from API.
  /// On pull-to-refresh ([forceRefresh]) skip the cache and hit the API
  /// directly.
  Future<void> load({bool forceRefresh = false}) async {
    if (forceRefresh) {
      emit(const StorefrontState.loading());
      await _refreshFromApi();
      return;
    }

    // 1. Serve cached data immediately (offline-first)
    final cachedProfile = await _localService.cachedProfile();
    final cachedStripe = await _localService.cachedStripeStatus();
    if (cachedProfile != null) {
      emit(StorefrontState.loaded(
        profile: cachedProfile,
        stripeStatus: cachedStripe,
      ));
    } else {
      emit(const StorefrontState.loading());
    }

    // 2. Refresh from API in background
    await _refreshFromApi(fallbackToCache: cachedProfile == null);
  }

  /// Force-refresh from API (pull-to-refresh / retry).
  Future<void> refresh() => load(forceRefresh: true);

  // ──────────────────────────────────────────────────────────────
  // Mutations — call API, then re-fetch from API + update cache
  // ──────────────────────────────────────────────────────────────

  /// Update core profile info (name, username, specialties, certifications).
  Future<void> updateCoreInfo({
    required String name,
    required String username,
    String? certifications,
    List<String> specialties = const [],
  }) async {
    try {
      await _apiService.updateCoreInfo(
        UpdateCoreInfoRequest(
          name: name,
          username: username,
          certifications: certifications,
          specialties: specialties,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.updateCoreInfo failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to update profile.'));
    }
  }

  /// Update a single text content field (aboutMe, philosophy, methodology).
  Future<void> updateTextContent({
    required String fieldName,
    required String content,
  }) async {
    try {
      await _apiService.updateTextContent(
        TextContentRequest(fieldName: fieldName, content: content),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.updateTextContent failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to update text content.'));
    }
  }

  /// Create a new package.
  Future<void> createPackage({
    required String name,
    String? description,
    required double price,
    required int numberOfSessions,
  }) async {
    try {
      await _apiService.createPackage(
        PackageRequest(
          name: name,
          description: description,
          price: price,
          numberOfSessions: numberOfSessions,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.createPackage failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to create package.'));
    }
  }

  /// Update an existing package.
  Future<void> updatePackage({
    required String id,
    required String name,
    String? description,
    required double price,
    required int numberOfSessions,
  }) async {
    try {
      await _apiService.updatePackage(
        id,
        PackageRequest(
          name: name,
          description: description,
          price: price,
          numberOfSessions: numberOfSessions,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.updatePackage failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to update package.'));
    }
  }

  /// Delete a package by ID.
  Future<void> deletePackage(String id) async {
    try {
      await _apiService.deletePackage(id);
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.deletePackage failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to delete package.'));
    }
  }

  /// Create a new service.
  Future<void> createService({
    required String title,
    String? description,
    double? price,
    String? currency,
    int? duration,
  }) async {
    try {
      await _apiService.createService(
        ServiceRequest(
          title: title,
          description: description,
          price: price,
          currency: currency,
          duration: duration,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.createService failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to create service.'));
    }
  }

  /// Update an existing service.
  Future<void> updateService({
    required String id,
    required String title,
    String? description,
    double? price,
    String? currency,
    int? duration,
  }) async {
    try {
      await _apiService.updateService(
        id,
        ServiceRequest(
          title: title,
          description: description,
          price: price,
          currency: currency,
          duration: duration,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.updateService failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to update service.'));
    }
  }

  /// Delete a service by ID.
  Future<void> deleteService(String id) async {
    try {
      await _apiService.deleteService(id);
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.deleteService failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to delete service.'));
    }
  }

  /// Create a new social link.
  Future<void> createSocialLink({
    required String platform,
    required String username,
    required String profileUrl,
  }) async {
    try {
      await _apiService.createSocialLink(
        SocialLinkRequest(
          platform: platform,
          username: username,
          profileUrl: profileUrl,
        ),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.createSocialLink failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to create social link.'));
    }
  }

  /// Delete a social link by ID.
  Future<void> deleteSocialLink(String id) async {
    try {
      await _apiService.deleteSocialLink(id);
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.deleteSocialLink failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to delete social link.'));
    }
  }

  /// Create a new external link.
  Future<void> createExternalLink({
    required String label,
    required String url,
  }) async {
    try {
      await _apiService.createExternalLink(
        ExternalLinkRequest(label: label, linkUrl: url),
      );
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.createExternalLink failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to create external link.'));
    }
  }

  /// Delete an external link by ID.
  Future<void> deleteExternalLink(String id) async {
    try {
      await _apiService.deleteExternalLink(id);
      await _refreshFromApi();
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.deleteExternalLink failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(const StorefrontState.error('Failed to delete external link.'));
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Internal — API fetch + cache
  // ──────────────────────────────────────────────────────────────

  /// Fetch profile + Stripe status from API, write to local cache, and
  /// emit loaded state.
  ///
  /// If [fallbackToCache] is `true` and the request fails, emits an error
  /// only when there is no loaded state to fall back on. When cached data
  /// is already being shown, failures are kept silent.
  Future<void> _refreshFromApi({bool fallbackToCache = false}) async {
    try {
      final profile = await _apiService.getProfile();
      StripeStatusDto? stripeStatus;
      try {
        stripeStatus = await _apiService.getStripeStatus();
      } catch (e) {
        developer.log(
          'StorefrontCubit stripe status failed',
          name: 'storefront',
          error: e,
        );
        // Non-critical — proceed with profile only
      }

      // Write to cache (fire-and-forget)
      unawaited(Future.wait([
        _localService.cacheProfile(profile),
        if (stripeStatus != null)
          _localService.cacheStripeStatus(stripeStatus),
      ]));

      emit(StorefrontState.loaded(
        profile: profile,
        stripeStatus: stripeStatus,
      ));
    } catch (e, s) {
      developer.log(
        'StorefrontCubit._refreshFromApi failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      if (fallbackToCache && state is! StorefrontLoaded) {
        emit(const StorefrontState.error(
          'Failed to load storefront. Please try again.',
        ));
      }
      // If we already have a loaded state (from cache or prior API call),
      // stay there — better to show possibly-stale data than an error.
    }
  }
}
