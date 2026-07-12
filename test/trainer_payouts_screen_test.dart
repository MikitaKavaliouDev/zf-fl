import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/payouts_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/payouts_state.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/payouts_screen.dart';

class MockPayoutsCubit extends Mock implements PayoutsCubit {}

void main() {
  late MockPayoutsCubit mockCubit;
  late StreamController<PayoutsState> stateController;

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
    mockCubit = MockPayoutsCubit();
    stateController = StreamController<PayoutsState>.broadcast();
    when(() => mockCubit.stream).thenAnswer((_) => stateController.stream);
    when(() => mockCubit.load()).thenAnswer((_) async {});
  });

  tearDown(() {
    stateController.close();
  });

  Widget buildScreen() {
    return MaterialApp(
      home: BlocProvider<PayoutsCubit>.value(
        value: mockCubit,
        child: const PayoutsScreen(),
      ),
    );
  }

  group('PayoutsScreen', () {
    testWidgets('shows loading indicator', (tester) async {
      when(() => mockCubit.state).thenReturn(const PayoutsState.loading());

      await tester.pumpWidget(buildScreen());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows connected status', (tester) async {
      when(() => mockCubit.state).thenReturn(
        PayoutsState.loaded(connectedStatus),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.text('Connected & Ready'), findsOneWidget);
      expect(find.text('Manage Stripe Account'), findsOneWidget);
    });

    testWidgets('shows disconnected status', (tester) async {
      when(() => mockCubit.state).thenReturn(
        PayoutsState.loaded(disconnectedStatus),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.text('Not Connected'), findsOneWidget);
      expect(find.text('Connect Stripe Account'), findsOneWidget);
    });

    testWidgets('shows error with retry button', (tester) async {
      when(() => mockCubit.state).thenReturn(
        const PayoutsState.error('Failed to load payout status. Please try again.'),
      );

      await tester.pumpWidget(buildScreen());

      expect(
        find.text('Failed to load payout status. Please try again.'),
        findsOneWidget,
      );
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
