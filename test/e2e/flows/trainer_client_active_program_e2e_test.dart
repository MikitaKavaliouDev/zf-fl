@Tags(['e2e'])
library;

// E2E test: Trainer views client active program
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_client_active_program_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T54: View client active program',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Clients tab
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap first client
      await $(find.byType(ListTile)).first.tap();
      await $(#trainerClientDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to program section
      await $(find.text('Programs')).tap();
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
