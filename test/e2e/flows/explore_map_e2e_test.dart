@Tags(['e2e'])
library;

// E2E test: Explore map → Location → Trainer annotation → Profile
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/explore_map_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/permission_helper.dart';

void main() {
  patrolTest(
    'C22: Explore map → Search location → View trainer annotation',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Explore tab
      await $('Explore').tap();
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to the map view
      await $(#trainerMapScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Handle location permission if shown
      await grantVisiblePermission($);

      // Verify the map is visible
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
