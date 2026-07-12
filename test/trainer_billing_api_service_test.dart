import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/data/trainer_billing_api_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late TrainerBillingApiService service;

  setUp(() {
    dio = MockDio();
    service = TrainerBillingApiService(dio);
  });

  group('TrainerBillingApiService', () {
    test('getSubscription returns parsed DTO', () async {
      when(() => dio.get('/api/billing/subscription')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/billing/subscription'),
          data: {
            'data': {
              'tier': 'PRO',
              'subscriptionStatus': 'active',
              'tierName': 'Trainer Pro',
              'tierId': 'tier_pro',
              'stripeCancelAtPeriodEnd': false,
              'stripeCurrentPeriodEnd': '2026-08-12T00:00:00Z',
              'freeMode': false,
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.getSubscription();
      expect(result.tier, 'PRO');
      expect(result.tierName, 'Trainer Pro');
      expect(result.tierId, 'tier_pro');
      expect(result.subscriptionStatus, 'active');
      expect(result.stripeCancelAtPeriodEnd, false);
      expect(result.stripeCurrentPeriodEnd, '2026-08-12T00:00:00Z');
    });

    test('getSubscription handles nullable dates', () async {
      when(() => dio.get('/api/billing/subscription')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/billing/subscription'),
          data: {
            'data': {
              'tier': 'FREE',
              'subscriptionStatus': null,
              'tierName': 'Free',
              'tierId': 'tier_free',
              'stripeCancelAtPeriodEnd': false,
              'stripeCurrentPeriodEnd': null,
              'stripeCancelAt': null,
              'trialEndsAt': null,
              'freeMode': true,
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.getSubscription();
      expect(result.tier, 'FREE');
      expect(result.subscriptionStatus, isNull);
      expect(result.stripeCurrentPeriodEnd, isNull);
      expect(result.stripeCancelAt, isNull);
      expect(result.trialEndsAt, isNull);
      expect(result.freeMode, true);
    });

    test('createCheckoutSession returns URL on success', () async {
      when(
        () => dio.post('/api/billing/subscription', data: any(named: 'data')),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/billing/subscription'),
          data: {
            'data': {'url': 'https://checkout.stripe.com/test_123'},
          },
          statusCode: 200,
        ),
      );

      final url = await service.createCheckoutSession('tier_elite');
      expect(url, 'https://checkout.stripe.com/test_123');
    });

    test('updateSubscription cancel succeeds', () async {
      when(
        () => dio.patch('/api/billing/subscription', data: any(named: 'data')),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/billing/subscription'),
          data: {
            'data': {'success': true},
          },
          statusCode: 200,
        ),
      );

      final response = await service.updateSubscription(action: 'cancel');
      expect(response.success, true);
    });

    test('updateSubscription throws on bad action', () async {
      when(
        () => dio.patch('/api/billing/subscription', data: any(named: 'data')),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/billing/subscription'),
          message: 'Bad request',
        ),
      );

      expect(
        () => service.updateSubscription(action: 'invalid_action'),
        throwsA(isA<DioException>()),
      );
    });
  });
}
