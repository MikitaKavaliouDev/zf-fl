@Tags(['e2e'])
library;

// E2E test: Clients list -> Client detail -> Back to dashboard
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_clients_detail_e2e_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T50: Clients list -> Client detail -> Back to dashboard',
    (PatrolIntegrationTester $) async {
      // Login as trainer and wait for dashboard
      await loginAsTrainer($);
      await $(#trainerDashboardScreen).waitUntilVisible();

      // Navigate to Clients tab (index 3)
      await $('Clients').tap();
      await $(#trainerClientsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // The client list should render at least one client card.
      // Ada's linked client (client.ada@ziro.fit) appears first.
      // Tap the first ListTile to open the client detail screen.
      await $(find.byType(ListTile)).first.tap();
      await $(#trainerClientDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Navigate back to the dashboard via the bottom nav
      await $('Dashboard').tap();
      await $(#trainerDashboardScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
    },
  );
}
