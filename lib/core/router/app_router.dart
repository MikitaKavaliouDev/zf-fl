import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/analytics/cubit/analytics_cubit.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/cubit/auth_state.dart';
import '../../features/auth/presentation/email_verification_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/check_in/cubit/check_in_cubit.dart';
import '../../features/check_in/presentation/check_in_detail_screen.dart';
import '../../features/check_in/presentation/check_in_history_screen.dart';
import '../../features/check_in/presentation/check_in_screen.dart';
import '../../features/daily_targets/presentation/daily_targets_screen.dart';
import '../../features/explore/cubit/event_detail_cubit.dart';
import '../../features/explore/cubit/explore_map_cubit.dart';
import '../../features/explore/cubit/trainer_discovery_cubit.dart';
import '../../features/explore/presentation/event_detail_screen.dart';
import '../../features/explore/presentation/events_list_screen.dart';
import '../../features/explore/presentation/explore_screen.dart';
import '../../features/explore/presentation/trainer_discovery_screen.dart';
import '../../features/fitness_goals/presentation/fitness_goals_screen.dart';
import '../../features/home/data/models/active_program_response.dart';
import '../../features/home/data/models/program_detail_response.dart';
import '../../features/home/data/models/program_dto.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/my_routines_screen.dart';
import '../../features/home/presentation/program_detail_screen.dart';
import '../../features/home/presentation/routine_builder_screen.dart';
import '../../features/home/presentation/routine_scheduler_screen.dart';
import '../../features/home/presentation/template_detail_screen.dart';
import '../../features/home/presentation/templates_library_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/nutrition_habits/cubit/nutrition_habits_cubit.dart';
import '../../features/nutrition_habits/presentation/nutrition_habits_screen.dart';
import '../../features/profile/cubit/profile_config_cubit.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/settings_screens/contact_support_screen.dart';
import '../../features/profile/presentation/settings_screens/profile_config_screen.dart';
import '../../features/sharing/presentation/sharing_screen.dart';
import '../../features/trainer/cubit/trainer_calendar_cubit.dart';
import '../../features/trainer/cubit/trainer_check_in_review_cubit.dart';
import '../../features/trainer/cubit/trainer_client_detail_cubit.dart';
import '../../features/trainer/cubit/trainer_client_sessions_cubit.dart';
import '../../features/trainer/cubit/trainer_add_client_cubit.dart';
import '../../features/trainer/cubit/trainer_clients_cubit.dart';
import '../../features/trainer/cubit/trainer_dashboard_cubit.dart';
import '../../features/trainer/cubit/trainer_programs_cubit.dart';
import '../../features/trainer/presentation/calendar/trainer_calendar_screen.dart';
import '../../features/trainer/presentation/checkins/trainer_check_in_detail_screen.dart';
import '../../features/trainer/presentation/checkins/trainer_checkin_review_screen.dart';
import '../../features/trainer/presentation/clients/trainer_add_client_screen.dart';
import '../../features/trainer/presentation/clients/trainer_client_detail_screen.dart';
import '../../features/trainer/presentation/clients/trainer_client_history_screen.dart';
import '../../features/trainer/presentation/clients/trainer_clients_screen.dart';
import '../../features/trainer/presentation/nutrition/trainer_nutrition_detail_screen.dart';
import '../../features/trainer/presentation/dashboard/trainer_dashboard_screen.dart';
import '../../features/trainer/presentation/events/trainer_events_screen.dart';
import '../../features/trainer/data/models/trainer_program_brief_dto.dart';
import '../../features/trainer/presentation/programs/trainer_program_detail_screen.dart';
import '../../features/trainer/presentation/programs/trainer_programs_screen.dart';
import '../../features/trainer/presentation/recipes/trainer_recipes_screen.dart';
import '../../features/trainer/presentation/resources/trainer_resource_vault_screen.dart';
import '../../features/trainer/presentation/settings/trainer_more_screen.dart';
import '../../features/trainer/presentation/trainer_shell.dart';
import '../../features/trainers/cubit/exercise_detail_cubit.dart';
import '../../features/trainers/cubit/workout_session_cubit.dart';
import '../../features/trainers/cubit/workout_session_state.dart';
import '../../features/trainers/data/models/template_dto.dart';
import '../../features/trainers/presentation/completed_session_detail_screen.dart';
import '../../features/trainers/presentation/exercise_detail_screen.dart';
import '../../features/trainers/presentation/trainer_detail_screen.dart';
import '../../features/trainers/presentation/trainer_map_screen.dart';
import '../../features/trainers/presentation/widgets/workout_mini_player.dart';
import '../../features/trainers/presentation/workout_history_screen.dart';
import '../../features/trainers/presentation/workout_session_screen.dart';
import '../di/injection.dart';
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
    initialLocation: '/splash',
    redirect: (context, state) {
      final authState = authCubit.state;
      final location = state.matchedLocation;

      // While auth state is still being resolved, show the splash screen
      // instead of flashing the login screen.
      if (authState is AuthInitial || authState is AuthLoading) {
        return location == '/splash' ? null : '/splash';
      }

      final isTrainer = authState is AuthAuthenticated && authState.isTrainer;

      final loggedIn =
          authState is AuthAuthenticated ||
          authState is AuthNeedsOnboarding ||
          authState is AuthRegisterSuccess ||
          authState is AuthPendingRole;
      final onAuthPage = location == '/login' ||
          location == '/register' ||
          location == '/verify-email' ||
          location == '/onboarding';
      final onTrainerPage = location.startsWith('/trainer/');
      // Shared routes that both clients and trainers can access
      // (e.g. mini player → full-screen workout session)
      final onSharedRoute = location == '/workout/session' ||
          location == '/workout/history' ||
          location.startsWith('/workout/exercise/');

      // Auth resolved but still on splash → redirect to the right place.
      if (location == '/splash') {
        if (!loggedIn) return '/login';
        return isTrainer ? '/trainer/dashboard' : '/';
      }

      // Not logged in → auth pages only.
      if (!loggedIn && !onAuthPage) return '/login';

      // Logged in → redirect away from auth pages.
      if (loggedIn && onAuthPage) {
        // Keep user on verify-email if they just registered or have a pending role
        if ((authState is AuthRegisterSuccess || authState is AuthPendingRole) &&
            location == '/verify-email') {
          return null;
        }
        // Keep user on onboarding if they need to complete it
        if (authState is AuthNeedsOnboarding && location == '/onboarding') {
          return null;
        }
        return isTrainer ? '/trainer/dashboard' : '/';
      }

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

      // Trainer on client page → trainer dashboard.
      // Exclude shared routes (workout session, history, etc.) so the
      // mini-player → full-screen navigation works for trainers too.
      if (isTrainer && !onTrainerPage && !onAuthPage && !onSharedRoute) {
        return '/trainer/dashboard';
      }

      // Client on trainer page → client home.
      if (loggedIn && !isTrainer && onTrainerPage) {
        return '/';
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
      GoRoute(
        path: '/splash',
        builder: (_, _) => const SplashScreen(),
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
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) =>
            _MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (_, _) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/workout',
                builder: (_, _) => const WorkoutHistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                builder: (_, _) => const ExploreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (_, _) => const ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/analytics',
                builder: (_, _) => BlocProvider(
                  create: (_) => getIt<AnalyticsCubit>(),
                  child: const AnalyticsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      // ── Trainer shell (5 tabs) ──
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) =>
            TrainerShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trainer/calendar',
                builder: (_, _) => BlocProvider<TrainerCalendarCubit>(
                  create: (_) => getIt<TrainerCalendarCubit>(),
                  child: const TrainerCalendarScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trainer/programs',
                builder: (_, _) => BlocProvider<TrainerProgramsCubit>(
                  create: (_) => getIt<TrainerProgramsCubit>(),
                  child: const TrainerProgramsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trainer/dashboard',
                builder: (_, _) => BlocProvider<TrainerDashboardCubit>(
                  create: (_) => getIt<TrainerDashboardCubit>(),
                  child: const TrainerDashboardScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trainer/clients',
                builder: (_, _) => BlocProvider<TrainerClientsCubit>(
                  create: (_) => getIt<TrainerClientsCubit>(),
                  child: const TrainerClientsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trainer/more',
                builder: (_, _) => const TrainerMoreScreen(),
              ),
            ],
          ),
        ],
      ),
      // Explore sub-routes (full-screen, no bottom nav — matching iOS sheet behavior)
      GoRoute(
        path: '/explore/discovery',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<TrainerDiscoveryCubit>(
            create: (_) => getIt<TrainerDiscoveryCubit>(),
            child: TrainerDiscoveryScreen(
              initialQuery: state.extra is Map
                  ? (state.extra as Map)['query'] as String?
                  : null,
              initialSpecialty: state.extra is Map
                  ? (state.extra as Map)['specialty'] as String?
                  : null,
            ),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/explore/map',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<ExploreMapCubit>(
            create: (_) => getIt<ExploreMapCubit>(),
            child: const TrainerMapScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/explore/event/:id',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<EventDetailCubit>(
            create: (_) => getIt<EventDetailCubit>(),
            child: EventDetailScreen(
              eventId: state.pathParameters['id'] ?? '',
            ),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Events list (full-screen, no bottom nav — matches iOS EventsListView)
      GoRoute(
        path: '/explore/events',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EventsListViewScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Trainer client detail (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/clients/:id',
        builder: (_, state) {
          final clientId = state.pathParameters['id'] ?? '';
          return BlocProvider<TrainerClientDetailCubit>(
            create: (_) => getIt<TrainerClientDetailCubit>(),
            child: TrainerClientDetailScreen(clientId: clientId),
          );
        },
      ),
      // Trainer add client (full-screen, no bottom nav — matches iOS AddClientView)
      GoRoute(
        path: '/trainer/clients/add',
        builder: (_, _) => BlocProvider<TrainerAddClientCubit>(
          create: (_) => getIt<TrainerAddClientCubit>(),
          child: const TrainerAddClientScreen(),
        ),
      ),
      // Trainer client history (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/clients/:id/history',
        builder: (_, state) {
          final clientId = state.pathParameters['id'] ?? '';
          final clientName = state.extra as String? ?? 'History';
          return BlocProvider<TrainerClientSessionsCubit>(
            create: (_) => getIt<TrainerClientSessionsCubit>(),
            child: TrainerClientHistoryScreen(
              clientId: clientId,
              clientName: clientName,
            ),
          );
        },
      ),
      // Trainer program detail (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/programs/:id',
        builder: (_, state) {
          final programId = state.pathParameters['id'] ?? '';
          final program = state.extra as TrainerProgramBriefDto?;
          return BlocProvider<TrainerProgramsCubit>(
            create: (_) => getIt<TrainerProgramsCubit>(),
            child: TrainerProgramDetailScreen(
              programId: programId,
              program: program,
            ),
          );
        },
      ),
      // Trainer check-in review (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/checkins',
        builder: (_, _) => BlocProvider<TrainerCheckInReviewCubit>(
          create: (_) => getIt<TrainerCheckInReviewCubit>(),
          child: const TrainerCheckInReviewScreen(),
        ),
      ),
      // Trainer nutrition detail (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/clients/:id/nutrition',
        builder: (_, state) {
          final clientId = state.pathParameters['id'] ?? '';
          return TrainerNutritionDetailScreen(clientId: clientId);
        },
      ),
      // Trainer check-in detail (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/checkins/:id',
        builder: (_, state) {
          final checkInId = state.pathParameters['id'] ?? '';
          return TrainerCheckInDetailScreen(checkInId: checkInId);
        },
      ),
      // Trainer events (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/events',
        builder: (_, _) => const TrainerEventsScreen(),
      ),
      // Trainer resource vault (full-screen)
      GoRoute(
        path: '/trainer/resources',
        builder: (_, _) => const TrainerResourceVaultScreen(),
      ),
      // Trainer recipes (full-screen)
      GoRoute(
        path: '/trainer/recipes',
        builder: (_, _) => const TrainerRecipesScreen(),
      ),
      // Trainer detail (full-screen, no bottom nav)
      GoRoute(
        path: '/trainer/:username',
        builder: (_, state) {
          final username = state.pathParameters['username'] ?? '';
          return TrainerDetailScreen(username: username);
        },
      ),
      // Workout session (full-screen overlay, no bottom nav — matches iOS modal presentation)
      GoRoute(
        path: '/workout/session',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WorkoutSessionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Workout history routes (full-screen, no bottom nav)
      GoRoute(
        path: '/workout/history',
        builder: (_, _) => const WorkoutHistoryScreen(showAppBar: true),
      ),
      GoRoute(
        path: '/workout/history/:id',
        builder: (_, state) => CompletedSessionDetailScreen(
          sessionId: state.pathParameters['id'] ?? '',
        ),
      ),
      // Exercise detail (full-screen overlay, slide up from bottom)
      GoRoute(
        path: '/workout/exercise/:id',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<ExerciseDetailCubit>(
            create: (_) => getIt<ExerciseDetailCubit>(),
            child: ExerciseDetailScreen(
              exerciseId: state.pathParameters['id'] ?? '',
              exerciseName: state.extra is String ? state.extra as String : '',
            ),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Home sub-routes (full-screen, no bottom nav)
      GoRoute(
        path: '/home/check-in',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<CheckInCubit>(),
            child: const CheckInScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/home/program-detail',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ProgramDetailScreen(
            programDetail: state.extra is ProgramDetailResponse
                ? state.extra as ProgramDetailResponse
                : null,
            programDto: state.extra is ProgramDto
                ? state.extra as ProgramDto
                : state.extra is ActiveProgramResponse
                    ? ProgramDto(
                        id: (state.extra as ActiveProgramResponse)
                            .program
                            .id,
                        name: (state.extra as ActiveProgramResponse)
                            .program
                            .name,
                      )
                    : null,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Templates Library (matches iOS WorkoutTemplatesView)
      GoRoute(
        path: '/home/templates-library',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TemplatesLibraryScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Template Detail (matches iOS TemplateDetailView)
      GoRoute(
        path: '/home/template-detail',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: TemplateDetailScreen(
            template: state.extra as TemplateDto,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Routine Builder (create / edit)
      GoRoute(
        path: '/home/routine-builder',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: RoutineBuilderScreen(
            existingProgram: state.extra is ProgramDto
                ? state.extra as ProgramDto
                : null,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // Routine Scheduler (requires ProgramDto as extra)
      GoRoute(
        path: '/home/routine-scheduler',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: RoutineSchedulerScreen(
            program: state.extra as ProgramDto,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // My Routines list
      GoRoute(
        path: '/home/my-routines',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MyRoutinesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/home/notifications',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NotificationsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      // ── Wave 4: Settings sub-screens ──
      GoRoute(
        path: '/fitness-goals',
        builder: (_, _) => const FitnessGoalsScreen(),
      ),
      GoRoute(
        path: '/daily-targets',
        builder: (_, _) => const DailyTargetsScreen(),
      ),
      GoRoute(
        path: '/sharing',
        builder: (_, _) => const SharingScreen(),
      ),
      GoRoute(
        path: '/check-in-history',
        builder: (_, _) => BlocProvider(
          create: (_) => getIt<CheckInCubit>(),
          child: const CheckInHistoryScreen(),
        ),
      ),
      GoRoute(
        path: '/check-in-detail/:id',
        builder: (_, state) => BlocProvider(
          create: (_) => getIt<CheckInCubit>(),
          child: CheckInDetailScreen(
            checkInId: state.pathParameters['id'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/profile/config',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<ProfileConfigCubit>(),
            child: const ProfileConfigScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/contact-support',
        builder: (_, _) => const ContactSupportScreen(),
      ),
      // Nutrition & Habits (slide-up sheet, matches iOS)
      GoRoute(
        path: '/nutrition-habits',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<NutritionHabitsCubit>(),
            child: const NutritionHabitsScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}

// ── Shell with bottom navigation + mini player overlay ──

class _MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const _MainShell({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          // Mini player overlay — shown when a workout session is active and minimized.
          // Positioned above bottom nav (matches iOS: 90pt above tab bar).
          // Uses buildWhen to only rebuild on minimize/maximize transitions,
          // not on every timer tick.
          BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
            buildWhen: (previous, current) {
              final prevMinimized = previous is WorkoutSessionActive && previous.isMinimized;
              final currMinimized = current is WorkoutSessionActive && current.isMinimized;
              return prevMinimized != currMinimized;
            },
            builder: (context, state) {
              if (state is WorkoutSessionActive && state.isMinimized) {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 8,
                    ),
                    child: const WorkoutMiniPlayer(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart_rounded),
            label: 'Analytics',
          ),
        ],
      ),
    );
  }
}

// ── Placeholder screen for trainer tabs not yet implemented ──

class _PlaceholderTrainerScreen extends StatelessWidget {
  final String label;
  const _PlaceholderTrainerScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Text(
          '$label — coming soon',
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.mutedText,
          ),
        ),
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