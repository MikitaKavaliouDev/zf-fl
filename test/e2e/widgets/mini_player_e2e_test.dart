@Tags(['e2e'])
library;

// E2E test: Minimize session → Mini player appears → Maximize
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/widgets/mini_player_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C9: Minimize session → Mini player overlay → Maximize',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      await $(#workoutMiniPlayer).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
      await $(#miniPlayerTimer).waitUntilVisible();

      await $(#workoutMiniPlayer).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
    },
  );
}
