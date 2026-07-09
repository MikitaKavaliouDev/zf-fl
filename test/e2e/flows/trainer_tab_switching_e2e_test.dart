@Tags(['e2e'])
library;

// E2E test: Trainer switches between all 5 shell tabs
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_tab_switching_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T47: Switch between all 5 trainer tabs — each loads data',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Verify dashboard loaded
      await $(#trainerDashboardScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to Calendar tab (index 0)
      await $('Calendar').tap();
      await $(#trainerCalendarScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to Programs tab (index 1)
      await $('Programs').tap();
      await $(#trainerProgramsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to Clients tab (index 3)
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to More tab (index 4)
      await $('More').tap();
      await Future.delayed(const Duration(seconds: 2));

      // Switch back to Dashboard tab (index 2)
      await $('Dashboard').tap();
      await $(#trainerDashboardScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
    },
  );
}
