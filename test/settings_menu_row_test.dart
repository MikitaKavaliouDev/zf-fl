import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ziro_fit/core/widgets/settings_menu_row.dart';

void main() {
  group('SettingsMenuRow', () {
    testWidgets('renders title and icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuRow(
              icon: Icons.palette_outlined,
              iconColor: Colors.pink,
              title: 'Appearance',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Appearance'), findsOneWidget);
      expect(find.byIcon(Icons.palette_outlined), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
    });

    testWidgets('renders subtitle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuRow(
              icon: Icons.light_mode_rounded,
              iconColor: Colors.blue,
              title: 'Theme',
              subtitle: 'Light',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Light'), findsOneWidget);
    });

    testWidgets('fires onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuRow(
              icon: Icons.notifications_outlined,
              iconColor: Colors.orange,
              title: 'Notifications',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Notifications'));
      expect(tapped, true);
    });

    testWidgets('renders custom trailing widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuRow(
              icon: Icons.checklist_rounded,
              iconColor: Colors.green,
              title: 'Toggle',
              trailing: Switch(
                value: true,
                onChanged: null,
              ),
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);
      // No chevron when custom trailing is provided
      expect(find.byIcon(Icons.chevron_right_rounded), findsNothing);
    });
  });
}
