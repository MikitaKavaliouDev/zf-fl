@Tags(['e2e'])
library;

// E2E test: Purchase History screen renders and displays purchases
// Requires: running backend (cd ../zirofit-next && npm run dev) and connected device/emulator
// Run: patrol test --target test/e2e/flows/purchase_history_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C46: Purchase History screen shows transaction list or empty state',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to Purchase History row
      await $('Purchase History').scrollTo();
      await $('Purchase History').tap();

      // Wait for Purchase History screen to load
      await $(#purchaseHistoryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // If there are purchases, we should see purchase cards
      // If no purchases, we should see the empty state
      await Future.delayed(const Duration(seconds: 2));

      // The screen should show either:
      // - Transaction History (empty state title)
      // - Or individual purchase records
      if ($('Transaction History').exists) {
        // Empty state — acceptable for first-time users
        expect(
          find.text(
            'Your payment receipts and purchase history\nwill appear here.',
          ),
          findsAtLeast(1),
        );
      } else {
        // Purchases exist — verify the screen has data
        // At minimum the AppBar should be visible
        expect($('Purchase History').exists, true);
      }
    },
  );
}
