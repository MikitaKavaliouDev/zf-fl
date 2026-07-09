@Tags(['e2e'])
library;

// E2E test: Register new user → Email verification
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/register_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:uuid/uuid.dart';

import '../helpers/test_credentials.dart';

void main() {
  patrolTest(
    'C1: Register → Email Verification screen',
    (PatrolIntegrationTester $) async {
      await $(#loginScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await $(#registerLink).tap();
      await $(#registerScreen).waitUntilVisible();

      final uniqueId = const Uuid().v4().substring(0, 8);
      const testName = 'E2E Test User';
      await $(#nameField).enterText('$testName $uniqueId');
      await $(#registerEmailField).enterText('e2e.$uniqueId@ziro.fit');
      await $(#registerPasswordField).enterText(
        TestCredentials.defaultPassword,
      );

      await $(#createAccountButton).tap();

      await $(#emailVerificationScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
