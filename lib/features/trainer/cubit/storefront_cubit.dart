import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/stripe_status_dto.dart';
import '../data/trainer_storefront_api_service.dart';
import 'storefront_state.dart';

@injectable
class StorefrontCubit extends Cubit<StorefrontState> {
  final TrainerStorefrontApiService _apiService;

  StorefrontCubit(this._apiService) : super(const StorefrontState.initial());

  /// Fetch storefront profile and Stripe status in parallel.
  ///
  /// Stripe status is non-critical — if it fails, we still show the profile
  /// with a null stripe status rather than an error state.
  Future<void> load() async {
    emit(const StorefrontState.loading());
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
      emit(StorefrontState.loaded(
        profile: profile,
        stripeStatus: stripeStatus,
      ));
    } catch (e, s) {
      developer.log(
        'StorefrontCubit.load failed',
        name: 'storefront',
        error: e,
        stackTrace: s,
      );
      emit(StorefrontState.error(
        'Failed to load storefront. Please try again.',
      ));
    }
  }
}
