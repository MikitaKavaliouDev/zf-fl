import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/di/injection.dart' as di;
import 'core/logging/state_logger.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/explore/cubit/explore_cubit.dart';
import 'features/explore/cubit/trainer_discovery_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/notifications/cubit/notifications_cubit.dart';
import 'features/trainers/cubit/trainer_list_cubit.dart';
import 'features/trainers/cubit/workout_session_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up structured logging of state changes.
  Bloc.observer = StateLogger();

  // Initialize dependency injection.
  di.initDependencies();

  runApp(const ZiroFitApp());
}

class ZiroFitApp extends StatefulWidget {
  const ZiroFitApp({super.key});

  @override
  State<ZiroFitApp> createState() => _ZiroFitAppState();
}

class _ZiroFitAppState extends State<ZiroFitApp> {
  late final AuthCubit _authCubit;
  late final HomeCubit _homeCubit;
  late final TrainerListCubit _trainerListCubit;
  late final WorkoutSessionCubit _workoutSessionCubit;
  late final ExploreCubit _exploreCubit;
  late final TrainerDiscoveryCubit _trainerDiscoveryCubit;
  late final NotificationsCubit _notificationsCubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authCubit = di.getIt<AuthCubit>();
    _homeCubit = di.getIt<HomeCubit>();
    _trainerListCubit = di.getIt<TrainerListCubit>();
    _workoutSessionCubit = di.getIt<WorkoutSessionCubit>();
    _exploreCubit = di.getIt<ExploreCubit>();
    _trainerDiscoveryCubit = di.getIt<TrainerDiscoveryCubit>();
    _notificationsCubit = di.getIt<NotificationsCubit>();
    _router = createAppRouter(_authCubit);
    // Check auth status on first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit.checkAuthStatus();
      _notificationsCubit.fetchNotifications();
    });
  }

  @override
  void dispose() {
    _authCubit.close();
    _homeCubit.close();
    _trainerListCubit.close();
    _workoutSessionCubit.close();
    _exploreCubit.close();
    _trainerDiscoveryCubit.close();
    _notificationsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authCubit),
        BlocProvider.value(value: _homeCubit),
        BlocProvider.value(value: _trainerListCubit),
        BlocProvider.value(value: _workoutSessionCubit),
        BlocProvider.value(value: _exploreCubit),
        BlocProvider.value(value: _trainerDiscoveryCubit),
        BlocProvider.value(value: _notificationsCubit),
      ],
      child: MaterialApp.router(
        title: 'ZIRO.FIT',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
