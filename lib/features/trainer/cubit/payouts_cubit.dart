import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_payouts_api_service.dart';
import 'payouts_state.dart';

@injectable
class PayoutsCubit extends Cubit<PayoutsState> {
  final TrainerPayoutsApiService _apiService;

  PayoutsCubit(this._apiService) : super(const PayoutsState.initial());

  /// Fetch Stripe Connect status.
  Future<void> load() async {
    emit(const PayoutsState.loading());
    try {
      final status = await _apiService.getStripeStatus();
      emit(PayoutsState.loaded(status));
    } catch (e, s) {
      developer.log('PayoutsCubit.load failed', name: 'payouts', error: e, stackTrace: s);
      emit(PayoutsState.error('Failed to load payout status. Please try again.'));
    }
  }

  /// Fetch Stripe Connect onboarding URL.
  Future<String?> fetchOnboardingUrl() async {
    try {
      return await _apiService.getStripeOnboardingUrl();
    } catch (e, s) {
      developer.log('PayoutsCubit.fetchOnboardingUrl failed', name: 'payouts', error: e, stackTrace: s);
      return null;
    }
  }
}
