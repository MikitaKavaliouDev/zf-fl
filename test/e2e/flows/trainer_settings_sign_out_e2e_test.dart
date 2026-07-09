@Tags(['e2e'])
library;

// E2E test: Trainer profile settings → Sign out
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_settings_sign_out_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T62: Trainer profile settings → Sign out',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to More tab (settings)
      await $('More').tap();
      await $(#trainerMoreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Sign out
      await $(find.text('Sign Out')).scrollTo();
      await $(find.text('Sign Out')).tap();

      // Verify redirect to login
      await $(#loginScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
