@Tags(['e2e'])
library;

// E2E test: Notification swipe deletion and clear all
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/notification_deletion_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'CX: Client can swipe to delete a notification or clear all',
    (PatrolIntegrationTester $) async {
      await login($);

      // Tap bell icon to open notifications
      await $(#bellIcon).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#bellIcon).tap();
      await $(#notificationsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Wait for notifications to load
      await Future.delayed(const Duration(seconds: 3));

      // Check if there are notification rows
      final hasNotification = $(#notificationRow).exists;

      if (hasNotification) {
        // Swipe-to-delete the first notification
        await $.tester.drag(
          find.byKey(const ValueKey('notificationRow')).first,
          const Offset(-500, 0),
        );

        // Flush the dismissible animation
        await $.pumpAndSettle();

        // Verify the notification screen still renders
        await $(#notificationsScreen).waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );
      }

      // Try Clear All button if available
      final hasClearAll = $(#clearAllButton).exists;
      if (hasClearAll) {
        await $(#clearAllButton).tap();
        await $.pump(const Duration(milliseconds: 500));

        // Confirm the delete dialog — find "Clear All" inside the AlertDialog
        await $(find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Clear All'),
        )).tap();

        // Wait for deletion to complete
        await $.pumpAndSettle();

        // Verify the empty state appears
        await $('No notifications').waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      } else {
        // No notifications at all — verify empty state
        await $('No notifications').waitUntilVisible(
          timeout: const Duration(seconds: 5),
        );
      }
    },
  );
}
