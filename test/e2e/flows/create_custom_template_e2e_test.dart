@Tags(['e2e'])
library;

// E2E test: Create custom template → Add exercises
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/create_custom_template_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:uuid/uuid.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C20: Create custom template → Add exercises',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to templates library
      await $(#templatesButton).tap();
      await $(#templatesLibraryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap create new template
      await $(#createTemplateButton).tap();
      await $(#createTemplateView).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Enter template name
      final uniqueId = const Uuid().v4().substring(0, 8);
      await $(#templateNameField).enterText('E2E Template $uniqueId');

      // Add exercises via the exercise picker
      await $(#addExercisesButton).tap();
      await $(#exercisePickerSheet).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
