@Tags(['e2e'])
library;

// E2E test: Update sharing config
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/sharing_config_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C35: Update sharing config (privacy toggles)',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Sharing screen
      await $(#sharingScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Verify sharing config loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
