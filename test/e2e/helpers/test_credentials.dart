/// Test credentials matching the backend seed data (prisma/seed.ts).
///
/// All accounts use the same default password set by `ensureAuthUser()`.
class TestCredentials {
  /// Primary test client — linked to trainer Ada, has active program,
  /// workout sessions, and measurements.
  static const clientAdaEmail = 'client.ada@ziro.fit';

  /// Unlinked test client — no trainer, for standalone flows.
  static const clientUnlinkedEmail = 'client.unlinked@ziro.fit';

  /// Trainer account with full trainer-side access.
  static const trainerEmail = 'ada@ziro.fit';

  /// Common password for all seed accounts.
  static const defaultPassword = 'password123';
}
