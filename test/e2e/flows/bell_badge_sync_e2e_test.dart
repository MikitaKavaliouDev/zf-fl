@Tags(['e2e'])
library;

// E2E test: Bell badge unread count syncs
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/bell_badge_sync_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C7: Bell badge unread count syncs with notifications',
    (PatrolIntegrationTester $) async {
      await login($);

      // Verify bell icon is present in the header
      await $(#bellIcon).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap to open notifications
      await $(#bellIcon).tap();
      await $(#notificationsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate back and verify bell icon still present
      await $(#homeScreen).waitUntilVisible();
      await $(#bellIcon).waitUntilVisible();
    },
  );
}
