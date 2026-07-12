import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/stripe_status_dto.dart';

@injectable
class TrainerPayoutsApiService {
  final Dio _dio;

  TrainerPayoutsApiService(this._dio);

  /// GET /api/profile/me/billing — fetch Stripe Connect status.
  Future<StripeStatusDto> getStripeStatus() async {
    final response = await _dio.get('/api/profile/me/billing');
    final data = response.data['data'] as Map<String, dynamic>;
    return StripeStatusDto.fromJson(data);
  }

  /// POST /api/profile/me/billing — create Stripe Connect onboarding URL.
  Future<String> getStripeOnboardingUrl() async {
    final response = await _dio.post('/api/profile/me/billing');
    final data = response.data['data'] as Map<String, dynamic>;
    return data['url'] as String;
  }
}
