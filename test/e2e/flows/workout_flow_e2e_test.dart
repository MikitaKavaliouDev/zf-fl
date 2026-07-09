@Tags(['e2e'])
library;

// E2E test: Start workout → Log sets → Finish
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/workout_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C8: Start workout → Log sets → Finish',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      await $(#finishWorkoutButton).tap();

      // The FinishWorkoutDialog appears with 3 options.
      // Tap "Complete Unfinished Sets" to finish the workout.
      await $('Complete Unfinished Sets').waitUntilVisible(
        timeout: const Duration(seconds: 3),
      );
      await $('Complete Unfinished Sets').tap();
    },
  );
}
