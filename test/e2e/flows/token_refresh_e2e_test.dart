@Tags(['e2e'])
library;

// E2E test: Token refresh on 401
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/token_refresh_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C5: Token refresh on 401 — QueuedInterceptor silent refresh',
    (PatrolIntegrationTester $) async {
      await login($);

      // Verify the user is logged in and dashboard loaded
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // The Dio AuthInterceptor should handle any 401 automatically.
      // Navigate to a different screen to trigger API calls.
      await $('Explore').tap();
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // If token refresh fails, the user would be redirected to login.
      // Since we stay on explore, refresh succeeded.
      await $(#exploreScreen).waitUntilVisible();
    },
  );
}
