import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/cubit/auth_state.dart';
import '../../features/auth/presentation/email_verification_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/trainers/presentation/explore_screen.dart';
import '../../features/trainers/presentation/trainer_detail_screen.dart';
import '../../features/trainers/presentation/workout_session_screen.dart';
import '../theme/app_theme.dart';

/// Listenable that forwards bloc state changes to GoRouter for refresh.
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createAppRouter(AuthCubit authCubit) {
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    initialLocation: '/login',
    redirect: (context, state) {
      final authState = authCubit.state;
      final location = state.matchedLocation;

      final loggedIn =
          authState is AuthAuthenticated ||
          authState is AuthNeedsOnboarding ||
          authState is AuthRegisterSuccess ||
          authState is AuthPendingRole;
      final onAuthPage = location == '/login' ||
          location == '/register' ||
          location == '/verify-email' ||
          location == '/onboarding';

      // Not logged in → auth pages only.
      if (!loggedIn && !onAuthPage) return '/login';

      // Logged in → redirect away from auth pages.
      if (loggedIn && onAuthPage) return '/';

      // Needs onboarding → force to onboarding.
      if (authState is AuthNeedsOnboarding && location != '/onboarding') {
        return '/onboarding';
      }

      // Register success → show email verification.
      if (authState is AuthRegisterSuccess && location != '/verify-email') {
        return '/verify-email';
      }

      // Pending role (unverified email) → show verify-email.
      if (authState is AuthPendingRole && location != '/verify-email') {
        return '/verify-email';
      }

      return null; // no redirect
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (_, _) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (_, _) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (_, _) => const OnboardingScreen(),
      ),
      // Deep links for Stripe checkout return
      GoRoute(
        path: '/stripe-return',
        builder: (_, _) => const _StripeReturnScreen(),
      ),
      GoRoute(
        path: '/packages/:id/success',
        builder: (_, state) => _PackageResultScreen(
          packageId: state.pathParameters['id'] ?? '',
          success: true,
        ),
      ),
      GoRoute(
        path: '/packages/:id/cancel',
        builder: (_, state) => _PackageResultScreen(
          packageId: state.pathParameters['id'] ?? '',
          success: false,
        ),
      ),
      ShellRoute(
        builder: (_, _, child) => _MainShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => const HomeScreen(),
          ),
          GoRoute(
            path: '/workout',
            builder: (_, _) => const WorkoutSessionScreen(),
          ),
          GoRoute(
            path: '/explore',
            builder: (_, _) => const ExploreScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (_, _) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/trainer/:username',
            builder: (_, state) {
              final username = state.pathParameters['username'] ?? '';
              return TrainerDetailScreen(username: username);
            },
          ),
        ],
      ),
    ],
  );
}

// ── Shell with bottom navigation ──

class _MainShell extends StatelessWidget {
  final Widget child;
  const _MainShell({required this.child});

  int _currentIndex(String location) {
    if (location.startsWith('/workout')) return 1;
    if (location.startsWith('/explore')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex(location),
        onTap: (i) {
          switch (i) {
            case 0: context.go('/');
            case 1: context.go('/workout');
            case 2: context.go('/explore');
            case 3: context.go('/profile');
          }
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.mutedText,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            activeIcon: Icon(Icons.fitness_center_rounded),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ── Deep link screens ──

class _StripeReturnScreen extends StatelessWidget {
  const _StripeReturnScreen();

  @override
  Widget build(BuildContext context) {
    // Stripe redirect handling — in a real flow this would verify
    // the payment intent status and navigate accordingly.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/');
    });
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class _PackageResultScreen extends StatelessWidget {
  final String packageId;
  final bool success;

  const _PackageResultScreen({
    required this.packageId,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZIRO.FIT')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                success ? Icons.check_circle_outline : Icons.cancel_outlined,
                size: 80,
                color: success ? Colors.green : Colors.redAccent,
              ),
              const SizedBox(height: 24),
              Text(
                success ? 'Payment Successful!' : 'Payment Cancelled',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                success
                    ? 'Your package has been purchased successfully.'
                    : 'The payment was cancelled. No charges were made.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
