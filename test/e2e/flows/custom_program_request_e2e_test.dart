@Tags(['e2e'])
library;

// E2E test: Send custom program request to trainer
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/custom_program_request_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C27: Send custom program request to trainer',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate via coach card to trainer profile
      await $(#coachCard).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#coachCard).tap();
      await $(#trainerDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Open custom program request sheet
      await $(#customProgramRequestSheet).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
    },
  );
}
