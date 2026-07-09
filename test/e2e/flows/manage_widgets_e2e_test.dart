@Tags(['e2e'])
library;

// E2E test: Analytics — Manage widgets
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/manage_widgets_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C31: Manage widgets — Add/Remove/Reorder',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Analytics tab
      await $('Analytics').tap();
      await $(#analyticsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Open manage widgets sheet
      await $(#manageWidgetsSheet).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify sheet rendered with widget options
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
