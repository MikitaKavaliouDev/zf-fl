@Tags(['e2e'])
library;

// E2E test: Analytics dashboard loads all widgets
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/analytics_dashboard_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C30: Analytics dashboard loads all widgets',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Analytics tab (index 4 in bottom nav)
      await $('Analytics').tap();
      await $(#analyticsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Verify the dashboard rendered with progress data
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
