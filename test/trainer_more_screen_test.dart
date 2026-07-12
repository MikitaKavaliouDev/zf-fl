import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/models/user.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/trainer_more_screen.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

AuthCubit createMockAuthCubit() {
  final cubit = MockAuthCubit();
  final controller = StreamController<AuthState>.broadcast();
  when(() => cubit.state).thenReturn(
    AuthState.authenticated(
      user: User(
        id: '1',
        email: 'trainer@test.com',
        name: 'Trainer',
        role: 'trainer',
        username: 'trainer',
        hasCompletedOnboarding: true,
      ),
      isTrainer: true,
    ),
  );
  when(() => cubit.stream).thenAnswer((_) => controller.stream);
  return cubit;
}

Widget buildTestApp(AuthCubit authCubit) {
  final router = GoRouter(
    initialLocation: '/trainer/more',
    routes: [
      GoRoute(
        path: '/trainer/more',
        builder: (_, __) => BlocProvider<AuthCubit>.value(
          value: authCubit,
          child: const TrainerMoreScreen(),
        ),
      ),
      GoRoute(
        path: '/trainer/more/digital-business-card',
        builder: (_, __) => const Scaffold(
          body: Center(child: Text('DBC')),
        ),
      ),
      GoRoute(
        path: '/trainer/more/payouts',
        builder: (_, __) => const Scaffold(
          body: Center(child: Text('Payouts Destination')),
        ),
      ),
      GoRoute(
        path: '/trainer/more/subscription',
        builder: (_, __) => const Scaffold(
          body: Center(child: Text('Subscription Destination')),
        ),
      ),
      GoRoute(
        path: '/trainer/more/storefront-settings',
        builder: (_, __) => const Scaffold(
          body: Center(child: Text('Storefront Destination')),
        ),
      ),
    ],
  );

  return MaterialApp.router(
    routerConfig: router,
  );
}

void main() {
  group('TrainerMoreScreen - Business section navigation', () {
    testWidgets('Digital Business Card row navigates', (tester) async {
      final mockAuthCubit = createMockAuthCubit();
      await tester.pumpWidget(buildTestApp(mockAuthCubit));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Scroll to make the Business section visible
      await tester.scrollUntilVisible(
        find.text('Digital Business Card'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.tap(find.text('Digital Business Card'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('DBC'), findsOneWidget);
    });

    testWidgets('Storefront Settings row navigates', (tester) async {
      final mockAuthCubit = createMockAuthCubit();
      await tester.pumpWidget(buildTestApp(mockAuthCubit));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.scrollUntilVisible(
        find.text('Storefront Settings'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.tap(find.text('Storefront Settings'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Storefront Destination'), findsOneWidget);
    });

    testWidgets('Subscription & Billing row navigates', (tester) async {
      final mockAuthCubit = createMockAuthCubit();
      await tester.pumpWidget(buildTestApp(mockAuthCubit));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.scrollUntilVisible(
        find.text('Subscription & Billing'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.tap(find.text('Subscription & Billing'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Subscription Destination'), findsOneWidget);
    });

    testWidgets('Payouts row navigates', (tester) async {
      final mockAuthCubit = createMockAuthCubit();
      await tester.pumpWidget(buildTestApp(mockAuthCubit));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.scrollUntilVisible(
        find.text('Payouts'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.tap(find.text('Payouts'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Payouts Destination'), findsOneWidget);
    });
  });
}
