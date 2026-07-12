import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/models/user.dart';
import 'package:ziro_fit/features/trainer/presentation/settings/digital_business_card_screen.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  late MockAuthCubit mockCubit;
  late StreamController<AuthState> stateController;

  final testUser = User(
    id: '1',
    email: 'trainer@test.com',
    name: 'Test Trainer',
    role: 'trainer',
    username: 'testtrainer',
    hasCompletedOnboarding: true,
  );

  setUp(() {
    mockCubit = MockAuthCubit();
    stateController = StreamController<AuthState>.broadcast();
    when(() => mockCubit.stream).thenAnswer((_) => stateController.stream);
  });

  tearDown(() {
    stateController.close();
  });

  Widget buildScreen() {
    return BlocProvider<AuthCubit>.value(
      value: mockCubit,
      child: const MaterialApp(
        home: DigitalBusinessCardScreen(),
      ),
    );
  }

  group('DigitalBusinessCardScreen', () {
    testWidgets('renders title and QR code', (tester) async {
      when(() => mockCubit.state).thenReturn(
        AuthState.authenticated(user: testUser, isTrainer: true),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.text('Digital Business Card'), findsOneWidget);
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets('displays trainer name', (tester) async {
      when(() => mockCubit.state).thenReturn(
        AuthState.authenticated(user: testUser, isTrainer: true),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.text('Test Trainer'), findsOneWidget);
    });

    testWidgets('shows Fitness Professional subtitle', (tester) async {
      when(() => mockCubit.state).thenReturn(
        AuthState.authenticated(user: testUser, isTrainer: true),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.text('Fitness Professional'), findsOneWidget);
    });

    testWidgets('renders share/copy button', (tester) async {
      when(() => mockCubit.state).thenReturn(
        AuthState.authenticated(user: testUser, isTrainer: true),
      );

      await tester.pumpWidget(buildScreen());

      expect(find.byIcon(Icons.share_rounded), findsOneWidget);
    });
  });
}
