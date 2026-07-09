import 'package:flutter_test/flutter_test.dart';
import 'package:ziro_fit/core/database/sync_converter.dart';

void main() {
  group('SyncConverter.snakeToCamel', () {
    test('simple snake_case to camelCase', () {
      expect(SyncConverter.snakeToCamel('workout_sessions'), 'workoutSessions');
    });

    test('single word stays lowercase', () {
      expect(SyncConverter.snakeToCamel('clients'), 'clients');
    });

    test('multiple underscores', () {
      expect(
        SyncConverter.snakeToCamel('client_exercise_logs'),
        'clientExerciseLogs',
      );
    });

    test('already camelCase passes through unchanged', () {
      expect(SyncConverter.snakeToCamel('camelCase'), 'camelCase');
    });

    test('empty string returns empty', () {
      expect(SyncConverter.snakeToCamel(''), '');
    });

    test('leading underscore strips the underscore prefix', () {
      // split('_') produces ['', 'private'], first part is '' → strip
      expect(SyncConverter.snakeToCamel('_private'), 'Private');
    });
  });

  group('SyncConverter.camelToSnake', () {
    test('simple camelCase to snake_case', () {
      expect(SyncConverter.camelToSnake('workoutSessions'), 'workout_sessions');
    });

    test('single word stays lowercase', () {
      expect(SyncConverter.camelToSnake('clients'), 'clients');
    });

    test('multiple camel humps', () {
      expect(
        SyncConverter.camelToSnake('clientExerciseLogs'),
        'client_exercise_logs',
      );
    });

    test('already snake_case passes through unchanged', () {
      expect(SyncConverter.camelToSnake('snake_case'), 'snake_case');
    });

    test('empty string returns empty', () {
      expect(SyncConverter.camelToSnake(''), '');
    });

    test('single uppercase letter', () {
      expect(SyncConverter.camelToSnake('A'), 'a');
    });

    test('consecutive uppercase handles acronyms', () {
      // "PRData" → "p_r_data" — each uppercase becomes _+lowercase
      // This is expected behavior for this simple converter
      expect(SyncConverter.camelToSnake('PRData'), 'p_r_data');
    });
  });

  group('SyncConverter.wireToLocal', () {
    test('converts all snake_case keys to camelCase', () {
      final input = <String, dynamic>{
        'workout_session_id': 'sess-1',
        'client_id': 'client-1',
        'created_at': 1000,
      };
      final result = SyncConverter.wireToLocal(input);

      expect(result, containsPair('workoutSessionId', 'sess-1'));
      expect(result, containsPair('clientId', 'client-1'));
      expect(result, containsPair('createdAt', 1000));
      expect(result, hasLength(3));
    });

    test('passes camelCase keys through unchanged', () {
      final input = <String, dynamic>{
        'id': 'abc',
        'name': 'Test',
      };
      final result = SyncConverter.wireToLocal(input);
      expect(result['id'], 'abc');
      expect(result['name'], 'Test');
    });

    test('empty map returns empty', () {
      expect(SyncConverter.wireToLocal({}), isEmpty);
    });
  });

  group('SyncConverter.localToWire', () {
    test('converts all camelCase keys to snake_case', () {
      final input = <String, dynamic>{
        'workoutSessionId': 'sess-1',
        'clientId': 'client-1',
        'createdAt': 1000,
      };
      final result = SyncConverter.localToWire(input);

      expect(result, containsPair('workout_session_id', 'sess-1'));
      expect(result, containsPair('client_id', 'client-1'));
      expect(result, containsPair('created_at', 1000));
      expect(result, hasLength(3));
    });

    test('passes snake_case keys through unchanged', () {
      final input = <String, dynamic>{
        'id': 'abc',
        'name': 'Test',
      };
      final result = SyncConverter.localToWire(input);
      expect(result['id'], 'abc');
      expect(result['name'], 'Test');
    });

    test('empty map returns empty', () {
      expect(SyncConverter.localToWire({}), isEmpty);
    });
  });

  group('SyncConverter.prepareForInsert', () {
    test('converts keys to camelCase and adds sync_status', () {
      final row = <String, dynamic>{
        'id': 'sess-1',
        'client_id': 'client-1',
        'start_time': 1000,
        'status': 'COMPLETED',
        'created_at': 1000,
        'updated_at': 1000,
      };
      final result = SyncConverter.prepareForInsert(row, 'workout_sessions');

      expect(result['id'], 'sess-1');
      expect(result['clientId'], 'client-1');
      expect(result['startTime'], 1000);
      expect(result['sync_status'], 'synced');
    });

    test('converts ISO date strings to unix ms integers', () {
      final row = <String, dynamic>{
        'id': '1',
        'name': 'Test',
        'created_at': '2024-01-15T10:30:00Z',
        'updated_at': '2024-01-15T10:30:00Z',
      };
      final result = SyncConverter.prepareForInsert(row, 'profiles');

      expect(result['createdAt'], isA<int>());
      expect(result['createdAt'], DateTime.utc(2024, 1, 15, 10, 30).millisecondsSinceEpoch);
    });

    test('converts date with space separator', () {
      final row = <String, dynamic>{
        'id': '1',
        'date': '2024-01-15 10:30:00',
        'created_at': '2024-01-15 10:30:00',
        'updated_at': '2024-01-15 10:30:00',
      };
      final result = SyncConverter.prepareForInsert(row, 'profiles');

      expect(result['date'], isA<int>());
      expect(result['createdAt'], isA<int>());
    });

    test('preserves non-date string values', () {
      final row = <String, dynamic>{
        'id': '1',
        'name': 'John Doe',
        'email': 'john@example.com',
        'created_at': 1000,
        'updated_at': 1000,
      };
      final result = SyncConverter.prepareForInsert(row, 'profiles');

      expect(result['name'], 'John Doe');
      expect(result['email'], 'john@example.com');
      expect(result['createdAt'], 1000);
    });

    test('empty row returns with only sync_status', () {
      final result = SyncConverter.prepareForInsert({}, 'clients');
      expect(result, {'sync_status': 'synced'});
    });
  });
}
