@Tags(['e2e'])
library;

// E2E test: Trainer reviews client check-in
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_check_in_review_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T56: Review client check-in → View detail',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Clients tab
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to check-in review section
      await $(#trainerCheckInReviewScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
