@Tags(['e2e'])
library;

// E2E test: Custom Exercises CRUD flow
// Requires: running backend (cd ../zirofit-next && npm run dev) and connected device/emulator
// Run: patrol test --target test/e2e/flows/custom_exercises_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C44: Create, view, edit, and delete a custom exercise',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to Profile tab
      await $('Profile').tap();
      await $(#profileScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to Custom Exercises row
      await $('Custom Exercises').scrollTo();
      await $('Custom Exercises').tap();

      // Verify Custom Exercises screen loads
      await $(#customExercisesScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Should see empty state initially
      await $('Create your own exercises by tapping +').waitUntilVisible();

      // Tap + button to create exercise
      await $(#addExerciseButton).tap();

      // Fill in the form
      await $(#exerciseNameField).enterText('E2E Test Exercise');
      await $('Save').tap();

      // Wait for exercise to appear in the list
      await $('E2E Test Exercise').waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap on exercise to edit
      await $('E2E Test Exercise').tap();

      // Edit the name
      // Clear and type new name
      await $(#exerciseNameField).clearText();
      await $(#exerciseNameField).enterText('E2E Test Exercise (edited)');
      await $('Save Changes').tap();

      // Verify updated name
      await $('E2E Test Exercise (edited)').waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Delete the exercise
      await $('E2E Test Exercise (edited)').tap();
      await $('Delete Exercise').tap();
      await $('Delete').tap();

      // Verify empty state returns
      await Future.delayed(const Duration(seconds: 2));
      // The exercise should be gone
      expect($('E2E Test Exercise (edited)').exists, false);
    },
  );
}
