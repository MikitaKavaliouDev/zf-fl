@Tags(['e2e'])
library;

// E2E test: Save workout session as template
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/save_template_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C16: Save session as template',
    (PatrolIntegrationTester $) async {
      await login($);

      // Start a workout
      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Tap save as template button
      await $(#saveAsTemplateButton).tap();

      // Template dialog appears
      await $(#saveAsTemplateDialog).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
    },
  );
}
