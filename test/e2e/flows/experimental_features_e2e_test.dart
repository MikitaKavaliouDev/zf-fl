@Tags(['e2e'])
library;

// E2E test: Experimental features toggles are interactive
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/experimental_features_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C41: Experimental features toggles can be switched on and off',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to experimental features section
      await $(#experimentalFeaturesSection).scrollTo();
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Tap "Custom App Mode" switch — it starts as OFF (false).
      // The Switch widget is inside the row. Tap its label to toggle.
      await $('Custom App Mode').tap();
      // After toggling, wait for state to settle
      await $.pump();

      // Verify the section is still visible (no crash after toggle)
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 3),
      );

      // Tap "Daily Exercise Targets" switch
      await $('Daily Exercise Targets').tap();
      await $.pump();

      // Verify the section remains intact
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 3),
      );
    },
  );
}
