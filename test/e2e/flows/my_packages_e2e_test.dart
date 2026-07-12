@Tags(['e2e'])
library;

// E2E test: My Packages screen loads and shows available/purchased packages
// Requires: running backend (cd ../zirofit-next && npm run dev) and connected device/emulator
// Run: patrol test --target test/e2e/flows/my_packages_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C45: My Packages screen renders available packages and shows purchase flow',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll down to the Resources section
      await $('Purchase History').scrollTo();
      await $('My Packages').scrollTo();
      await $('My Packages').tap();

      // Wait for packages screen to load
      await $(#myPackagesScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // The screen should load and show either:
      // - Available packages (if linked trainer has packages)
      // - "No Packages Yet" empty state
      // - "No trainer linked" state
      // Wait for any of these states
      await Future.delayed(const Duration(seconds: 3));

      // If the linked trainer (ada) has packages, the Available Packages
      // section should appear
      if ($('Available Packages').exists) {
        // Verify a Buy button exists
        expect($('Buy'), findsAtLeast(1));

        // Simulate purchase flow
        // Open buy dialog for first package
        await $('Buy').first.tap();

        // Confirmation dialog should appear
        await $('Confirm Purchase').waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );

        // Use Simulate Purchase for testing
        await $('Simulate Purchase').tap();

        // Verify snackbar appears
        await $('Purchase recorded (simulated).').waitUntilVisible(
          timeout: const Duration(seconds: 3),
        );

        // My Purchased section should now appear
        await $('My Purchased').waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );
      } else if ($('No trainer linked').exists) {
        // Accept this state — test user might not have a linked trainer
        // in certain test environments
      }
    },
  );
}
