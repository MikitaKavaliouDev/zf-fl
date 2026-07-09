@Tags(['e2e'])
library;

// E2E test: View workout history → Session detail
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/workout_history_detail_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C14: Navigate to workout history → View session detail',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Workout tab (index 1 in bottom nav)
      await $('Workout').tap();
      await $(#workoutHistoryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify history list is visible
      // Tap on the first session to view detail
      await $(find.byType(ListTile)).first.tap();

      // Should navigate to completed session detail
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
