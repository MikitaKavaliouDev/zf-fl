import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'core/di/injection.dart' as di;
import 'core/logging/state_logger.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/cubit/auth_state.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/cubit/program_cubit.dart';
import 'features/notifications/cubit/notifications_cubit.dart';
import 'features/trainers/cubit/trainer_list_cubit.dart';
import 'features/trainers/cubit/workout_session_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local notifications plugin.
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(android: androidSettings, iOS: iosSettings),
  );

  // Set up structured logging of state changes.
  Bloc.observer = StateLogger();

  // Initialize dependency injection.
  di.initDependencies();

  // Register notification plugin as a singleton.
  di.getIt.registerSingleton(flutterLocalNotificationsPlugin);

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
  late final ProgramCubit _programCubit;
  late final TrainerListCubit _trainerListCubit;
  late final WorkoutSessionCubit _workoutSessionCubit;
  late final NotificationsCubit _notificationsCubit;
  late final QueryClient _queryClient;
  late final GoRouter _router;
  StreamSubscription<AuthState>? _authSubscription;

  @override
  void initState() {
    super.initState();
    _authCubit = di.getIt<AuthCubit>();
    _homeCubit = di.getIt<HomeCubit>();
    _programCubit = di.getIt<ProgramCubit>();
    _trainerListCubit = di.getIt<TrainerListCubit>();
    _workoutSessionCubit = di.getIt<WorkoutSessionCubit>();
    _notificationsCubit = di.getIt<NotificationsCubit>();
    _queryClient = QueryClient();
    _queryClient.mount();
    _router = createAppRouter(_authCubit);
    // Check auth status on first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit.checkAuthStatus();
    });
    // Fetch notifications only after auth state is resolved.
    _authSubscription = _authCubit.stream.listen((state) {
      if (state is AuthAuthenticated) {
        _notificationsCubit.fetchNotifications();
        // Cold-start: check if there's an active workout session.
        // If yes, the cubit auto-minimizes so the mini-player overlay
        // appears on the home screen with a synced timer — matching iOS.
        _workoutSessionCubit.loadCurrent();
        _authSubscription?.cancel();
      } else if (state is AuthUnauthenticated) {
        _authSubscription?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _authCubit.close();
    _homeCubit.close();
    _programCubit.close();
    _trainerListCubit.close();
    _workoutSessionCubit.close();
    _notificationsCubit.close();
    _queryClient.unmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authCubit),
        BlocProvider.value(value: _homeCubit),
        BlocProvider.value(value: _programCubit),
        BlocProvider.value(value: _trainerListCubit),
        BlocProvider.value(value: _workoutSessionCubit),
        BlocProvider.value(value: _notificationsCubit),
      ],
      child: DartQueryProvider(
        client: _queryClient,
        child: MaterialApp.router(
        title: 'ZIRO.FIT',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
      ),
    );
  }
}
