@Tags(['e2e'])
library;

// E2E test: Trainer can view Subscription & Billing screen
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_subscription_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'CX: Trainer can view Subscription & Billing screen',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to More tab
      await $('More').tap();
      await $(#trainerMoreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to and tap Subscription & Billing
      await $('Subscription & Billing').scrollTo();
      await $('Subscription & Billing').tap();

      // Verify subscription screen loads with plan section
      await $('Upgrade Plan').waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      expect($('Upgrade Plan'), findsOneWidget);
      expect($('Billing History'), findsOneWidget);
    },
  );
}
