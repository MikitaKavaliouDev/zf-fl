/// Converts between snake_case (wire format) and camelCase (Dart format)
/// for sync data. Backend sync uses snake_case over the wire but the
/// local database uses camelCase column names.
class SyncConverter {
  static String snakeToCamel(String input) {
    final parts = input.split('_');
    if (parts.isEmpty) return input;
    return parts.first +
        parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
  }

  static String camelToSnake(String input) {
    if (input.isEmpty) return input;
    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      if (char == char.toUpperCase() && char != char.toLowerCase()) {
        if (i > 0) buffer.write('_');
        buffer.write(char.toLowerCase());
      } else {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }

  /// Converts a snake_case JSON map to a camelCase map suitable for
  /// inserting into Drift tables.
  static Map<String, dynamic> wireToLocal(Map<String, dynamic> input) {
    return input.map((key, value) => MapEntry(snakeToCamel(key), value));
  }

  /// Converts a camelCase map back to snake_case for pushing to backend.
  static Map<String, dynamic> localToWire(Map<String, dynamic> input) {
    return input.map((key, value) => MapEntry(camelToSnake(key), value));
  }

  /// Converts raw JSON row from sync pull into a drift-compatible
  /// insertcompanion map. Handles date conversion (unix ms → int).
  static Map<String, dynamic> prepareForInsert(
    Map<String, dynamic> row,
    String tableName,
  ) {
    final camel = wireToLocal(row);
    final result = <String, dynamic>{};

    for (final entry in camel.entries) {
      final value = entry.value;
      // Convert DateTime strings to int (unix ms) if they look like dates
      if (value is String && _isIsoDate(value)) {
        result[entry.key] = DateTime.parse(value).millisecondsSinceEpoch;
      } else {
        result[entry.key] = value;
      }
    }

    // Ensure sync metadata columns exist
    result['sync_status'] = 'synced';
    return result;
  }

  static bool _isIsoDate(String value) {
    // Basic check for ISO 8601 date string
    return value.length >= 10 &&
        value.contains('-') &&
        (value.contains('T') || value.contains(' ')) &&
        value[4] == '-';
  }
}
