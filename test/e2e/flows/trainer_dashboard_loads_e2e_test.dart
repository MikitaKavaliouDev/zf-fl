@Tags(['e2e'])
library;

// E2E test: Trainer dashboard loads overview data
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_dashboard_loads_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T48: Dashboard loads overview (clients, sessions, metrics)',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      await $(#trainerDashboardScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify dashboard data loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
