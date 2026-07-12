import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/payouts_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/payouts_state.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';
import 'package:ziro_fit/features/trainer/data/trainer_payouts_api_service.dart';

class MockTrainerPayoutsApiService extends Mock
    implements TrainerPayoutsApiService {}

void main() {
  late TrainerPayoutsApiService mockApiService;
  late PayoutsCubit cubit;

  final connectedStatus = StripeStatusDto(
    chargesEnabled: true,
    detailsSubmitted: true,
    accountId: 'acct_123',
  );

  final disconnectedStatus = StripeStatusDto(
    chargesEnabled: false,
    detailsSubmitted: false,
    accountId: null,
  );

  setUp(() {
    mockApiService = MockTrainerPayoutsApiService();
    cubit = PayoutsCubit(mockApiService);
  });

  tearDown(() {
    cubit.close();
  });

  group('PayoutsCubit', () {
    test('initial state is PayoutsInitial', () {
      expect(cubit.state, const PayoutsState.initial());
    });

    blocTest<PayoutsCubit, PayoutsState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => mockApiService.getStripeStatus())
            .thenAnswer((_) async => connectedStatus);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const PayoutsState.loading(),
        PayoutsState.loaded(connectedStatus),
      ],
    );

    blocTest<PayoutsCubit, PayoutsState>(
      'emits [loading, error] when load fails',
      build: () {
        when(() => mockApiService.getStripeStatus())
            .thenThrow(Exception('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const PayoutsState.loading(),
        isA<PayoutsError>(),
      ],
    );

    blocTest<PayoutsCubit, PayoutsState>(
      'emits [loading, loaded] when disconnected',
      build: () {
        when(() => mockApiService.getStripeStatus())
            .thenAnswer((_) async => disconnectedStatus);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const PayoutsState.loading(),
        PayoutsState.loaded(disconnectedStatus),
      ],
    );

    test('fetchOnboardingUrl returns URL string on success', () async {
      when(() => mockApiService.getStripeOnboardingUrl())
          .thenAnswer((_) async => 'https://connect.stripe.com/onboarding/abc');

      final url = await cubit.fetchOnboardingUrl();

      expect(url, 'https://connect.stripe.com/onboarding/abc');
    });
  });
}
