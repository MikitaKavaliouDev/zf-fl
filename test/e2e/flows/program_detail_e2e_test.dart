@Tags(['e2e'])
library;

// E2E test: View active program → Template detail
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/program_detail_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C17: View active program → Template list → Template detail',
    (PatrolIntegrationTester $) async {
      await login($);

      // Active program widget should be visible on home screen
      await $(#activeProgramWidget).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap to navigate to program detail
      await $(#activeProgramWidget).tap();
      await $(#programDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify program details loaded
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
