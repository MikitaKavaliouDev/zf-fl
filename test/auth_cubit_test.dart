import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/auth_repository.dart';
import 'package:ziro_fit/features/auth/data/models/auth_response.dart';
import 'package:ziro_fit/features/auth/data/models/user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthRepository repository;
  late AuthCubit cubit;

  setUp(() {
    repository = MockAuthRepository();
    cubit = AuthCubit(repository);
  });

  tearDown(() {
    cubit.close();
  });

  group('AuthCubit', () {
    test('initial state is AuthInitial', () {
      expect(cubit.state, const AuthInitial());
    });

    blocTest<AuthCubit, AuthState>(
      'emits [loading, unauthenticated] when getCurrentUser returns null',
      build: () {
        when(() => repository.getCurrentUser())
            .thenAnswer((_) async => null);
        return cubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [
        const AuthLoading(),
        const AuthUnauthenticated(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [loading, authenticated] when login succeeds',
      build: () {
        when(() => repository.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => const AuthResponse(
              message: 'ok',
              role: 'client',
              accessToken: 'tok',
              refreshToken: 'rtok',
              user: User(
                id: '1',
                email: 'a@b.com',
                name: 'Test',
                role: 'client',
                username: 'testuser',
                hasCompletedOnboarding: true,
              ),
            ));
        return cubit;
      },
      act: (cubit) => cubit.login(
        email: 'a@b.com',
        password: 'pass1234',
      ),
      expect: () => [
        const AuthLoading(),
        isA<AuthAuthenticated>(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [loading, error] when login fails',
      build: () {
        when(() => repository.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(Exception('Invalid credentials'));
        return cubit;
      },
      act: (cubit) => cubit.login(
        email: 'a@b.com',
        password: 'wrong',
      ),
      expect: () => [
        const AuthLoading(),
        isA<AuthError>(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [unauthenticated] on logout',
      build: () {
        when(() => repository.logout()).thenAnswer((_) async {});
        return cubit;
      },
      seed: () => const AuthAuthenticated(
        user: User(
          id: '1',
          email: 'a@b.com',
          role: 'client',
          username: 'testuser',
          hasCompletedOnboarding: true,
        ),
      ),
      act: (cubit) => cubit.logout(),
      expect: () => [
        const AuthUnauthenticated(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [needsOnboarding] when user has not completed onboarding',
      build: () {
        when(() => repository.getCurrentUser()).thenAnswer((_) async =>
            const User(
              id: '1',
              email: 'a@b.com',
              role: 'client',
              username: 'testuser',
              hasCompletedOnboarding: false,
            ));
        return cubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [
        const AuthLoading(),
        isA<AuthNeedsOnboarding>(),
      ],
    );
  });
}
