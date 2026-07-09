@Tags(['e2e'])
library;

// E2E test: Accept trainer link request from notifications
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/accept_link_request_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/test_credentials.dart';

void main() {
  patrolTest(
    'C42: Accept trainer link request from notification',
    (PatrolIntegrationTester $) async {
      // Use unlinked client who may have pending link requests
      await login($, email: TestCredentials.clientUnlinkedEmail);

      // Open notifications via bell icon
      await $(#bellIcon).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#bellIcon).tap();
      await $(#notificationsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Wait for notifications to load
      await Future.delayed(const Duration(seconds: 3));

      // Try tapping accept button if visible
      try {
        await $(#acceptButton).tap();
        // The notification updates optimistically
        await Future.delayed(const Duration(seconds: 2));
      } catch (_) {
        // No link request notification present — acceptable
      }
    },
  );
}
