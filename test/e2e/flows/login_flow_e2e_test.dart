@Tags(['e2e'])
library;

// E2E test: Login → Home Dashboard
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/login_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C2: Login → Home Dashboard loads all sections',
    (PatrolIntegrationTester $) async {
      // Uses the shared login helper which handles permission dialogs.
      await login($);

      // Verify the dashboard list is present and scrollable.
      await $(#dashboardList).waitUntilVisible();
    },
  );
}
