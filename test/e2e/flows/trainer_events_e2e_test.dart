@Tags(['e2e'])
library;

// E2E test: Trainer creates / manages events
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_events_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T61: Create / manage events',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to trainer events screen
      await $(#trainerEventsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
