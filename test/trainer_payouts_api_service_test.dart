import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';
import 'package:ziro_fit/features/trainer/data/trainer_payouts_api_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late TrainerPayoutsApiService service;

  setUp(() {
    dio = MockDio();
    service = TrainerPayoutsApiService(dio);
  });

  group('TrainerPayoutsApiService', () {
    test('getStripeStatus returns parsed DTO when connected', () async {
      when(() => dio.get('/api/profile/me/billing')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/profile/me/billing'),
          data: {
            'data': {
              'charges_enabled': true,
              'details_submitted': true,
              'accountId': 'acct_123',
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.getStripeStatus();

      expect(result.chargesEnabled, isTrue);
      expect(result.detailsSubmitted, isTrue);
      expect(result.accountId, 'acct_123');
    });

    test('getStripeStatus returns disconnected state', () async {
      when(() => dio.get('/api/profile/me/billing')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/profile/me/billing'),
          data: {
            'data': {
              'charges_enabled': false,
              'details_submitted': false,
              'accountId': null,
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.getStripeStatus();

      expect(result.chargesEnabled, isFalse);
      expect(result.detailsSubmitted, isFalse);
      expect(result.accountId, isNull);
    });

    test('getStripeOnboardingUrl returns URL', () async {
      when(() => dio.post('/api/profile/me/billing')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/profile/me/billing'),
          data: {
            'data': {
              'url': 'https://connect.stripe.com/onboarding/abc123',
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.getStripeOnboardingUrl();

      expect(result, 'https://connect.stripe.com/onboarding/abc123');
    });
  });
}
