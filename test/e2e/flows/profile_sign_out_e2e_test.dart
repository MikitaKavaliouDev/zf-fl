@Tags(['e2e'])
library;

// E2E test: Profile screen → Sign out
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/profile_sign_out_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C37: Profile screen → Sign out → Redirect to login',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab (index 3 in bottom nav)
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll down to find sign out button
      // The MoreCubit handles sign-out
      await $(find.text('Sign Out')).scrollTo();
      await $(find.text('Sign Out')).tap();

      // Verify redirect to login screen
      await $(#loginScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
