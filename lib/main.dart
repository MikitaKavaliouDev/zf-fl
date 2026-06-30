import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'core/di/injection.dart' as di;
import 'core/logging/state_logger.dart';
import 'core/refresh/refresh_tracker.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/cubit/auth_state.dart';
import 'features/daily_targets/cubit/daily_targets_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/cubit/program_cubit.dart';
import 'features/notifications/cubit/notifications_cubit.dart';
import 'features/sync/cubit/sync_cubit.dart';
import 'features/sync/cubit/sync_state.dart';
import 'features/trainers/cubit/workout_session_cubit.dart';
import 'features/voice_coach/cubit/voice_coach_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local notifications plugin.
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosSettings = DarwinInitializationSettings();
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
  late final DailyTargetsCubit _dailyTargetsCubit;
  late final HomeCubit _homeCubit;
  late final ProgramCubit _programCubit;
  late final WorkoutSessionCubit _workoutSessionCubit;
  late final NotificationsCubit _notificationsCubit;
  late final SyncCubit _syncCubit;
  late final VoiceCoachCubit _voiceCoachCubit;
  late final QueryClient _queryClient;
  late final GoRouter _router;
  StreamSubscription<AuthState>? _authSubscription;

  @override
  void initState() {
    super.initState();
    _authCubit = di.getIt<AuthCubit>();
    _dailyTargetsCubit = di.getIt<DailyTargetsCubit>();
    _homeCubit = di.getIt<HomeCubit>();
    _programCubit = di.getIt<ProgramCubit>();
    _workoutSessionCubit = di.getIt<WorkoutSessionCubit>();
    _notificationsCubit = di.getIt<NotificationsCubit>();
    _syncCubit = di.getIt<SyncCubit>();
    _voiceCoachCubit = di.getIt<VoiceCoachCubit>();
    _queryClient = di.getIt<QueryClient>();
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
        // Configure Voice Coach with the authenticated user ID.
        _voiceCoachCubit.configure(userId: state.user.id);
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
    _dailyTargetsCubit.close();
    _homeCubit.close();
    _programCubit.close();
    _workoutSessionCubit.close();
    _notificationsCubit.close();
    _syncCubit.close();
    _voiceCoachCubit.close();
    _queryClient.unmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authCubit),
        BlocProvider.value(value: _dailyTargetsCubit),
        BlocProvider.value(value: _homeCubit),
        BlocProvider.value(value: _programCubit),
        BlocProvider.value(value: _workoutSessionCubit),
        BlocProvider.value(value: _notificationsCubit),
        BlocProvider.value(value: _syncCubit),
        BlocProvider.value(value: _voiceCoachCubit),
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
        builder: (context, child) {
          return BlocBuilder<SyncCubit, SyncState>(
            builder: (context, syncState) {
              return ListenableBuilder(
                listenable: RefreshTracker.instance,
                builder: (context, _) {
                  return Stack(
                    children: [
                      child!,
                      if (!syncState.isOnline)
                        const Positioned(
                          top: 0, left: 0, right: 0,
                          child: _ConnectivityBanner(),
                        ),
                      // Subtle syncing indicator when background refresh
                      // is in progress but we're not offline.
                      if (syncState.isOnline && RefreshTracker.instance.isRefreshing)
                        const Positioned(
                          top: 0, left: 0, right: 0,
                          child: _RefreshIndicator(),
                        ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      ),
    );
  }
}

/// Thin animated bar that appears at the top of the screen while a
/// background refresh is in progress (but connectivity is fine).
///
/// Auto-collapses after 4 seconds, similar to the connectivity banner.
class _RefreshIndicator extends StatefulWidget {
  const _RefreshIndicator();

  @override
  State<_RefreshIndicator> createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<_RefreshIndicator> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _expanded = true);
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) setState(() => _expanded = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _expanded ? 32 : 3,
        color: const Color(0xFF007AFF),
        child: _expanded
            ? Row(
                children: [
                  const SizedBox(width: 12),
                  const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Syncing...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class _ConnectivityBanner extends StatefulWidget {
  const _ConnectivityBanner();

  @override
  State<_ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<_ConnectivityBanner> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _expanded = true);
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) setState(() => _expanded = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _expanded ? 32 : 3,
        color: Colors.amber.shade700,
        child: _expanded
            ? Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.wifi_off_rounded, size: 14, color: Colors.white),
                  const SizedBox(width: 6),
                  const Text(
                    "You're offline",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.read<SyncCubit>().sync(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Retry',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
