@Tags(['e2e'])
library;

// E2E test: Trainer adds a new client by email
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_add_client_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:uuid/uuid.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T51: Add new client (by email invitation)',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Clients tab (index 3)
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap the Add Client button (FAB or app bar action)
      await $(#trainerAddClientScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch to email tab and enter email
      final uniqueId = const Uuid().v4().substring(0, 8);
      await $(#emailField).enterText('e2e.invite.$uniqueId@ziro.fit');

      // Send invitation
      await $('Send Invitation').tap();

      // Wait for success state
      await $(#success_view).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
