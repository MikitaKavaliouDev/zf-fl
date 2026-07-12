import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/subscription_dto.dart';
import 'models/billing_response_dto.dart';

@injectable
class TrainerBillingApiService {
  final Dio _dio;

  TrainerBillingApiService(this._dio);

  /// GET /api/billing/subscription — fetch current subscription.
  Future<SubscriptionDto> getSubscription() async {
    final response = await _dio.get('/api/billing/subscription');
    final data = response.data['data'] as Map<String, dynamic>;
    return SubscriptionDto.fromJson(data);
  }

  /// POST /api/billing/subscription — create checkout session for new tier.
  Future<String> createCheckoutSession(String tierId) async {
    final response = await _dio.post(
      '/api/billing/subscription',
      data: CreateCheckoutRequest(tierId: tierId).toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data['url'] as String;
  }

  /// PATCH /api/billing/subscription — cancel, resume, or change tier.
  Future<SubscriptionUpdateResponse> updateSubscription({
    required String action,
    String? tierId,
  }) async {
    final response = await _dio.patch(
      '/api/billing/subscription',
      data: UpdateSubscriptionRequest(action: action, tierId: tierId).toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return SubscriptionUpdateResponse.fromJson(data);
  }

  /// GET /api/billing/portal — Stripe Customer Portal URL.
  Future<String> getBillingPortalUrl() async {
    final response = await _dio.get('/api/billing/portal');
    final data = response.data['data'] as Map<String, dynamic>;
    return data['url'] as String;
  }
}
