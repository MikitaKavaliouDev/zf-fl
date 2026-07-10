import 'package:drift/drift.dart' show Value, Variable;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/features/sync/data/sync_api_service.dart';
import 'package:ziro_fit/features/sync/data/sync_repository.dart';

class MockSyncApiService extends Mock implements SyncApiService {}

/// Insert a notifications row via raw SQL.
Future<void> insertNotification(
  AppDatabase db, {
  required String id,
  String userId = 'user-1',
  String message = 'Test',
  String type = 'GENERAL',
  int readStatus = 0,
  int createdAt = 1000,
  int updatedAt = 1000,
  String syncStatus = 'synced',
}) {
  return db.customStatement(
    'INSERT INTO notifications '
    '(id, user_id, message, type, read_status, created_at, updated_at, sync_status) '
    'VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
    [id, userId, message, type, readStatus, createdAt, updatedAt, syncStatus],
  );
}

/// Insert a clients row via raw SQL.
/// SQL table name: `clients_table` (Drift strips the `Table` suffix from
/// `ClientsTable` and appends `_table`).
Future<void> insertClient(
  AppDatabase db, {
  required String id,
  String userId = 'user-1',
  String name = 'Test Client',
  String email = 'test@test.com',
  String status = 'active',
  int createdAt = 1000,
  int updatedAt = 1000,
  int? deletedAt,
  String syncStatus = 'synced',
}) {
  final hasDeleted = deletedAt != null;
  final sql = hasDeleted
      ? 'INSERT INTO clients_table '
        '(id, user_id, name, email, status, created_at, updated_at, deleted_at, sync_status) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'
      : 'INSERT INTO clients_table '
        '(id, user_id, name, email, status, created_at, updated_at, sync_status) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
  final params = hasDeleted
      ? [id, userId, name, email, status, createdAt, updatedAt, deletedAt, syncStatus]
      : [id, userId, name, email, status, createdAt, updatedAt, syncStatus];
  return db.customStatement(sql, params);
}

/// Insert a PendingActionRecord.
Future<void> insertPendingAction(
  AppDatabase db, {
  required String id,
  required String sourceTable,
  required String action,
  int createdAt = 1000,
}) {
  return db.into(db.pendingActionRecords).insertOnConflictUpdate(
        PendingActionRecordsCompanion(
          id: Value(id),
          sourceTable: Value(sourceTable),
          action: Value(action),
          createdAt: Value(createdAt),
        ),
      );
}

/// Query a single value from a table by ID.
Future<Map<String, dynamic>?> queryById(
  AppDatabase db,
  String table,
  String id,
) async {
  final rows = await db.customSelect(
    'SELECT * FROM "$table" WHERE id = ?',
    variables: [Variable.withString(id)],
  ).get();
  if (rows.isEmpty) return null;
  return Map<String, dynamic>.from(rows.first.data);
}

void main() {
  late AppDatabase db;
  late SyncApiService api;
  late SyncRepository repository;
  const defaultTimestamp = 5000;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    api = MockSyncApiService();
    repository = SyncRepository(api, db);
  });

  tearDown(() async {
    await db.close();
  });

  group('SyncRepository', () {
    // ──────────────────────────────────────────────────────────────
    // sync() — full cycle
    // ──────────────────────────────────────────────────────────────
    group('sync()', () {
      test('pulls, applies, pushes, and returns timestamp', () async {
        // Seed a pending row so push is triggered
        await insertClient(db, id: 'push-trigger', name: 'Push Trigger',
            email: 'pt@test.com', syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        final result = await repository.sync(0);

        expect(result, defaultTimestamp);
        verify(() => api.pull(0)).called(1);
        verify(() => api.push(any())).called(1);

        final meta = await (db.select(db.syncMetadata)
              ..where((t) => t.key.equals('last_sync_at')))
            .getSingleOrNull();
        expect(meta, isNotNull);
        expect(meta!.value, defaultTimestamp.toString());
      });

      test('applies pulled client rows to Drift', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [
                    {
                      'id': 'client-1',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Test Client',
                      'email': 'test@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 1000,
                      'deleted_at': null,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);

        final row = await queryById(db, 'clients_table', 'client-1');
        expect(row, isNotNull);
        expect(row!['name'], 'Test Client');
        expect(row['sync_status'], 'synced');
      });

      test('applies soft-delete for deleted IDs', () async {
        // First sync: insert
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [
                    {
                      'id': 'client-1',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Test',
                      'email': 'test@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 1000,
                      'deleted_at': null,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': 1000,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': 1001,
            });
        await repository.sync(0);

        // Second sync: delete
        when(() => api.pull(1000)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [],
                  'updated': [],
                  'deleted': ['client-1'],
                },
              },
              'timestamp': 2000,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': 2001,
            });
        await repository.sync(1000);

        final row = await queryById(db, 'clients_table', 'client-1');
        expect(row, isNotNull);
        expect(row!['deleted_at'], isNotNull);
        expect(row['sync_status'], 'synced');
      });

      test('applies updated rows (same ID, new data)', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [
                    {
                      'id': 'client-1',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Original',
                      'email': 'test@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 1000,
                      'deleted_at': null,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': 1000,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': 1001,
            });
        await repository.sync(0);

        when(() => api.pull(1000)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [],
                  'updated': [
                    {
                      'id': 'client-1',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Updated Name',
                      'email': 'updated@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 2000,
                      'deleted_at': null,
                    },
                  ],
                  'deleted': [],
                },
              },
              'timestamp': 2000,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': 2001,
            });
        await repository.sync(1000);

        final row = await queryById(db, 'clients_table', 'client-1');
        expect(row!['name'], 'Updated Name');
        expect(row['email'], 'updated@test.com');
      });

      test('skips unknown table names gracefully', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'unknown_table': {
                  'created': [
                    {'id': 'x', 'name': 'Unknown'},
                  ],
                  'updated': [],
                  'deleted': [],
                },
                'clients': {
                  'created': [
                    {
                      'id': 'client-1',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Test Client',
                      'email': 'test@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 1000,
                      'deleted_at': null,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);

        final row = await queryById(db, 'clients_table', 'client-1');
        expect(row, isNotNull);
      });

      test('handles empty changes gracefully', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);

        final meta = await (db.select(db.syncMetadata)
              ..where((t) => t.key.equals('last_sync_at')))
            .getSingleOrNull();
        expect(meta, isNotNull);
      });

      test('pushes local pending changes when they exist', () async {
        await insertClient(db, id: 'local-1', name: 'Local Client',
            email: 'local@test.com', syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);
        verify(() => api.push(any())).called(1);
      });
    });

    // ──────────────────────────────────────────────────────────────
    // table name mapping
    // ──────────────────────────────────────────────────────────────
    group('table name mapping', () {
      test('maps trainer_services → services table correctly', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'trainer_services': {
                  'created': [
                    {
                      'id': 'svc-1',
                      'profile_id': 'trainer-1',
                      'title': 'Online Coaching',
                      'description': 'Online coaching service',
                      'price': '99.00',
                      'currency': 'PLN',
                      'duration': 60,
                      'created_at': 1000,
                      'updated_at': 1000,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);

        final row = await queryById(db, 'services', 'svc-1');
        expect(row, isNotNull);
        expect(row!['title'], 'Online Coaching');
      });

      test('reverse mapping: services → trainer_services in push', () async {
        await db.customStatement(
          'INSERT INTO services (id, profile_id, title, description, price, '
          'currency, duration, created_at, updated_at, sync_status) '
          "VALUES ('svc-2', 'trainer-1', 'Test Service', 'A test service', '50.00', "
          "'PLN', 30, 1000, 1000, 'pending')",
        );
        await insertPendingAction(db, id: 'svc-2',
            sourceTable: 'trainer_services', action: 'create');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? capturedPush;
        when(() => api.push(any())).thenAnswer((invocation) async {
          capturedPush = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        expect(capturedPush, isNotNull);
        expect(capturedPush!.containsKey('trainer_services'), isTrue);
        final svcData = capturedPush!['trainer_services'] as Map<String, dynamic>;
        expect((svcData['created'] as List), hasLength(1));
        expect((svcData['created'] as List).first['id'], 'svc-2');
      });

      test('handles all 17 sync table names without error', () async {
        final allTables = [
          'clients', 'profiles', 'workout_sessions', 'exercises',
          'workout_templates', 'client_assessments', 'client_measurements',
          'client_photos', 'client_exercise_logs', 'trainer_services',
          'trainer_packages', 'trainer_testimonials', 'trainer_programs',
          'notifications', 'bookings', 'trainer_profiles', 'calendar_events',
        ];

        final changes = <String, dynamic>{};
        for (final table in allTables) {
          changes[table] = {
            'created': <Map<String, dynamic>>[],
            'updated': <Map<String, dynamic>>[],
            'deleted': <String>[],
          };
        }

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': changes,
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);
      });
    });

    // ──────────────────────────────────────────────────────────────
    // markPending / markSynced / markAllSynced
    // ──────────────────────────────────────────────────────────────
    group('markPending / markSynced', () {
      test('markPending sets sync_status and creates action record', () async {
        await insertNotification(db, id: 'n-1');

        await repository.markPending('notifications', 'n-1', action: 'update');

        final row = await queryById(db, 'notifications', 'n-1');
        expect(row!['sync_status'], 'pending');
        expect(row['updated_at'] as int, greaterThan(0));

        final record = await (db.select(db.pendingActionRecords)
              ..where((t) => t.id.equals('n-1'))
              ..where((t) => t.sourceTable.equals('notifications')))
            .getSingleOrNull();
        expect(record, isNotNull);
        expect(record!.action, 'update');
      });

      test('markPending with create action', () async {
        await db.customStatement(
          'INSERT INTO workout_sessions_table (id, client_id, name, start_time, status, '
          'created_at, updated_at, sync_status) '
          "VALUES ('ws-1', 'client-1', 'New Session', 1000, 'IN_PROGRESS', "
          '1000, 1000, \'synced\')',
        );

        await repository.markPending('workout_sessions', 'ws-1', action: 'create');

        final record = await (db.select(db.pendingActionRecords)
              ..where((t) => t.id.equals('ws-1')))
            .getSingleOrNull();
        expect(record, isNotNull);
        expect(record!.action, 'create');
      });

      test('markSynced clears sync_status and removes action record', () async {
        await insertNotification(db, id: 'n-2', syncStatus: 'pending');
        await insertPendingAction(db, id: 'n-2',
            sourceTable: 'notifications', action: 'update');

        await repository.markSynced('notifications', 'n-2');

        final row = await queryById(db, 'notifications', 'n-2');
        expect(row!['sync_status'], 'synced');

        final record = await (db.select(db.pendingActionRecords)
              ..where((t) => t.id.equals('n-2')))
            .getSingleOrNull();
        expect(record, isNull);
      });

      test('markAllSynced sets all pending rows to synced', () async {
        await insertNotification(db, id: 'n-a', syncStatus: 'pending');
        await insertNotification(db, id: 'n-b', syncStatus: 'pending');
        await insertNotification(db, id: 'n-c');

        await repository.markAllSynced('notifications');

        final pendingRows = await db.customSelect(
          "SELECT id FROM notifications WHERE sync_status = 'pending'",
        ).get();
        expect(pendingRows, isEmpty);

        final syncedRows = await db.customSelect(
          "SELECT id FROM notifications WHERE sync_status = 'synced'",
        ).get();
        expect(syncedRows, hasLength(3));
      });

      test('markPending with unmapped table name passes through', () async {
        await insertNotification(db, id: 'n-3');
        await repository.markPending('notifications', 'n-3');

        final row = await queryById(db, 'notifications', 'n-3');
        expect(row!['sync_status'], 'pending');
      });
    });

    // ──────────────────────────────────────────────────────────────
    // _collectPendingChanges
    // ──────────────────────────────────────────────────────────────
    group('_collectPendingChanges (push data assembly)', () {
      test('collects created rows via PendingActionRecords', () async {
        await insertClient(db, id: 'pc-1', name: 'New Client',
            email: 'new@test.com', syncStatus: 'pending');
        await insertPendingAction(db, id: 'pc-1',
            sourceTable: 'clients', action: 'create');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? captured;
        when(() => api.push(any())).thenAnswer((invocation) async {
          captured = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        final clientsData = captured!['clients'] as Map<String, dynamic>;
        expect((clientsData['created'] as List), hasLength(1));
        expect((clientsData['updated'] as List), isEmpty);
        expect((clientsData['deleted'] as List), isEmpty);
      });

      test('falls back to timestamp heuristic when no action record', () async {
        await insertClient(db, id: 'pc-heuristic-c', name: 'Create',
            email: 'c@test.com',
            syncStatus: 'pending');
        await insertClient(db, id: 'pc-heuristic-u', name: 'Update',
            email: 'u@test.com', updatedAt: 2000,
            syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? captured;
        when(() => api.push(any())).thenAnswer((invocation) async {
          captured = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        final clientsData = captured!['clients'] as Map<String, dynamic>;
        final created = (clientsData['created'] as List);
        final updated = (clientsData['updated'] as List);

        expect(created, hasLength(1));
        expect(created.first['id'], 'pc-heuristic-c');
        expect(updated, hasLength(1));
        expect(updated.first['id'], 'pc-heuristic-u');
      });

      test('collects soft-deleted pending rows in deleted bucket', () async {
        await insertClient(db, id: 'pc-deleted', name: 'Deleted',
            email: 'del@test.com', deletedAt: 3000, syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? captured;
        when(() => api.push(any())).thenAnswer((invocation) async {
          captured = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        final clientsData = captured!['clients'] as Map<String, dynamic>;
        expect((clientsData['deleted'] as List), contains('pc-deleted'));
      });

      test('excludes synced rows, only collects pending', () async {
        await insertClient(db, id: 'only-synced', name: 'Synced',
            email: 's@test.com');
        await insertClient(db, id: 'only-pending', name: 'Pending',
            email: 'p@test.com', syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? captured;
        when(() => api.push(any())).thenAnswer((invocation) async {
          captured = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        final clientsData = captured!['clients'] as Map<String, dynamic>;
        final allPushed = [
          ...(clientsData['created'] as List),
          ...(clientsData['updated'] as List),
        ];
        expect(allPushed, hasLength(1));
        expect(allPushed.first['id'], 'only-pending');
      });

      test('strips sync_status from push payload', () async {
        await insertClient(db, id: 'strip-me', name: 'No Status',
            email: 'ns@test.com', syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': <String, dynamic>{},
              'timestamp': defaultTimestamp,
            });

        Map<String, dynamic>? captured;
        when(() => api.push(any())).thenAnswer((invocation) async {
          captured = invocation.positionalArguments[0] as Map<String, dynamic>;
          return {'timestamp': defaultTimestamp + 1};
        });

        await repository.sync(0);

        final clientsData = captured!['clients'] as Map<String, dynamic>;
        final pushedRow = (clientsData['created'] as List).first
            as Map<String, dynamic>;
        expect(pushedRow.containsKey('sync_status'), isFalse);
      });
    });

    // ──────────────────────────────────────────────────────────────
    // Error handling
    // ──────────────────────────────────────────────────────────────
    group('error handling', () {
      test('throws when pull API fails', () async {
        when(() => api.pull(any())).thenThrow(Exception('Network error'));
        expect(() => repository.sync(0), throwsA(isA<Exception>()));
      });

      test('preserves pulled data when push fails', () async {
        // Seed a pending row so that push is triggered
        await insertClient(db, id: 'pending-for-push', name: 'Pending',
            email: 'pending@test.com', syncStatus: 'pending');

        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'clients': {
                  'created': [
                    {
                      'id': 'client-pushfail',
                      'trainer_id': null,
                      'user_id': 'user-1',
                      'name': 'Push Fail Client',
                      'email': 'fail@test.com',
                      'status': 'active',
                      'created_at': 1000,
                      'updated_at': 1000,
                      'deleted_at': null,
                    },
                  ],
                  'updated': [],
                  'deleted': [],
                },
              },
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenThrow(Exception('Push failed'));

        await expectLater(repository.sync(0), throwsA(isA<Exception>()));

        // Pulled data should still be in the DB despite push failure
        final row = await queryById(db, 'clients_table', 'client-pushfail');
        expect(row, isNotNull);
      });

      test('handles calendar_events table (no deleted_at column)', () async {
        when(() => api.pull(0)).thenAnswer((_) async => {
              'changes': {
                'calendar_events': {
                  'created': [
                    {
                      'id': 'cal-1',
                      'trainer_id': 'trainer-1',
                      'title': 'Test Event',
                      'description': null,
                      'start_time': 1000,
                      'end_time': 2000,
                      'location_name': null,
                      'address': null,
                      'city': null,
                      'price': '0',
                      'currency': 'PLN',
                      'capacity': 20,
                      'enrolled_count': 0,
                      'category': null,
                      'is_promoted': false,
                      'status': 'PENDING',
                      'created_at': 1000,
                      'updated_at': 1000,
                    },
                  ],
                  'updated': [],
                  'deleted': ['cal-2'],
                },
              },
              'timestamp': defaultTimestamp,
            });
        when(() => api.push(any())).thenAnswer((_) async => {
              'timestamp': defaultTimestamp + 1,
            });

        await repository.sync(0);

        final row = await queryById(db, 'calendar_events', 'cal-1');
        expect(row, isNotNull);
        expect(row!['title'], 'Test Event');
      });
    });

    // ──────────────────────────────────────────────────────────────
    // Full round-trip scenarios
    // ──────────────────────────────────────────────────────────────
    test('sync round-trip with notifications table', () async {
      when(() => api.pull(0)).thenAnswer((_) async => {
            'changes': {
              'notifications': {
                'created': [
                  {
                    'id': 'notif-rt',
                    'user_id': 'user-1',
                    'message': 'Round-trip notification',
                    'type': 'GENERAL',
                    'read_status': false,
                    'created_at': 1000,
                    'updated_at': 1000,
                    'deleted_at': null,
                  },
                ],
                'updated': [],
                'deleted': [],
              },
            },
            'timestamp': defaultTimestamp,
          });
      when(() => api.push(any())).thenAnswer((_) async => {
            'timestamp': defaultTimestamp + 1,
          });

      await repository.sync(0);

      final row = await queryById(db, 'notifications', 'notif-rt');
      expect(row, isNotNull);
      expect(row!['message'], 'Round-trip notification');
      expect(row['sync_status'], 'synced');
    });

    test('_markPushedAsSynced cleans up action records after push', () async {
      await insertClient(db, id: 'cleanup-1', name: 'Cleanup',
          email: 'cu@test.com', syncStatus: 'pending');
      await insertPendingAction(db, id: 'cleanup-1',
          sourceTable: 'clients', action: 'create');

      when(() => api.pull(0)).thenAnswer((_) async => {
            'changes': <String, dynamic>{},
            'timestamp': defaultTimestamp,
          });
      when(() => api.push(any())).thenAnswer((_) async => {
            'timestamp': defaultTimestamp + 1,
          });

      await repository.sync(0);

      final records = await (db.select(db.pendingActionRecords)
            ..where((t) => t.sourceTable.equals('clients')))
          .get();
      expect(records, isEmpty);

      final row = await queryById(db, 'clients_table', 'cleanup-1');
      expect(row!['sync_status'], 'synced');
    });
  });
}
