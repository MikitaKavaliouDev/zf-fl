@Tags(['e2e'])
library;

// E2E test: Connect to trainer (unlinked client → explore)
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/connect_to_trainer_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/test_credentials.dart';

void main() {
  patrolTest(
    'C25: Unlinked client browses explore → trainer discovery',
    (PatrolIntegrationTester $) async {
      // Use unlinked client to test fresh connect flow
      await login($, email: TestCredentials.clientUnlinkedEmail);

      // Navigate to Explore tab via bottom nav
      await $('Explore').tap();
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
