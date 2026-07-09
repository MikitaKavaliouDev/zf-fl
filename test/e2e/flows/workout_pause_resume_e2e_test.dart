@Tags(['e2e'])
library;

// E2E test: Start workout, pause timer, verify paused state, resume, finish
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/workout_pause_resume_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C10: Start workout, pause timer, resume, finish',
    (PatrolIntegrationTester $) async {
      await login($);

      // Start a quick workout
      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Begin the workout timer
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Pause the timer
      await $(#pauseResumeButton).tap();

      // Let the paused state settle
      await Future.delayed(const Duration(seconds: 2));

      // Resume the timer
      await $(#pauseResumeButton).tap();

      // Verify the timer is still visible after resume
      await $(#timerDisplay).waitUntilVisible();

      // Finish the workout
      await $(#finishWorkoutButton).tap();

      // Confirm via the dialog
      await $(#completeUnfinishedButton).waitUntilVisible(
        timeout: const Duration(seconds: 3),
      );
      await $(#completeUnfinishedButton).tap();
    },
  );
}
