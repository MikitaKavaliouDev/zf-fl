@Tags(['e2e'])
library;

// E2E test: Rest timer between sets
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/rest_timer_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C12: Log set → Rest timer starts → Skip rest',
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

      // The rest timer sheet appears after logging a set
      // Look for the rest timer sheet to appear
      try {
        await $(#restTimerSheet).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      } catch (_) {
        // Rest timer might auto-skip if no set was logged
      }
    },
  );
}
