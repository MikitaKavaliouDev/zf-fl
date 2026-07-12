@Tags(['e2e'])
library;

// E2E test: Profile settings screens render without crash
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/settings_screens_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C38: Settings menu rows render on More screen',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify Preferences section rows are visible on the More screen
      await $('Appearance').waitUntilVisible();
      await $('Notifications').waitUntilVisible();
      await $('Data & Privacy').waitUntilVisible();
      await $('Permissions').waitUntilVisible();

      // Scroll to Experimental Features section and verify toggle labels
      await $(#experimentalFeaturesSection).scrollTo();
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
      await $('Daily Exercise Targets').waitUntilVisible();
      await $('Voice Feedback (Beta)').waitUntilVisible();
      await $('Personal Routines').waitUntilVisible();
      await $('Custom App Mode').waitUntilVisible();
    },
  );
}
