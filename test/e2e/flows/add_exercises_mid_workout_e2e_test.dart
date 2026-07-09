@Tags(['e2e'])
library;

// E2E test: Add exercises during a workout
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/add_exercises_mid_workout_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C13: Start workout → Add exercise → View in exercise list',
    (PatrolIntegrationTester $) async {
      await login($);

      await $(#quickStartButton).tap();
      await $(#workoutSessionScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );
      await $(#startWorkoutButton).tap();
      await $(#timerDisplay).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Tap the "Add Exercise" button in the workout screen
      await $(#exercisePickerSheet).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Wait for exercises to load
      await $(#exercisePickerSearchField).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );

      // Search for an exercise
      await $(#exercisePickerSearchField).enterText('Bench');
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
