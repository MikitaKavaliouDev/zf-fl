import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/core/di/injection.dart' as di;
import 'package:ziro_fit/core/network/response_cache.dart';
import 'package:ziro_fit/core/security/active_mode_holder.dart';
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/auth_repository.dart';
import 'package:ziro_fit/features/auth/data/models/register_response.dart';
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

    testWidgets('EmailVerificationScreen renders code input', (WidgetTester tester) async {
      final cubit = AuthCubit(
        di.getIt<AuthRepository>(),
        di.getIt<ActiveModeHolder>(),
        di.getIt<ResponseCache>(),
        di.getIt<AppDatabase>(),
        di.getIt<QueryClient>(),
      );
      cubit.emit(AuthState.registerSuccess(
        email: 'test@example.com',
        response: RegisterResponse(
          userId: '123',
          message: 'OK',
          requiresSubscription: true,
          confirmationRequired: true,
        ),
      ));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>.value(
            value: cubit,
            child: const EmailVerificationScreen(),
          ),
        ),
      );

      expect(find.text('Check your email'), findsOneWidget);
      expect(find.text('Verify Email'), findsOneWidget);
      expect(find.text('Resend code'), findsOneWidget);
      expect(find.text('Back to Sign In'), findsOneWidget);

      cubit.close();
    });

    testWidgets('OnboardingScreen starts with language selection', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      expect(find.text('Choose your language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Français'), findsOneWidget);
    });
  });
}
