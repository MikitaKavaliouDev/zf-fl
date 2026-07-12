@Tags(['e2e'])
library;

// E2E test: Trainer Payouts / Stripe Connect onboarding
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_payouts_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T63: Trainer can view Payouts screen and see Stripe status',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to More tab (5th tab)
      await $('More').tap();
      await $(#trainerMoreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to and tap Payouts
      await $(find.text('Payouts')).scrollTo();
      await $(find.text('Payouts')).tap();

      // Verify the Payouts screen is displayed
      await $('Payouts').waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Stripe Connect section should be visible
      expect(find.text('Stripe Connect'), findsOneWidget);

      // One of the status texts should appear
      final connected = find.text('Connected & Ready');
      final notConnected = find.text('Not Connected');
      expect(connected.or(notConnected), findsOneWidget);
    },
  );
}
