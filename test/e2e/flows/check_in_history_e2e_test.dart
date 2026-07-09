@Tags(['e2e'])
library;

// E2E test: View check-in history → Detail
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/check_in_history_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C29: View check-in history → Detail',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to check-in history from home
      await $(#checkInBanner).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#checkInBanner).tap();
      await $(#checkInScreen).waitUntilVisible();

      // Navigate to history
      await $(#checkInHistoryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap on first history item to view detail
      await $(#checkInDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
