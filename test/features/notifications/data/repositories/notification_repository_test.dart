import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/core/network/response_cache.dart';
import 'package:ziro_fit/features/notifications/data/api/notification_api_service.dart';
import 'package:ziro_fit/features/notifications/data/models/notification_dto.dart';
import 'package:ziro_fit/features/notifications/data/repositories/notification_repository.dart';
import 'package:ziro_fit/features/sync/cubit/sync_cubit.dart';

class MockNotificationApiService extends Mock implements NotificationApiService {}

class MockResponseCache extends Mock implements ResponseCache {}

class MockSyncCubit extends Mock implements SyncCubit {}

NotificationDto createNotificationDto({
  String id = '1',
  String userId = 'user-1',
  String? senderId,
  String message = 'Test',
  String type = 'GENERAL',
  bool readStatus = false,
  int createdAt = 1000,
  int updatedAt = 1000,
  String? targetRole,
  String? metadata,
  String syncStatus = 'synced',
}) {
  return NotificationDto(
    id: id,
    userId: userId,
    senderId: senderId,
    message: message,
    type: type,
    readStatus: readStatus,
    createdAt: createdAt,
    updatedAt: updatedAt,
    targetRole: targetRole,
    metadata: metadata,
    syncStatus: syncStatus,
  );
}

void main() {
  late AppDatabase db;
  late NotificationApiService api;
  late ResponseCache cache;
  late NotificationRepository repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    api = MockNotificationApiService();
    cache = MockResponseCache();
    repository = NotificationRepository(api, db, cache);

    // Register a mock SyncCubit in GetIt so repository's unawaited sync() calls don't throw.
    final syncCubit = MockSyncCubit();
    when(() => syncCubit.sync()).thenAnswer((_) async {});
    if (!GetIt.instance.isRegistered<SyncCubit>()) {
      GetIt.instance.registerSingleton<SyncCubit>(syncCubit);
    }
  });

  tearDown(() async {
    await db.close();
    if (GetIt.instance.isRegistered<SyncCubit>()) {
      await GetIt.instance.unregister<SyncCubit>();
    }
  });

  group('NotificationRepository', () {
    group('fetchNotifications (page=1)', () {
      test('returns local Drift data when available', () async {
        // Seed Drift with notifications
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('Notification 1'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(2000),
              updatedAt: const Value(2000),
              syncStatus: const Value('synced'),
            ));
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n2'),
              userId: const Value('user-1'),
              message: const Value('Notification 2'),
              type: const Value('GENERAL'),
              readStatus: const Value(true),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
              syncStatus: const Value('synced'),
            ));

        // Catch-all for background refresh
        when(() => api.fetchNotifications(
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => NotificationListResponse(
              notifications: [],
              total: 0,
              page: 1,
              pageSize: 20,
              hasMore: false,
            ));

        final result = await repository.fetchNotifications();

        expect(result.notifications, hasLength(2));
        // Newest first (sorted by createdAt desc)
        expect(result.notifications[0].id, 'n1');
        expect(result.notifications[1].id, 'n2');
        expect(result.currentPage, 1);
      });

      test('calls API when local data is empty', () async {
        final dto = createNotificationDto(id: 'api-1', createdAt: 3000);
        when(() => api.fetchNotifications(
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => NotificationListResponse(
              notifications: [dto],
              total: 1,
              page: 1,
              pageSize: 20,
              hasMore: false,
            ));

        final result = await repository.fetchNotifications();

        expect(result.notifications, hasLength(1));
        expect(result.notifications.first.id, 'api-1');
        verify(() => api.fetchNotifications(page: 1, pageSize: 20)).called(1);
      });

      test('excludes soft-deleted notifications from local results', () async {
        // Seed one active and one soft-deleted notification
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('active'),
              userId: const Value('user-1'),
              message: const Value('Active'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(2000),
              updatedAt: const Value(2000),
              syncStatus: const Value('synced'),
            ));
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('deleted'),
              userId: const Value('user-1'),
              message: const Value('Deleted'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
              deletedAt: const Value(9999),
              syncStatus: const Value('pending'),
            ));

        when(() => api.fetchNotifications(
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => NotificationListResponse(
              notifications: [],
              total: 0,
              page: 1,
              pageSize: 20,
              hasMore: false,
            ));

        final result = await repository.fetchNotifications();

        expect(result.notifications, hasLength(1));
        expect(result.notifications.first.id, 'active');
      });
    });

    group('fetchNotifications (page > 1)', () {
      test('always calls API for subsequent pages', () async {
        final dto = createNotificationDto(id: 'p2-1', createdAt: 4000);
        when(() => api.fetchNotifications(
              page: any(named: 'page'),
              pageSize: any(named: 'pageSize'),
            )).thenAnswer((_) async => NotificationListResponse(
              notifications: [dto],
              total: 1,
              page: 2,
              pageSize: 20,
              hasMore: false,
            ));

        final result = await repository.fetchNotifications(page: 2);

        // Even with local data, page > 1 always fetches from API.
        verify(() => api.fetchNotifications(page: 2, pageSize: 20)).called(1);
        expect(result.notifications, hasLength(1));
        expect(result.notifications.first.id, 'p2-1');
        expect(result.currentPage, 2);
      });
    });

    group('markAsRead', () {
      test('updates readStatus and syncStatus in Drift', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('Unread'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
              syncStatus: const Value('synced'),
            ));

        await repository.markAsRead('n1');

        final row = await (db.select(db.notifications)
              ..where((t) => t.id.equals('n1')))
            .getSingle();
        expect(row.readStatus, true);
        expect(row.syncStatus, 'pending');
      });
    });

    group('markAllAsRead', () {
      test('marks all unread notifications as read', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('Unread 1'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
              syncStatus: const Value('synced'),
            ));
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n2'),
              userId: const Value('user-1'),
              message: const Value('Unread 2'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(2000),
              updatedAt: const Value(2000),
              syncStatus: const Value('synced'),
            ));

        await repository.markAllAsRead();

        final rows = await (db.select(db.notifications)
              ..where((t) => t.deletedAt.isNull())
              ..orderBy([
                (t) => OrderingTerm(
                      expression: t.createdAt,
                      mode: OrderingMode.desc,
                    ),
              ]))
            .get();
        expect(rows, hasLength(2));
        expect(rows.every((r) => r.readStatus), true);
        expect(rows.every((r) => r.syncStatus == 'pending'), true);
      });
    });

    group('deleteNotification', () {
      test('soft-deletes notification by setting deletedAt', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('To delete'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
              syncStatus: const Value('synced'),
            ));

        await repository.deleteNotification('n1');

        final row = await (db.select(db.notifications)
              ..where((t) => t.id.equals('n1')))
            .getSingle();
        expect(row.deletedAt, isNotNull);
        expect(row.syncStatus, 'pending');

        // Should be excluded from local reads
        final activeRows = await (db.select(db.notifications)
              ..where((t) => t.deletedAt.isNull()))
            .get();
        expect(activeRows, isEmpty);
      });
    });

    group('deleteAllNotifications', () {
      test('soft-deletes all notifications', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('One'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
            ));
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n2'),
              userId: const Value('user-1'),
              message: const Value('Two'),
              type: const Value('GENERAL'),
              readStatus: const Value(true),
              createdAt: const Value(2000),
              updatedAt: const Value(2000),
            ));

        await repository.deleteAllNotifications();

        final rows = await (db.select(db.notifications)
              ..where((t) => t.deletedAt.isNull()))
            .get();
        expect(rows, isEmpty);

        final allRows = await db.select(db.notifications).get();
        expect(allRows, hasLength(2));
        expect(allRows.every((r) => r.deletedAt != null), true);
        expect(allRows.every((r) => r.syncStatus == 'pending'), true);
      });
    });

    group('acceptRequest', () {
      test('calls API and soft-deletes notification in Drift', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('req-1'),
              userId: const Value('user-1'),
              message: const Value('Link request'),
              type: const Value('link_request'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
            ));

        when(() => api.acceptRequest('req-1')).thenAnswer((_) async {});

        await repository.acceptRequest('req-1');

        verify(() => api.acceptRequest('req-1')).called(1);

        final row = await (db.select(db.notifications)
              ..where((t) => t.id.equals('req-1')))
            .getSingle();
        expect(row.deletedAt, isNotNull);
        expect(row.syncStatus, 'synced');
      });

      test('rethrows when API throws', () async {
        when(() => api.acceptRequest('req-1'))
            .thenThrow(Exception('API error'));

        await expectLater(
          () => repository.acceptRequest('req-1'),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('declineRequest', () {
      test('calls API and soft-deletes notification in Drift', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('req-1'),
              userId: const Value('user-1'),
              message: const Value('Link request'),
              type: const Value('link_request'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
            ));

        when(() => api.declineRequest('req-1')).thenAnswer((_) async {});

        await repository.declineRequest('req-1');

        verify(() => api.declineRequest('req-1')).called(1);

        final row = await (db.select(db.notifications)
              ..where((t) => t.id.equals('req-1')))
            .getSingle();
        expect(row.deletedAt, isNotNull);
        expect(row.syncStatus, 'synced');
      });

      test('rethrows when API throws', () async {
        when(() => api.declineRequest('req-1'))
            .thenThrow(Exception('API error'));

        await expectLater(
          () => repository.declineRequest('req-1'),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('invalidateCache', () {
      test('clears all notifications from Drift', () async {
        await db.into(db.notifications).insert(NotificationsCompanion(
              id: const Value('n1'),
              userId: const Value('user-1'),
              message: const Value('Test'),
              type: const Value('GENERAL'),
              readStatus: const Value(false),
              createdAt: const Value(1000),
              updatedAt: const Value(1000),
            ));

        await repository.invalidateCache();

        final rows = await db.select(db.notifications).get();
        expect(rows, isEmpty);
      });
    });
  });
}
