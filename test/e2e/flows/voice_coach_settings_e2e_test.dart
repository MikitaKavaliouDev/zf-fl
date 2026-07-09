@Tags(['e2e'])
library;

// E2E test: Voice coach settings (P3)
// NOTE: Requires ElevenLabs agent — may not be available in test env.
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/voice_coach_settings_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C40: Voice coach settings screen loads',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile → AI Coach Settings
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to AI Coach settings
      await $(#aiCoachSettingsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
