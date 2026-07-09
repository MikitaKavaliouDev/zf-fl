@Tags(['e2e'])
library;

// E2E test: Navigate to trainer profile and verify profile sections
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_profile_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C24: Trainer profile view renders all sections',
    (PatrolIntegrationTester $) async {
      await login($);

      // Coach card appears for the linked client (Ada)
      await $(#coachCard).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap the coach card to navigate to the trainer detail screen
      await $(#coachCard).tap();

      // Wait for the trainer detail screen to load
      await $(#trainerDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify the connect button is visible
      await $(#connectButton).waitUntilVisible();
    },
  );
}
