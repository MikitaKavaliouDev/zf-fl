import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ziro_fit/features/profile/presentation/settings_screens/permissions_settings_screen.dart';

void main() {
  group('PermissionsSettingsScreen', () {
    testWidgets('renders title and permission rows', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PermissionsSettingsScreen(),
          ),
        ),
      );

      // AppBar title
      expect(find.text('Permissions'), findsOneWidget);

      // Section header
      expect(find.text('Device Permissions'), findsOneWidget);

      // Permission rows
      expect(find.text('Camera'), findsOneWidget);
      expect(find.text('Location'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Photos'), findsOneWidget);

      // All should show "Granted" badge
      expect(find.text('Granted'), findsNWidgets(4));

      // Open System Settings button
      expect(find.text('Open System Settings'), findsOneWidget);
      expect(find.text('Need to change permissions?'), findsOneWidget);
    });

    testWidgets('footer text explains purpose', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PermissionsSettingsScreen(),
          ),
        ),
      );

      expect(
        find.textContaining('ZIRO.FIT uses these permissions'),
        findsOneWidget,
      );
    });
  });
}
