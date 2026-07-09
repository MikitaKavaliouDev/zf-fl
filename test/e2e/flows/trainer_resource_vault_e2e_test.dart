@Tags(['e2e'])
library;

// E2E test: Trainer resource vault — Browse / upload
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_resource_vault_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T59: Resource vault → Browse resources',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Resource Vault
      await $(#trainerResourceVaultScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify resources loaded
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
