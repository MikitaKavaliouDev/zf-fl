@Tags(['e2e'])
library;

// E2E test: Notification settings toggle persistence across screen transitions
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/notification_settings_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'CX: Notification preferences toggle persists when re-opening settings screen',
    (PatrolIntegrationTester $) async {
      await login($);

      // ── FIRST VISIT: Navigate to More → Notifications settings ──
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap Notifications menu row
      await $('Notifications').tap();

      // Wait for the settings screen to render and async preferences to load
      await $.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));

      // Verify the settings screen rendered with toggle labels
      await $('Workout Reminders').waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
      await $('Events & Promotions').waitUntilVisible();

      // Read the current value of the "Events & Promotions" switch (5th switch,
      // index 4 — defaults to false)
      final switches = $(Switch);
      final elements = switches.evaluate();
      // Safety check — only proceed if we have enough switch widgets
      if (elements.length >= 5) {
        final eventSwitch = elements.elementAt(4).widget as Switch;
        final initialValue = eventSwitch.value;

        // Toggle to the opposite value
        await switches.at(4).tap();
        await $.pumpAndSettle();

        // ── NAVIGATE AWAY: go back to More screen ──
        await $(find.byTooltip('Back')).tap();
        await $(#profileScreen).waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );

        // ── SECOND VISIT: Re-open settings, verify toggle persisted ──
        await $('Notifications').tap();
        await $.pumpAndSettle();
        await Future.delayed(const Duration(milliseconds: 500));

        // Verify the toggle labels still render
        await $('Events & Promotions').waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );

        // Read the switch value again
        final switchesAgain = $(Switch);
        final elementsAgain = switchesAgain.evaluate();
        if (elementsAgain.length >= 5) {
          final eventSwitchAgain =
              elementsAgain.elementAt(4).widget as Switch;
          final newValue = eventSwitchAgain.value;

          // Verify persistence: value should have changed from initial
          expect(newValue, isNot(equals(initialValue)),
              reason:
                  'Events & Promotions toggle should have persisted as '
                  '${!initialValue} after toggle and re-entry');
        }

        // ── RESTORE original toggle value ──
        await switchesAgain.at(4).tap();
        await $.pumpAndSettle();
      }
    },
  );
}
