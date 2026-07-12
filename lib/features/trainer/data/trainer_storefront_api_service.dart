import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/storefront_profile_dto.dart';
import 'models/stripe_status_dto.dart';

@injectable
class TrainerStorefrontApiService {
  final Dio _dio;

  TrainerStorefrontApiService(this._dio);

  /// GET /api/trainer/profile/text — fetch profile text content.
  Future<StorefrontProfileDto> getProfile() async {
    final response = await _dio.get('/api/trainer/profile/text');
    final data = response.data['data'] as Map<String, dynamic>;
    return StorefrontProfileDto.fromJson(data);
  }

  /// GET /api/profile/me/billing — Stripe Connect status.
  Future<StripeStatusDto> getStripeStatus() async {
    final response = await _dio.get('/api/profile/me/billing');
    final data = response.data['data'] as Map<String, dynamic>;
    return StripeStatusDto.fromJson(data);
  }
}
