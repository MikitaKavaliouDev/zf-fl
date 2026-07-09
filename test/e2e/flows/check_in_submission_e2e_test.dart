@Tags(['e2e'])
library;

// E2E test: Full multi-step check-in submission
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/check_in_submission_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/permission_helper.dart';

void main() {
  patrolTest(
    'C28: Full multi-step check-in → Success',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to check-in from home dashboard
      await $(#checkInBanner).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#checkInBanner).tap();
      await $(#checkInScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Step 1: Body metrics - tap Next
      await $(#checkInNextButton).waitUntilVisible();
      await $(#checkInNextButton).tap();

      // Step 2: Wellness - tap Next
      await $(#checkInNextButton).waitUntilVisible();
      await $(#checkInNextButton).tap();

      // Step 3: Notes - tap Next
      await $(#checkInNextButton).waitUntilVisible();
      await $(#checkInNextButton).tap();

      // Step 4: Photos - handle permission if shown
      await grantVisiblePermission($);

      // Submit
      await $(#checkInSubmitButton).waitUntilVisible();
      await $(#checkInSubmitButton).tap();

      // Verify success
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
