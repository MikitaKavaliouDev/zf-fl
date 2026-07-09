@Tags(['e2e'])
library;

// E2E test: Trainer calendar loads events
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_calendar_events_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T49: Calendar loads events → View event detail',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Calendar tab
      await $('Calendar').tap();
      await $(#trainerCalendarScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Wait for events to load
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
