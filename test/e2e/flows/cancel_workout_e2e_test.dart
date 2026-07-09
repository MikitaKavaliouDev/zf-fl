@Tags(['e2e'])
library;

// E2E test: Cancel workout flow
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/cancel_workout_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C11: Start workout → Cancel → Confirm cancellation',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Open cancel dialog
      await $(#cancelWorkoutDialog).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Confirm cancellation
      await $(#cancelWorkoutConfirmButton).tap();

      // Verify we're back to the home screen
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
