import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/storefront_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/storefront_state.dart';
import 'package:ziro_fit/features/trainer/data/trainer_storefront_api_service.dart';
import 'package:ziro_fit/features/trainer/data/models/storefront_profile_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';

class MockTrainerStorefrontApiService extends Mock
    implements TrainerStorefrontApiService {}

void main() {
  late TrainerStorefrontApiService apiService;
  late StorefrontCubit cubit;

  final testProfile = StorefrontProfileDto(
    name: 'Test Trainer',
    username: 'testtrainer',
    bio: 'Coach bio',
    specialties: 'Strength',
  );

  final testStripeStatus = StripeStatusDto(
    chargesEnabled: true,
    detailsSubmitted: true,
    accountId: 'acct_123',
  );

  setUp(() {
    apiService = MockTrainerStorefrontApiService();
    cubit = StorefrontCubit(apiService);
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
              requestOptions: RequestOptions(path: '/api/trainer/profile/text'),
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
        await cubit.load();
      },
      expect: () => [
        // First load
        const StorefrontLoading(),
        isA<StorefrontLoaded>(),
        // Second load (pull-to-refresh)
        const StorefrontLoading(),
        isA<StorefrontLoaded>(),
      ],
    );
  });
}
