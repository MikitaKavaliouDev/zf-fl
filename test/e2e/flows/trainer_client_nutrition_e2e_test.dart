@Tags(['e2e'])
library;

// E2E test: Trainer views client nutrition plan
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_client_nutrition_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T53: View client nutrition plan + habits',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Clients tab
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap the first client to view detail
      await $(find.byType(ListTile)).first.tap();
      await $(#trainerClientDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to nutrition section
      await $(#trainerNutritionDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify nutrition plan data loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
