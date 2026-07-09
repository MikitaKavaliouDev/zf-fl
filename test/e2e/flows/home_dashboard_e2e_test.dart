@Tags(['e2e'])
library;

// E2E test: Home dashboard loads all sections
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/home_dashboard_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C6: Home dashboard loads all sections for linked client',
    (PatrolIntegrationTester $) async {
      await login($);

      // Verify the home screen and dashboard list are rendered
      await $(#homeScreen).waitUntilVisible(
        timeout: const Duration(seconds: 15),
      );
      await $(#dashboardList).waitUntilVisible();

      // Coach card appears for linked client (Ada)
      await $(#coachCard).waitUntilVisible();

      // Active program widget shows for client with an active program
      await $(#activeProgramWidget).waitUntilVisible();

      // Quick action buttons
      await $(#quickStartButton).waitUntilVisible();
      await $(#routinesButton).waitUntilVisible();
      await $(#templatesButton).waitUntilVisible();

      // Scroll down to verify remaining dashboard sections
      // (upcoming sessions, recent history, daily targets)
      await $(#upcomingSessionsCarousel).waitUntilVisible();
      await $(#recentHistorySection).waitUntilVisible();
      await $(#homeDailyTargetsSection).waitUntilVisible();

      // Header with bell badge
      await $(#ziroHeader).waitUntilVisible();
      await $(#bellIcon).waitUntilVisible();
    },
  );
}
