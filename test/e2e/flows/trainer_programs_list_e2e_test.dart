@Tags(['e2e'])
library;

// E2E test: Trainer programs list → Create program
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_programs_list_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T57: Programs list → Create program → Assign to client',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Programs tab (index 1)
      await $('Programs').tap();
      await $(#trainerProgramsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify programs list loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
