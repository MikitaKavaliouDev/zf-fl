import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

/// Navigate to a client shell tab by tapping its bottom navigation item.
///
/// Tab indices: 0=Home, 1=Workout, 2=Explore, 3=Profile, 4=Analytics
///
/// Uses label text on BottomNavigationBar items (the whole bar has a
/// [ValueKey]('shellBottomNav') but individual items do not).
Future<void> navigateToClientTab(
  PatrolIntegrationTester $,
  int index,
) async {
  const tabLabels = ['Home', 'Workout', 'Explore', 'Profile', 'Analytics'];
  if (index < tabLabels.length) {
    await $(find.text(tabLabels[index])).tap();
  }
}

/// Navigate to a trainer shell tab.
///
/// Tab indices: 0=Calendar, 1=Programs, 2=Dashboard, 3=Clients, 4=More
Future<void> navigateToTrainerTab(
  PatrolIntegrationTester $,
  int index,
) async {
  const tabLabels = ['Calendar', 'Programs', 'Dashboard', 'Clients', 'More'];
  if (index < tabLabels.length) {
    await $(find.text(tabLabels[index])).tap();
  }
}

/// Backward-compatible alias for [navigateToClientTab].
@Deprecated('Use navigateToClientTab instead')
Future<void> navigateToTab(
  PatrolIntegrationTester $,
  int index,
) =>
    navigateToClientTab($, index);
