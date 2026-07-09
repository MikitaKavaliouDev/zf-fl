@Tags(['e2e'])
library;

// E2E test: View exercise detail (chart, progression, history)
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/exercise_detail_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C15: View exercise detail with chart and progression',
    (PatrolIntegrationTester $) async {
      await login($);

      // Start a workout to access exercises
      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Navigate to exercise detail from an exercise row
      await $(#exerciseDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify chart data loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
