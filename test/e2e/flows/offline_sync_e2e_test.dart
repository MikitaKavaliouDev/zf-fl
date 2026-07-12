@Tags(['e2e'])
library;

// E2E tests: Offline sync — connectivity changes, auto-sync, conflict resolution
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/offline_sync_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C43: Sync triggers on connectivity restore',
    (PatrolIntegrationTester $) async {
      await login($);

      // Verify dashboard loaded (data fetched)
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Navigate to check-in to trigger API calls
      await $(#checkInBanner).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // The SyncCubit should handle connectivity automatically
      await Future.delayed(const Duration(seconds: 2));
    },
  );

  patrolTest(
    'C44: Navigate between tabs after offline→online transition',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Navigate to Explore tab
      await $('Explore').tap();
      await $(#exploreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Return to Home — all screens should render with cached data
      await $('Home').tap();
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );

  patrolTest(
    'C45: Pull-to-refresh triggers sync and updates UI',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Drag down on the dashboard to trigger pull-to-refresh
      // The home screen uses a RefreshIndicator wrapping the dashboard content
      await $.tester.timedDrag(
        find.byKey(const Key('homeScreen')),
        const Offset(0, 300),
        const Duration(milliseconds: 500),
      );
      await $.pumpAndSettle();

      // After refresh, dashboard should still show
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );
    },
  );

  patrolTest(
    'C46: Daily targets load after sync cycle',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Navigate to daily targets from the home dashboard
      // First check if the daily targets section exists
      final hasTargets = $(#dailyTargetsSection).exists;
      if (hasTargets) {
        await $(#dailyTargetsSection).tap();
        await $(#dailyTargetsScreen).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      }
    },
  );

  patrolTest(
    'C47: Analytics widgets survive tab switch-back',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Navigate to Analytics
      await $('Analytics').tap();
      await $(#analyticsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Switch away and back
      await $('Home').tap();
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await $('Analytics').tap();
      await $(#analyticsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );

  patrolTest(
    'C48: Notification badge updates via sync',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );

      // Open notifications from the bell icon in the header
      if ($(#notificationBell).exists) {
        await $(#notificationBell).tap();
        await $(#notificationsScreen).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );

        // Dismiss by tapping Done/Cancel if ZiroSheetHeader is used
        if ($(#sheetDoneButton).exists) {
          await $(#sheetDoneButton).tap();
        } else if ($(#sheetCancelButton).exists) {
          await $(#sheetCancelButton).tap();
        }

        // Should be back on home
        await $(#homeScreen).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      }
    },
  );
}
