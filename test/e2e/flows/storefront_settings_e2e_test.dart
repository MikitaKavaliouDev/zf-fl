@Tags(['e2e'])
library;

// E2E test: Comprehensive coverage of all storefront settings edit bottom sheets.
// Exercises every edit/create flow to catch crashes in bottom sheet forms.
// Requires: running backend (../zirofit-next) and connected device/emulator
// Run: patrol test --target test/e2e/flows/storefront_settings_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../helpers/auth_helper.dart';
import '../helpers/navigation_helper.dart';

void main() {
  patrolTest(
    'CX: All storefront edit bottom sheets open and save without crashing',
    (PatrolIntegrationTester $) async {
      // ── 1. Login as trainer ──
      await loginAsTrainer($);

      // Navigate to More tab
      await navigateToTrainerTab($, 4);
      await $(#trainerMoreScreen).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // Scroll to and tap Storefront Settings
      await $('Storefront Settings').scrollTo();
      await $('Storefront Settings').tap();
      await $(find.text('Storefront Settings')).waitUntilVisible(
        timeout: const Duration(seconds: 10),
      );

      // ── 2. Edit Profile ──
      await $('Edit Profile')
          .waitUntilVisible(timeout: const Duration(seconds: 8));
      await $(#editProfile_heroName).tap();
      await $(#editProfile_nameField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#editProfile_nameField).enterText('Ada Test Edited');
      await $(#editProfile_specialtiesField).enterText('Yoga, Pilates');
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 3. Edit About (text content) ──
      await $(find.text('About')).scrollTo();
      await $(#edit_About).tap();
      await $(#editTextContent_contentField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#editTextContent_contentField).enterText(
        'I am an AI-powered fitness trainer testing bottom sheets.',
      );
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 4. Add Package ──
      await $(find.text('Session Packages')).scrollTo();
      await $(#edit_Session_Packages).tap();
      await $(#package_nameField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#package_nameField).enterText('E2E Test Package');
      await $(#package_priceField).enterText('99');
      await $(#package_sessionsField).enterText('12');
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 5. Add Service ──
      await $(find.text('Services')).scrollTo();
      await $(#edit_Services).tap();
      await $(#service_titleField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#service_titleField).enterText('E2E Test Service');
      await $(#service_priceField).enterText('49');
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 6. Add Social Link ──
      await $(find.text('Social Links')).scrollTo();
      await $(#edit_Social_Links).tap();
      await $(#socialLink_platformField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#socialLink_platformField).enterText('Instagram');
      await $(#socialLink_usernameField).enterText('e2e_test_trainer');
      await $(#socialLink_urlField).enterText(
        'https://instagram.com/e2e_test_trainer',
      );
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 7. Add External Link ──
      await $(find.text('External Links')).scrollTo();
      await $(#edit_External_Links).tap();
      await $(#externalLink_labelField)
          .waitUntilVisible(timeout: const Duration(seconds: 5));
      await $(#externalLink_labelField).enterText('E2E Test Site');
      await $(#externalLink_urlField).enterText('https://e2e-test.example.com');
      await $('Save').tap();
      await $.pumpAndSettle();

      // ── 8. Final sanity check ──
      // Verify we can see the screen and sections after all operations
      await $(find.text('Storefront Settings')).waitUntilVisible(
        timeout: const Duration(seconds: 5),
      );
      expect($('Session Packages'), findsWidgets);
    },
  );
}
