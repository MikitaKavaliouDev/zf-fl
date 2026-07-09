import 'package:patrol/patrol.dart';

/// Grants the currently visible permission dialog if one is shown.
Future<void> grantVisiblePermission(PatrolIntegrationTester $) async {
  if (await $.platform.mobile.isPermissionDialogVisible()) {
    await $.platform.mobile.grantPermissionWhenInUse();
  }
}
