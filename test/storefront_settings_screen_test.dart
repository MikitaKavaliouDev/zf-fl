import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/cubit/storefront_cubit.dart';
import 'package:ziro_fit/features/trainer/cubit/storefront_state.dart';
import 'package:ziro_fit/features/trainer/data/models/storefront_profile_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/storefront_settings_screen.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/widgets/package_preview_card.dart';

class MockStorefrontCubit extends Mock implements StorefrontCubit {}

StorefrontCubit createMockCubit(StorefrontState state) {
  final cubit = MockStorefrontCubit();
  final controller = StreamController<StorefrontState>.broadcast();
  when(() => cubit.state).thenReturn(state);
  when(() => cubit.stream).thenAnswer((_) => controller.stream);
  when(() => cubit.load()).thenAnswer((_) async {});
  return cubit;
}

void main() {
  final testProfile = StorefrontProfileDto(
    name: 'Test Trainer',
    username: 'testtrainer',
    bio: 'Coach bio',
    specialties: 'Strength',
    packages: [
      StorefrontPackageDto(
        id: 'pkg1',
        name: 'Basic Plan',
        price: '99.99',
        duration: 'Monthly',
      ),
    ],
    services: [
      StorefrontServiceDto(
        id: 'svc1',
        name: 'Personal Training',
        description: 'One-on-one coaching',
        price: '50',
      ),
    ],
    tags: ['Strength', 'Cardio'],
    testimonials: [],
    socialLinks: [],
    externalLinks: [],
    transformationPhotos: [],
  );

  final testStripeStatus = StripeStatusDto(
    chargesEnabled: true,
    detailsSubmitted: true,
    accountId: 'acct_123',
  );

  Widget buildScreen(StorefrontCubit cubit) {
    return MaterialApp(
      home: BlocProvider<StorefrontCubit>.value(
        value: cubit,
        child: const StorefrontSettingsScreen(),
      ),
    );
  }

  group('StorefrontSettingsScreen', () {
    testWidgets('shows loading indicator', (tester) async {
      await tester.pumpWidget(buildScreen(
        createMockCubit(const StorefrontLoading()),
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows profile data when loaded', (tester) async {
      await tester.pumpWidget(buildScreen(
        createMockCubit(StorefrontLoaded(
          profile: testProfile,
          stripeStatus: testStripeStatus,
        )),
      ));
      await tester.pump();

      expect(find.text('Test Trainer'), findsOneWidget);
      expect(find.text('Coach bio'), findsOneWidget);
      expect(find.text('Strength'), findsOneWidget);
      expect(find.text('1 Packages'), findsOneWidget);
      expect(find.text('Basic Plan'), findsOneWidget);

      // Scroll down to reveal services + payments sections
      // Drag on a widget in the main ListView (not inside the horizontal PackageCarousel)
      await tester.drag(find.text('Test Trainer'), const Offset(0, -500));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Personal Training'), findsOneWidget);

      await tester.drag(find.text('Personal Training'), const Offset(0, -200));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Connected — payouts enabled'), findsOneWidget);
    });

    testWidgets('shows error state with retry', (tester) async {
      await tester.pumpWidget(buildScreen(
        createMockCubit(const StorefrontError('Error loading')),
      ));
      await tester.pump();

      expect(find.text('Error loading'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('shows empty state for no packages', (tester) async {
      final emptyProfile = StorefrontProfileDto(
        name: 'Empty Trainer',
        bio: 'No packages yet',
        packages: [],
        services: [],
        tags: [],
        testimonials: [],
        socialLinks: [],
        externalLinks: [],
        transformationPhotos: [],
      );

      await tester.pumpWidget(buildScreen(
        createMockCubit(StorefrontLoaded(
          profile: emptyProfile,
          stripeStatus: null,
        )),
      ));
      await tester.pump();

      expect(find.text('Empty Trainer'), findsOneWidget);
      expect(find.text('No packages yet'), findsOneWidget);
      expect(find.text('0 Packages'), findsOneWidget);
      expect(find.byType(PackagePreviewCard), findsNothing);
    });
  });
}
