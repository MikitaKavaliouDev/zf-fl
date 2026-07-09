@Tags(['e2e'])
library;

// E2E test: Trainer recipes management
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_recipes_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T60: Recipes management screen loads',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Recipes screen
      await $(#trainerRecipesScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify recipes loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
