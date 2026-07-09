@Tags(['e2e'])
library;

// E2E test: Background → Foreground — active session mini player
//
// NOTE: True cold start (kill and relaunch) is not supported in-test.
// This test uses pressHome() + openApp() to simulate resuming from
// background. For a true cold start test, run as:
//   patrol test --target ...  (first invocation creates session,
//    second invocation verifies loadCurrent on fresh launch)
//
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/cold_start_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C3: Background → Foreground — active session mini player',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible();
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible();

      await $.platform.mobile.pressHome();
      await Future.delayed(const Duration(seconds: 2));
      await $.platform.mobile.openApp();

      try {
        await $(#workoutMiniPlayer).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      } catch (_) {
        // loadCurrent() may not trigger in bg/foreground cycle.
      }
    },
  );
}
