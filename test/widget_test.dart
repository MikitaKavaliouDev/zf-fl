import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ziro_fit/core/di/injection.dart' as di;
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/presentation/email_verification_screen.dart';
import 'package:ziro_fit/features/auth/presentation/login_screen.dart';
import 'package:ziro_fit/features/auth/presentation/onboarding_screen.dart';
import 'package:ziro_fit/features/auth/presentation/register_screen.dart';

void main() {
  setUpAll(() {
    di.initDependencies();
  });

  group('Auth Screens', () {
    testWidgets('LoginScreen renders form fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        ),
      );

      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.text('ZIRO.FIT'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('RegisterScreen renders form fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        ),
      );

      expect(find.text('Create Account'), findsNWidgets(2));
      expect(find.byType(TextFormField), findsNWidgets(3));
    });

    testWidgets('EmailVerificationScreen renders confirmation', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: EmailVerificationScreen()),
      );

      expect(find.text('Check your email'), findsOneWidget);
      expect(find.text('Back to Sign In'), findsOneWidget);
    });

    testWidgets('OnboardingScreen starts with role selection', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      expect(find.text("What's your role?"), findsOneWidget);
      expect(find.text('Trainer'), findsOneWidget);
      expect(find.text('Client'), findsOneWidget);
    });
  });
}
