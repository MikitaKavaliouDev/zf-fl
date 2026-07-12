import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/storefront_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/storefront_state.dart';
import 'package:ziro_fit/features/trainer/data/storefront_local_service.dart';
import 'package:ziro_fit/features/trainer/data/trainer_storefront_api_service.dart';
import 'package:ziro_fit/features/trainer/data/models/storefront_profile_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';

class MockTrainerStorefrontApiService extends Mock
    implements TrainerStorefrontApiService {}

class MockStorefrontLocalService extends Mock
    implements StorefrontLocalService {}

void main() {
  late TrainerStorefrontApiService apiService;
  late StorefrontLocalService localService;
  late StorefrontCubit cubit;

  setUpAll(() {
    registerFallbackValue(StorefrontProfileDto(
      name: 'dummy',
      username: 'dummy',
    ));
    registerFallbackValue(StripeStatusDto(
      chargesEnabled: false,
      detailsSubmitted: false,
    ));
  });

  final testProfile = StorefrontProfileDto(
    name: 'Test Trainer',
    username: 'testtrainer',
    bio: 'Coach bio',
    specialties: ['Strength'],
  );

  final testStripeStatus = StripeStatusDto(
    chargesEnabled: true,
    detailsSubmitted: true,
    accountId: 'acct_123',
  );

  setUp(() {
    apiService = MockTrainerStorefrontApiService();
    localService = MockStorefrontLocalService();
    // Default: cache is empty (cold start)
    when(() => localService.cachedProfile())
        .thenAnswer((_) async => null);
    when(() => localService.cachedStripeStatus())
        .thenAnswer((_) async => null);
    // Cache writes are fire-and-forget (unawaited)
    when(() => localService.cacheProfile(any()))
        .thenAnswer((_) async {});
    when(() => localService.cacheStripeStatus(any()))
        .thenAnswer((_) async {});
    cubit = StorefrontCubit(apiService, localService);
  });

  tearDown(() {
    cubit.close();
  });

  group('StorefrontCubit', () {
    test('initial state is StorefrontInitial', () {
      expect(cubit.state, const StorefrontInitial());
    });

    blocTest<StorefrontCubit, StorefrontState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => apiService.getProfile())
            .thenAnswer((_) async => testProfile);
        when(() => apiService.getStripeStatus())
            .thenAnswer((_) async => testStripeStatus);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const StorefrontLoading(),
        isA<StorefrontLoaded>()
            .having((s) => s.profile.name, 'profile.name', 'Test Trainer')
            .having((s) => s.profile.bio, 'profile.bio', 'Coach bio')
            .having(
                (s) => s.stripeStatus?.chargesEnabled,
                'stripeStatus.chargesEnabled',
                true),
      ],
    );

    blocTest<StorefrontCubit, StorefrontState>(
      'emits [loading, error] when load fails',
      build: () {
        when(() => apiService.getProfile())
            .thenThrow(DioException(
              requestOptions: RequestOptions(path: '/api/trainer/profile'),
              error: 'Network error',
              type: DioExceptionType.connectionError,
            ));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const StorefrontLoading(),
        isA<StorefrontError>(),
      ],
    );

    blocTest<StorefrontCubit, StorefrontState>(
      'loaded state preserves data when stripe fails',
      build: () {
        when(() => apiService.getProfile())
            .thenAnswer((_) async => testProfile);
        when(() => apiService.getStripeStatus())
            .thenThrow(Exception('Stripe unavailable'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const StorefrontLoading(),
        isA<StorefrontLoaded>()
            .having((s) => s.profile.name, 'profile.name', 'Test Trainer')
            .having((s) => s.stripeStatus, 'stripeStatus', isNull),
      ],
    );

    blocTest<StorefrontCubit, StorefrontState>(
      'pull-to-refresh re-emits [loading, loaded]',
      build: () {
        when(() => apiService.getProfile())
            .thenAnswer((_) async => testProfile);
        when(() => apiService.getStripeStatus())
            .thenAnswer((_) async => testStripeStatus);
        return cubit;
      },
      act: (cubit) async {
        await cubit.load();
        await cubit.load(forceRefresh: true);
      },
      expect: () => [
        // First load (cold start — cache empty)
        const StorefrontLoading(),
        isA<StorefrontLoaded>(),
        // Second load (force-refresh — skip cache)
        const StorefrontLoading(),
        isA<StorefrontLoaded>(),
      ],
    );
  });
}
