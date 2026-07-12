import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/subscription_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/subscription_state.dart';
import 'package:ziro_fit/features/trainer/data/models/subscription_dto.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/subscription_screen.dart';

class MockSubscriptionCubit extends Mock implements SubscriptionCubit {}

Widget _buildTestWidget(MockSubscriptionCubit cubit, SubscriptionState state) {
  when(() => cubit.stream).thenAnswer((_) => Stream.value(state));
  when(() => cubit.state).thenReturn(state);
  when(() => cubit.load()).thenAnswer((_) async {});

  return MaterialApp(
    home: BlocProvider<SubscriptionCubit>.value(
      value: cubit,
      child: const SubscriptionScreen(),
    ),
  );
}

void main() {
  late MockSubscriptionCubit mockCubit;

  const activeSubscription = SubscriptionDto(
    tier: 'PRO',
    subscriptionStatus: 'active',
    tierName: 'Trainer Pro',
    tierId: 'tier_pro',
    stripeCancelAtPeriodEnd: false,
    stripeCurrentPeriodEnd: '2026-08-12T00:00:00Z',
    freeMode: false,
  );

  const canceledSubscription = SubscriptionDto(
    tier: 'PRO',
    subscriptionStatus: 'active',
    tierName: 'Trainer Pro',
    tierId: 'tier_pro',
    stripeCancelAtPeriodEnd: true,
    stripeCurrentPeriodEnd: '2026-08-12T00:00:00Z',
    stripeCancelAt: '2026-07-12T00:00:00Z',
    freeMode: false,
  );

  setUp(() {
    mockCubit = MockSubscriptionCubit();
  });

  group('SubscriptionScreen', () {
    testWidgets('shows loading indicator', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(mockCubit, const SubscriptionLoading()),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows plan card when loaded', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          mockCubit,
          SubscriptionLoaded(activeSubscription),
        ),
      );
      await tester.pump();

      expect(find.text('Trainer Pro'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Upgrade Plan'), findsOneWidget);
      expect(find.text('Billing History'), findsOneWidget);
    });

    testWidgets('shows cancel placeholder text when canceled', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          mockCubit,
          SubscriptionLoaded(canceledSubscription),
        ),
      );
      await tester.pump();

      expect(find.textContaining('Ending on'), findsOneWidget);
    });

    testWidgets('shows error with retry button', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          mockCubit,
          const SubscriptionError('Failed to load subscription'),
        ),
      );
      await tester.pump();

      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('shows reactivate button when canceled', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          mockCubit,
          SubscriptionLoaded(canceledSubscription),
        ),
      );
      await tester.pump();

      expect(find.text('Reactivate'), findsOneWidget);
    });
  });
}
