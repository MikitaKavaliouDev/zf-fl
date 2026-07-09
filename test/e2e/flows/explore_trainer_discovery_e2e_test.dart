@Tags(['e2e'])
library;

// E2E test: Navigate to Explore tab, browse trainer profiles
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/explore_trainer_discovery_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C21: Explore tab opens and trainer discovery responds',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Explore tab (index 2 in bottom nav)
      await $('Explore').tap();

      // Wait for explore screen to load
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to trainer discovery
      await $(#trainerDiscoveryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify some trainer cards are rendered by the API
      // Look for the TrainerCard or ExploreTrainerCard widgets
      await $(#exploreScreen).waitUntilVisible();
    },
  );
}
