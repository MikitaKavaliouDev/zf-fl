@Tags(['e2e'])
library;

// E2E test: Voice coach connect → Disconnect
// NOTE: Requires ElevenLabs agent — may not be available in all environments.
// This test verifies the UI renders the button. Actual audio connection
// requires microphone permission + network access to ElevenLabs.
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/voice_coach_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/permission_helper.dart';

void main() {
  patrolTest(
    'C39: Voice coach button renders during workout',
    (PatrolIntegrationTester $) async {
      await login($);

      // Start a workout
      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Handle microphone permission if shown
      await grantVisiblePermission($);

      // Voice coach button should be visible during workout
      await $(#voiceCoachButton).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
    },
  );
}
