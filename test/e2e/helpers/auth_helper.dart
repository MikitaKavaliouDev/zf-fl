import 'package:patrol/patrol.dart';

import 'permission_helper.dart';
import 'test_credentials.dart';

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
