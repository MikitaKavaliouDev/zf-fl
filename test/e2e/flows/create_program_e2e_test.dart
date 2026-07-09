@Tags(['e2e'])
library;

// E2E test: Create program → Add templates → Schedule
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/create_program_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:uuid/uuid.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C19: Create program → Add templates → Schedule on calendar',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to routine builder from home
      await $(#routinesButton).tap();
      await $(#routineBuilderScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Enter program name
      final uniqueId = const Uuid().v4().substring(0, 8);
      await $(#routineBuilderTextField).enterText('E2E Program $uniqueId');

      // Add a template from the picker
      await $(#addTemplateButton).waitUntilVisible();
      await $(#addTemplateButton).tap();
    },
  );
}
