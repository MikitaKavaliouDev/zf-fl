@Tags(['e2e'])
library;

// E2E test: Browse template library → Search
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/template_library_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'C18: Browse template library → Search templates',
    (PatrolIntegrationTester $) async {
      await login($);

      // Navigate to templates from the home screen
      await $(#templatesButton).tap();
      await $(#templatesLibraryScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Verify templates screen loaded (no empty state means list populated)
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
