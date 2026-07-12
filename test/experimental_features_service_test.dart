import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ziro_fit/core/settings/experimental_features_service.dart';

void main() {
  late ExperimentalFeaturesService service;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    service = ExperimentalFeaturesService();
  });

  group('ExperimentalFeaturesService', () {
    test('returns false for all flags by default', () async {
      expect(await service.getDailyTargetsEnabled(), false);
      expect(await service.getVoiceFeedbackEnabled(), false);
      expect(await service.getPersonalRoutinesEnabled(), false);
      expect(await service.getCustomAppModeEnabled(), false);
    });

    test('persists and retrieves daily exercise targets toggle', () async {
      await service.setDailyTargetsEnabled(true);
      expect(await service.getDailyTargetsEnabled(), true);

      await service.setDailyTargetsEnabled(false);
      expect(await service.getDailyTargetsEnabled(), false);
    });

    test('persists and retrieves voice feedback toggle', () async {
      await service.setVoiceFeedbackEnabled(true);
      expect(await service.getVoiceFeedbackEnabled(), true);

      await service.setVoiceFeedbackEnabled(false);
      expect(await service.getVoiceFeedbackEnabled(), false);
    });

    test('persists and retrieves personal routines toggle', () async {
      await service.setPersonalRoutinesEnabled(true);
      expect(await service.getPersonalRoutinesEnabled(), true);

      await service.setPersonalRoutinesEnabled(false);
      expect(await service.getPersonalRoutinesEnabled(), false);
    });

    test('persists and retrieves custom app mode toggle', () async {
      await service.setCustomAppModeEnabled(true);
      expect(await service.getCustomAppModeEnabled(), true);

      await service.setCustomAppModeEnabled(false);
      expect(await service.getCustomAppModeEnabled(), false);
    });

    test('flags are independent — toggling one does not affect others', () async {
      await service.setDailyTargetsEnabled(true);
      await service.setCustomAppModeEnabled(true);

      expect(await service.getDailyTargetsEnabled(), true);
      expect(await service.getVoiceFeedbackEnabled(), false);
      expect(await service.getPersonalRoutinesEnabled(), false);
      expect(await service.getCustomAppModeEnabled(), true);

      await service.setDailyTargetsEnabled(false);

      expect(await service.getDailyTargetsEnabled(), false);
      expect(await service.getCustomAppModeEnabled(), true);
    });

    test('survives SharedPreferences reload (persistence across restarts)', () async {
      // Write flag
      await service.setPersonalRoutinesEnabled(true);

      // Simulate app restart by creating a new service
      SharedPreferences.setMockInitialValues({
        'experimental:personalRoutines': true,
      });
      final freshService = ExperimentalFeaturesService();

      expect(await freshService.getPersonalRoutinesEnabled(), true);
      expect(await freshService.getDailyTargetsEnabled(), false);
    });
  });
}
