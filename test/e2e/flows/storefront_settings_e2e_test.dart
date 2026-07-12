@Tags(['e2e'])
library;

// E2E test: Trainer navigates to Storefront Settings screen
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/storefront_settings_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'CX: Trainer can view Storefront Settings screen',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to More tab (settings)
      await $('More').tap();
      await $(#trainerMoreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to and tap Storefront Settings row
      await $('Storefront Settings').scrollTo();
      await $('Storefront Settings').tap();

      // Verify the Storefront Settings screen is visible
      await $('Storefront Settings').waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify sections render (these are section titles in the loaded UI)
      expect($('Packages'), findsOneWidget);
      expect($('Services'), findsOneWidget);
      expect($('Payments'), findsOneWidget);
    },
  );
}
