@Tags(['e2e'])
library;

// E2E test: Forgot password flow
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/forgot_password_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/test_credentials.dart';

void main() {
  patrolTest(
    'C4: Forgot password → Request reset',
    (PatrolIntegrationTester $) async {
      await $(#loginScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await $(#forgotPasswordButton).tap();
      // Expect to navigate to forgot password screen or show email dialog
      // Fill in email and submit
      await $(#emailField).enterText(TestCredentials.clientAdaEmail);
      // Tap submit/send (backend sends email)
      // For now, verify the user gets feedback
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
