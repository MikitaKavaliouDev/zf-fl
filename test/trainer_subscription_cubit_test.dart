import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/method_channel_url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import 'package:ziro_fit/features/trainer/cubit/subscription_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/subscription_state.dart';
import 'package:ziro_fit/features/trainer/data/models/billing_response_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/subscription_dto.dart';
import 'package:ziro_fit/features/trainer/data/trainer_billing_api_service.dart';

class MockTrainerBillingApiService extends Mock
    implements TrainerBillingApiService {}

/// A fake [UrlLauncherPlatform] that returns success for all operations.
class FakeUrlLauncherPlatform extends UrlLauncherPlatform {
  FakeUrlLauncherPlatform() : super();

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launch(
    String url, {
    required bool useSafariVC,
    required bool useWebView,
    required bool enableJavaScript,
    required bool enableDomStorage,
    required bool universalLinksOnly,
    required Map<String, String> headers,
    String? webOnlyWindowName,
  }) async =>
      true;
}

void main() {
  late TrainerBillingApiService apiService;
  late SubscriptionCubit cubit;

  const testSubscription = SubscriptionDto(
    tier: 'PRO',
    subscriptionStatus: 'active',
    tierName: 'Trainer Pro',
    tierId: 'tier_pro',
    stripeCancelAtPeriodEnd: false,
    stripeCurrentPeriodEnd: '2026-08-12T00:00:00Z',
    freeMode: false,
  );

  setUp(() {
    apiService = MockTrainerBillingApiService();
    cubit = SubscriptionCubit(apiService);
  });

  tearDown(() {
    cubit.close();
  });

  group('SubscriptionCubit', () {
    test('initial state is SubscriptionInitial', () {
      expect(cubit.state, const SubscriptionInitial());
    });

    blocTest<SubscriptionCubit, SubscriptionState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => apiService.getSubscription())
            .thenAnswer((_) async => testSubscription);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const SubscriptionLoading(),
        SubscriptionLoaded(testSubscription),
      ],
    );

    blocTest<SubscriptionCubit, SubscriptionState>(
      'emits [loading, error] when load fails',
      build: () {
        when(() => apiService.getSubscription())
            .thenThrow(Exception('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const SubscriptionLoading(),
        isA<SubscriptionError>(),
      ],
    );

    test('cancel calls API then reloads', () async {
      when(() => apiService.updateSubscription(action: 'cancel')).thenAnswer(
        (_) async => const SubscriptionUpdateResponse(success: true),
      );
      when(() => apiService.getSubscription())
          .thenAnswer((_) async => testSubscription);

      final result = await cubit.cancel();

      expect(result, true);
      verify(() => apiService.updateSubscription(action: 'cancel')).called(1);
      verify(() => apiService.getSubscription()).called(1);
    });

    test('resume calls API then reloads', () async {
      when(() => apiService.updateSubscription(action: 'resume')).thenAnswer(
        (_) async => const SubscriptionUpdateResponse(success: true),
      );
      when(() => apiService.getSubscription())
          .thenAnswer((_) async => testSubscription);

      final result = await cubit.resume();

      expect(result, true);
      verify(() => apiService.updateSubscription(action: 'resume')).called(1);
      verify(() => apiService.getSubscription()).called(1);
    });

    test('upgrade creates checkout and opens URL', () async {
      // Inject a fake UrlLauncherPlatform that always succeeds.
      UrlLauncherPlatform.instance = FakeUrlLauncherPlatform();

      when(() => apiService.createCheckoutSession('tier_elite'))
          .thenAnswer((_) async => 'https://checkout.stripe.com/test');

      final result = await cubit.upgrade('tier_elite');

      expect(result, true);
      verify(() => apiService.createCheckoutSession('tier_elite')).called(1);

      // Restore default platform implementation.
      UrlLauncherPlatform.instance = MethodChannelUrlLauncher();
    });
  });
}
