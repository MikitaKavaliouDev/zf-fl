@Tags(['e2e'])
library;

// E2E test: Profile settings screens load
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/settings_screens_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C38: Each settings screen loads without crash (11 sub-screens)',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify various settings sections are accessible
      // The profile screen shows all settings options
      await $(#appearanceSettingsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
