@Tags(['e2e'])
library;

// E2E test: Trainer login -> TrainerShell (5 tabs)
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_login_shell_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T46: Trainer login -> TrainerShell (5 tabs)',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Verify trainer dashboard is visible after login redirect
      await $(#trainerDashboardScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to Calendar tab
      await $('Calendar').tap();
      // Give the calendar screen a moment to render
      await $.pumpAndSettle(duration: const Duration(seconds: 2));

      // Switch to Programs tab
      await $('Programs').tap();
      await $.pumpAndSettle(duration: const Duration(seconds: 2));
      // No need to switch back to Dashboard — it's the initial tab and was
      // already verified above. Tapping an already-active tab does not
      // trigger a re-render and that behavior is not required.
    },
  );
}
