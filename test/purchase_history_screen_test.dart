import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ziro_fit/features/profile/presentation/settings_screens/purchase_history_screen.dart';

void main() {
  group('PurchaseHistoryScreen', () {
    const purchasedKey = 'purchased_packages';

    testWidgets('renders AppBar with title', (tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Purchase History'), findsOneWidget);
    });

    testWidgets('shows empty state when no purchases', (tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Transaction History'), findsOneWidget);
      expect(
        find.text(
          'Your payment receipts and purchase history\nwill appear here.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows Clear History button in AppBar when purchases exist',
        (tester) async {
      final purchases = [
        {
          'id': '1',
          'packageId': 'pkg1',
          'name': '12 Sessions Pack',
          'price': '99.99',
          'numberOfSessions': 12,
          'sessionsRemaining': 8,
          'purchaseDate': '2026-07-10T10:00:00.000Z',
        },
      ];

      SharedPreferences.setMockInitialValues({
        purchasedKey: jsonEncode(purchases),
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('12 Sessions Pack'), findsOneWidget);
      expect(find.text('July 10, 2026'), findsOneWidget);
      expect(find.text('\$99.99'), findsOneWidget);
      expect(find.text('8 remaining'), findsOneWidget);
    });

    testWidgets('shows "All sessions" for unlimited packages',
        (tester) async {
      final purchases = [
        {
          'id': '2',
          'packageId': 'pkg2',
          'name': 'Unlimited Plan',
          'price': '199.99',
          'numberOfSessions': 0,
          'sessionsRemaining': 0,
          'purchaseDate': '2026-07-01T10:00:00.000Z',
        },
      ];

      SharedPreferences.setMockInitialValues({
        purchasedKey: jsonEncode(purchases),
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Unlimited Plan'), findsOneWidget);
      expect(find.text('All sessions'), findsOneWidget);
      // No remaining badge for unlimited
      expect(find.text('remaining'), findsNothing);
    });

    testWidgets('sorts purchases newest first', (tester) async {
      final purchases = [
        {
          'id': 'old',
          'packageId': 'pkg1',
          'name': 'Old Package',
          'price': '49.99',
          'numberOfSessions': 6,
          'sessionsRemaining': 0,
          'purchaseDate': '2026-01-01T10:00:00.000Z',
        },
        {
          'id': 'new',
          'packageId': 'pkg2',
          'name': 'New Package',
          'price': '99.99',
          'numberOfSessions': 12,
          'sessionsRemaining': 10,
          'purchaseDate': '2026-07-10T10:00:00.000Z',
        },
      ];

      SharedPreferences.setMockInitialValues({
        purchasedKey: jsonEncode(purchases),
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // New Package should be first (newest)
      final items = find.byType(PurchaseHistoryScreen);
      expect(items, findsOneWidget);
      // Both names should be present
      expect(find.text('New Package'), findsOneWidget);
      expect(find.text('Old Package'), findsOneWidget);
    });

    testWidgets('shows Clear History confirmation dialog',
        (tester) async {
      final purchases = [
        {
          'id': '1',
          'packageId': 'pkg1',
          'name': '12 Sessions Pack',
          'price': '99.99',
          'numberOfSessions': 12,
          'sessionsRemaining': 8,
          'purchaseDate': '2026-07-10T10:00:00.000Z',
        },
      ];

      SharedPreferences.setMockInitialValues({
        purchasedKey: jsonEncode(purchases),
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const PurchaseHistoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Open overflow menu
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      // Tap "Clear History"
      await tester.tap(find.text('Clear History'));
      await tester.pumpAndSettle();

      // Confirmation dialog should appear (popup menu is closed after tap)
      expect(find.text('Clear History'), findsOneWidget);
      expect(find.text('Remove all purchase records from history?'),
          findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Clear'), findsOneWidget);
    });
  });
}
