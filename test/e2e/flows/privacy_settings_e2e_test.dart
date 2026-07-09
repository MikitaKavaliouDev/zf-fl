@Tags(['e2e'])
library;

// E2E test: Update privacy settings
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/privacy_settings_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C36: Update privacy settings',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to data privacy screen
      await $(#dataPrivacyScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
