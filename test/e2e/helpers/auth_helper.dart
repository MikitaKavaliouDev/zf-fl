import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:patrol/patrol.dart';
import 'package:ziro_fit/core/di/injection.dart' as di;
import 'package:ziro_fit/core/push/push_service.dart';
import 'package:ziro_fit/main.dart';

import 'permission_helper.dart';
import 'test_credentials.dart';

/// Sets up the minimum main() environment — DI + manually registered
/// singletons — so _ZiroFitAppState.initState() doesn't crash when it
/// resolves GetIt lookups for PushService etc.
void _ensureAppEnvironment() {
  // Initialize dependency injection (idempotent via try-catch).
  try {
    di.initDependencies();
  } catch (_) {
    // Already initialized — OK.
  }

  // Register manual singletons that main() normally registers before runApp().
  // These are NOT registered by @injectable / initDependencies().

  if (!di.getIt.isRegistered<FlutterLocalNotificationsPlugin>()) {
    final plugin = FlutterLocalNotificationsPlugin();
    di.getIt.registerSingleton<FlutterLocalNotificationsPlugin>(plugin);
  }

  if (!di.getIt.isRegistered<PushService>()) {
    final pushService = PushService(di.getIt<FlutterLocalNotificationsPlugin>());
    di.getIt.registerSingleton<PushService>(pushService);
  }
}

/// Logs in with the given [email] and [password] using the Patrol tester [$].
///
/// Waits for the home screen to appear after successful login.
/// If already on the home screen (logged in from previous test), returns
/// immediately.
Future<void> login(
  PatrolIntegrationTester $, {
  String email = TestCredentials.clientAdaEmail,
  String password = TestCredentials.defaultPassword,
}) async {
  _ensureAppEnvironment();

  // Pump the app's widget tree — test_bundle.dart does NOT call runApp() so
  // the Flutter widget tree would otherwise be empty and $() finders would
  // never find anything.
  await $.tester.pumpWidget(const ZiroFitApp());
  await $.tester.pumpAndSettle();

  if ($(#homeScreen).exists) return;

  await $(#loginScreen).waitUntilVisible(
    timeout: const Duration(seconds: 10),
  );

  await $(#emailField).enterText(email);
  await $(#passwordField).enterText(password);
  await $(#loginButton).tap();

  await grantVisiblePermission($);

  await $(#homeScreen).waitUntilVisible(
    timeout: const Duration(seconds: 15),
  );
}

/// Logs in as a trainer using [TestCredentials.trainerEmail].
///
/// Waits for the trainer dashboard screen to appear.
/// If already on the trainer dashboard, returns immediately.
Future<void> loginAsTrainer(
  PatrolIntegrationTester $, {
  String email = TestCredentials.trainerEmail,
  String password = TestCredentials.defaultPassword,
}) async {
  _ensureAppEnvironment();

  // Pump the app's widget tree.
  await $.tester.pumpWidget(const ZiroFitApp());
  await $.tester.pumpAndSettle();

  if ($(#trainerDashboardScreen).exists) return;

  await $(#loginScreen).waitUntilVisible(
    timeout: const Duration(seconds: 10),
  );

  await $(#emailField).enterText(email);
  await $(#passwordField).enterText(password);
  await $(#loginButton).tap();

  await grantVisiblePermission($);

  await $(#trainerDashboardScreen).waitUntilVisible(
    timeout: const Duration(seconds: 15),
  );
}
