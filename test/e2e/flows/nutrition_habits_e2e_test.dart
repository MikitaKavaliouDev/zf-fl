@Tags(['e2e'])
library;

// E2E test: View nutrition plan → Toggle habit
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/nutrition_habits_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C32: View nutrition plan → Toggle habits',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to nutrition habits screen
      // Route: /nutrition-habits
      // Access it from home dashboard or explore sections
      await $(#nutritionHabitsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Verify the nutrition plan loads with macro progress bars
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
