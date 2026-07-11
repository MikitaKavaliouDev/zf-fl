import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'core/di/injection.dart' as di;
import 'core/logging/state_logger.dart';
import 'core/push/push_service.dart';
import 'core/refresh/refresh_tracker.dart';
import 'core/router/app_router.dart';
import 'core/settings/appearance_settings_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/cubit/auth_state.dart';
import 'features/daily_targets/cubit/daily_targets_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/cubit/program_cubit.dart';
import 'features/notifications/cubit/notifications_cubit.dart';
import 'features/profile/cubit/appearance_cubit.dart';
import 'features/profile/cubit/appearance_state.dart';
import 'features/sync/cubit/sync_cubit.dart';
import 'features/sync/cubit/sync_state.dart';
import 'features/trainers/cubit/workout_session_cubit.dart';
import 'features/voice_coach/cubit/voice_coach_cubit.dart';
import 'firebase_options.dart';

/// Top-level background message handler for FCM.
///
/// Runs in its own isolate when a push arrives while the app is terminated.
/// Must be registered before [Firebase.initializeApp] and must be a
/// top-level function annotated with `@pragma('vm:entry-point')`.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  developer.log('[Push Background] ${message.messageId}', name: 'push');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register background message handler BEFORE Firebase init.
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize Firebase with platform-specific config.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  // Initialize push service and register FCM token.
  final pushService = PushService(flutterLocalNotificationsPlugin);
  di.getIt.registerSingleton(pushService);
  unawaited(pushService.initialize());

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
  late final AppearanceCubit _appearanceCubit;
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
    _appearanceCubit = di.getIt<AppearanceCubit>();
    _queryClient = di.getIt<QueryClient>();
    _router = createAppRouter(_authCubit);
    // Check auth status on first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit.checkAuthStatus();
      // Load persisted appearance preferences (theme, text size, reduce motion).
      _appearanceCubit.load();
      // Wire push notification tap navigation to GoRouter.
      di.getIt<PushService>().onNavigate = (payload) {
        try {
          if (payload.startsWith('zirofitapp://')) {
            final path = Uri.parse(payload).path;
            _router.go(path);
          } else {
            // referenceId-based pushes: navigate to a generic handler
            // TODO: Map referenceId to specific screen via PuhNotificationData.type
            developer.log('Push tap — referenceId, no route mapping yet: $payload', name: 'push');
          }
        } catch (e) {
          developer.log('Push tap navigation error: $e', name: 'push');
        }
      };
    });
    // React to auth state changes for the app lifecycle.
    // This subscription lives for the entire app session (never cancelled)
    // so logout → re-auth flows work correctly.
    _authSubscription = _authCubit.stream.listen((state) {
      if (state is AuthAuthenticated) {
        // Re-register push token after successful auth (covers login / re-auth).
        // Uses lightweight reRegisterToken(), not full initialize().
        unawaited(di.getIt<PushService>().reRegisterToken());
        _notificationsCubit.fetchNotifications();
        // Cold-start / re-auth: check if there's an active workout session.
        _workoutSessionCubit.loadCurrent();
        // Configure Voice Coach with the authenticated user ID.
        _voiceCoachCubit.configure(userId: state.user.id);
      } else if (state is AuthUnauthenticated) {
        // Logged out — reset the workout session cubit so any active timer
        // and session state are cleaned up. The AuthCubit already cleared
        // ResponseCache, Drift, and tanquery — screens will refetch fresh
        // data on their next mount.
        _workoutSessionCubit.reset();
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
    _appearanceCubit.close();
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
        BlocProvider.value(value: _appearanceCubit),
      ],
      child: DartQueryProvider(
        client: _queryClient,
        child: BlocBuilder<AppearanceCubit, AppearanceState>(
          builder: (context, appearance) {
            return MaterialApp.router(
            title: 'ZIRO.FIT',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.lightTheme,
            themeMode: appearance.themeMode == AppThemeOption.system
                ? ThemeMode.system
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            builder: (context, child) {
              // Apply text scale factor and reduce motion globally.
              final textScale = switch (appearance.textScale) {
                TextScaleOption.small => 0.85,
                TextScaleOption.defaultScale => 1.0,
                TextScaleOption.large => 1.15,
              };
              child = MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(textScale),
                  disableAnimations: appearance.reduceMotion,
                ),
                child: child!,
              );
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
