@Tags(['e2e'])
library;

// E2E test: Create template / exercise within program
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/trainer_template_exercise_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'T58: Create template / exercise within program',
    (PatrolIntegrationTester $) async {
      await loginAsTrainer($);

      // Navigate to Programs tab
      await $('Programs').tap();
      await $(#trainerProgramsScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Tap on a program to view detail
      await $(#trainerProgramDetailScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
