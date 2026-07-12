import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/trainer_billing_api_service.dart';
import 'subscription_state.dart';

@injectable
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final TrainerBillingApiService _apiService;

  SubscriptionCubit(this._apiService) : super(const SubscriptionState.initial());

  /// Fetch current subscription.
  Future<void> load() async {
    emit(const SubscriptionState.loading());
    try {
      final subscription = await _apiService.getSubscription();
      emit(SubscriptionState.loaded(subscription));
    } catch (e, s) {
      developer.log('SubscriptionCubit.load failed', name: 'subscription', error: e, stackTrace: s);
      emit(SubscriptionState.error('Failed to load subscription. Please try again.'));
    }
  }

  /// Cancel subscription at period end.
  Future<bool> cancel() async {
    try {
      final response = await _apiService.updateSubscription(action: 'cancel');
      if (response.success) {
        await load();
        return true;
      }
      return false;
    } catch (e, s) {
      developer.log('SubscriptionCubit.cancel failed', name: 'subscription', error: e, stackTrace: s);
      return false;
    }
  }

  /// Resume a canceled subscription.
  Future<bool> resume() async {
    try {
      final response = await _apiService.updateSubscription(action: 'resume');
      if (response.success) {
        await load();
        return true;
      }
      return false;
    } catch (e, s) {
      developer.log('SubscriptionCubit.resume failed', name: 'subscription', error: e, stackTrace: s);
      return false;
    }
  }

  /// Upgrade to a new tier — create checkout and open URL.
  Future<bool> upgrade(String tierId) async {
    try {
      final url = await _apiService.createCheckoutSession(tierId);
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return true;
      }
      return false;
    } catch (e, s) {
      developer.log('SubscriptionCubit.upgrade failed', name: 'subscription', error: e, stackTrace: s);
      return false;
    }
  }

  /// Open Stripe Customer Portal for billing history.
  Future<void> openBillingPortal() async {
    try {
      final url = await _apiService.getBillingPortalUrl();
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e, s) {
      developer.log('SubscriptionCubit.openBillingPortal failed', name: 'subscription', error: e, stackTrace: s);
    }
  }
}
