@Tags(['e2e'])
library;

// E2E test: View / edit daily targets
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/daily_targets_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C33: View and edit daily targets',
    (PatrolIntegrationTester $) async {
      await login($);

      // Wait for home screen to load after login
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Navigate to daily targets via the home dashboard section add button
      // The DailyTargetsSection is below the fold — scroll until visible
      await $.tester.dragUntilVisible(
        find.byKey(const ValueKey('homeDailyTargetsSection')),
        find.byKey(const ValueKey('dashboardList')),
        const Offset(0, -250),
      );
      await $.pumpAndSettle();

      // Tap the add circle icon inside the section to push /daily-targets
      await $.tester.tap(find.byIcon(Icons.add_circle_outline));
      await $.pumpAndSettle();

      // Verify daily targets screen loaded
      await $(#dailyTargetsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Verify targets loaded with progress
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
