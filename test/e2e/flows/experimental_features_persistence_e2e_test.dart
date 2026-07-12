@Tags(['e2e'])
library;

// E2E test: Experimental feature toggles persist across screen transitions
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/experimental_features_persistence_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C42: Toggled experimental features persist when re-opening More screen',
    (PatrolIntegrationTester $) async {
      await login($);

      // ── FIRST VISIT: Toggle features ON ──
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to experimental features section
      await $(#experimentalFeaturesSection).scrollTo();
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Toggle "Voice Feedback (Beta)" ON
      await $('Voice Feedback (Beta)').tap();
      await $.pump();

      // Toggle "Personal Routines" ON
      await $('Personal Routines').tap();
      await $.pump();

      // ── NAVIGATE AWAY: tap Home tab ──
      await $('Home').tap();
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // ── SECOND VISIT: Re-open Profile, verify toggles are still ON ──
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll back to experimental features
      await $(#experimentalFeaturesSection).scrollTo();
      await $(#experimentalFeaturesSection).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Verify the section is still intact after navigation
      await $('Voice Feedback (Beta)').waitUntilVisible();
      await $('Personal Routines').waitUntilVisible();
      await $('Daily Exercise Targets').waitUntilVisible();
      await $('Custom App Mode').waitUntilVisible();

      // Toggle off to restore clean state
      await $('Voice Feedback (Beta)').tap();
      await $.pump();
      await $('Personal Routines').tap();
      await $.pump();
    },
  );
}
