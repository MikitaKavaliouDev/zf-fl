/// Supabase configuration for real-time subscriptions.
///
/// Defaults match the production Supabase project (same as iOS).
/// Override via SUPABASE_URL and SUPABASE_ANON_KEY env vars for
/// local development or staging environments.
class SupabaseConfig {
  SupabaseConfig._();

  /// The Supabase project URL.
  static String get supabaseUrl {
    const envUrl = String.fromEnvironment('SUPABASE_URL');
    if (envUrl.isNotEmpty) return envUrl;
    return 'https://pcrbmawiyzmqjvccozff.supabase.co';
  }

  /// The Supabase anonymous API key.
  static String get supabaseAnonKey {
    const envKey = String.fromEnvironment('SUPABASE_ANON_KEY');
    if (envKey.isNotEmpty) return envKey;
    return const String.fromEnvironment(
      'SUPABASE_ANON_KEY',
      defaultValue:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjcmJtYXdpeXptcWp2Y2NvemZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk2NDEwNzgsImV4cCI6MjA2NTIxNzA3OH0.etL_dgCTbZI765Gr9M3wGZDJjlCuhE2-CvPYZXKVU08',
    );
  }
}
