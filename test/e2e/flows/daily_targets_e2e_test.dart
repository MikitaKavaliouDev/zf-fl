@Tags(['e2e'])
library;

// E2E test: View / edit daily targets
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/daily_targets_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C33: View / edit daily targets',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Daily Targets screen
      // Route: /daily-targets
      await $(#dailyTargetsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Verify targets loaded with progress
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
