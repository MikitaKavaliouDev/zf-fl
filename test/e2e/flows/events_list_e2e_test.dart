@Tags(['e2e'])
library;

// E2E test: Browse events → Event detail
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/events_list_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C23: Browse events → Event detail',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Explore tab
      await $('Explore').tap();
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Find and tap a visible event card or event row
      await $(#exploreEventRow).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap to view event detail
      await $(#exploreEventRow).tap();
      await $(#eventDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
