import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/features/notifications/cubit/notifications_cubit.dart';
import 'package:ziro_fit/features/notifications/cubit/notifications_state.dart';
import 'package:ziro_fit/features/notifications/data/models/notification_dto.dart';
import 'package:ziro_fit/features/notifications/data/repositories/notification_repository.dart';
import 'package:ziro_fit/features/notifications/data/services/notification_realtime_service.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

class MockNotificationRealtimeService extends Mock
    implements NotificationRealtimeService {}

NotificationDto createNotification({
  String id = '1',
  String userId = 'user-1',
  String? senderId,
  String message = 'Test notification',
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
  late MockNotificationRepository repository;
  late MockNotificationRealtimeService realtimeService;
  late NotificationsCubit cubit;
  late StreamController<NotificationRealtimeEvent> eventsController;

  setUp(() {
    repository = MockNotificationRepository();
    realtimeService = MockNotificationRealtimeService();
    eventsController = StreamController<NotificationRealtimeEvent>.broadcast();

    when(() => realtimeService.events)
        .thenAnswer((_) => eventsController.stream);
    when(() => realtimeService.subscribe(any())).thenReturn(null);
    when(() => realtimeService.unsubscribe()).thenReturn(null);

    cubit = NotificationsCubit(repository, realtimeService);
  });

  tearDown(() {
    cubit.close();
    eventsController.close();
  });

  group('NotificationsCubit', () {
    test('initial state is NotificationsState.initial', () {
      expect(cubit.state, const NotificationsState.initial());
    });

    group('fetchNotifications', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'emits loaded with notifications on success',
        build: () {
          when(() => repository.fetchNotifications()).thenAnswer(
            (_) async => PaginatedNotifications(
              notifications: [
                createNotification(id: '1', readStatus: false),
                createNotification(id: '2', readStatus: true),
              ],
              hasMore: true,
              currentPage: 1,
            ),
          );
          return cubit;
        },
        act: (cubit) => cubit.fetchNotifications(),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length', 2)
              .having((s) => s.unreadCount, 'unreadCount', 1)
              .having((s) => s.hasMore, 'hasMore', true)
              .having((s) => s.currentPage, 'currentPage', 1),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'emits error when initial state and fetch fails',
        build: () {
          when(() => repository.fetchNotifications())
              .thenThrow(Exception('Network error'));
          return cubit;
        },
        act: (cubit) => cubit.fetchNotifications(),
        expect: () => [
          isA<NotificationsError>(),
        ],
      );
    });

    group('loadMore', () {
      final page1 = [
        createNotification(id: '1', readStatus: false),
      ];
      final page2 = [
        createNotification(id: '2', readStatus: true),
      ];

      blocTest<NotificationsCubit, NotificationsState>(
        'appends next page when hasMore is true',
        build: () {
          when(() => repository.fetchNotifications(page: 2)).thenAnswer(
            (_) async => PaginatedNotifications(
              notifications: page2,
              hasMore: false,
              currentPage: 2,
            ),
          );
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: page1,
          unreadCount: 1,
          hasMore: true,
          currentPage: 1,
        ),
        act: (cubit) => cubit.loadMore(),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.isLoadingMore, 'isLoadingMore', true)
              .having((s) => s.notifications.length, 'length', 1)
              .having((s) => s.currentPage, 'currentPage', 1),
          isA<NotificationsLoaded>()
              .having((s) => s.isLoadingMore, 'isLoadingMore', false)
              .having((s) => s.notifications.length, 'length', 2)
              .having((s) => s.currentPage, 'currentPage', 2),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'does nothing when hasMore is false',
        build: () => cubit,
        seed: () => NotificationsState.loaded(
          notifications: page1,
          unreadCount: 1,
          hasMore: false,
          currentPage: 1,
        ),
        act: (cubit) => cubit.loadMore(),
        expect: () => [],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'does nothing when isLoadingMore is true',
        build: () => cubit,
        seed: () => NotificationsState.loaded(
          notifications: page1,
          unreadCount: 1,
          hasMore: true,
          currentPage: 1,
          isLoadingMore: true,
        ),
        act: (cubit) => cubit.loadMore(),
        expect: () => [],
      );
    });

    group('markAsRead', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'marks notification as read and updates unreadCount',
        build: () {
          when(() => repository.markAsRead('1')).thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: true),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.markAsRead('1'),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.unreadCount, 'unreadCount', 0)
              .having(
                (s) => s.notifications[0].readStatus,
                'notif 1 read',
                true,
              )
              .having(
                (s) => s.notifications[1].readStatus,
                'notif 2 read',
                true,
              ),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'does nothing when not in loaded state',
        build: () => cubit,
        seed: () => const NotificationsState.initial(),
        act: (cubit) => cubit.markAsRead('1'),
        expect: () => [],
      );
    });

    group('markAllAsRead', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'marks all as read and resets unreadCount to 0',
        build: () {
          when(() => repository.markAllAsRead()).thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: false),
          ],
          unreadCount: 2,
          hasMore: false,
        ),
        act: (cubit) => cubit.markAllAsRead(),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.unreadCount, 'unreadCount', 0)
              .having(
                (s) => s.notifications.every((n) => n.readStatus),
                'all read',
                true,
              ),
        ],
      );
    });

    group('deleteNotification', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'removes notification and decrements unreadCount',
        build: () {
          when(() => repository.deleteNotification('1'))
              .thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: true),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.deleteNotification('1'),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length', 1)
              .having((s) => s.unreadCount, 'unreadCount', 0)
              .having((s) => s.notifications.first.id, 'remaining id', '2'),
        ],
      );
    });

    group('deleteAllNotifications', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'clears all notifications and resets unreadCount',
        build: () {
          when(() => repository.deleteAllNotifications())
              .thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: true),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.deleteAllNotifications(),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications, 'empty', isEmpty)
              .having((s) => s.unreadCount, 'unreadCount', 0),
        ],
      );
    });

    group('acceptRequest', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'removes notification and calls acceptRequest on repo',
        build: () {
          when(() => repository.acceptRequest('1'))
              .thenAnswer((_) async {});
          when(() => repository.invalidateCache())
              .thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: true),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.acceptRequest('1'),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length', 1)
              .having((s) => s.unreadCount, 'unreadCount', 0),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'emits error when acceptRequest fails',
        build: () {
          when(() => repository.acceptRequest('1'))
              .thenThrow(Exception('API error'));
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.acceptRequest('1'),
        expect: () => [
          isA<NotificationsError>(),
        ],
      );
    });

    group('declineRequest', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'removes notification and calls declineRequest on repo',
        build: () {
          when(() => repository.declineRequest('1'))
              .thenAnswer((_) async {});
          when(() => repository.invalidateCache())
              .thenAnswer((_) async {});
          return cubit;
        },
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: true),
          ],
          unreadCount: 1,
          hasMore: false,
        ),
        act: (cubit) => cubit.declineRequest('1'),
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length', 1)
              .having((s) => s.unreadCount, 'unreadCount', 0),
        ],
      );
    });

    group('pendingLinkRequest', () {
      test('returns null when state is not loaded', () {
        expect(cubit.pendingLinkRequest, isNull);
      });

      blocTest<NotificationsCubit, NotificationsState>(
        'returns first pending link request notification',
        build: () => cubit,
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(
              id: 'gen-1',
              message: 'General notification',
              readStatus: false,
            ),
            createNotification(
              id: 'link-1',
              message: 'wants to connect',
              type: 'client_link_request',
              readStatus: false,
            ),
          ],
          unreadCount: 2,
          hasMore: false,
        ),
        verify: (cubit) {
          expect(cubit.pendingLinkRequest, isNotNull);
          expect(cubit.pendingLinkRequest!.id, 'link-1');
        },
      );
    });

    group('unreadCount', () {
      test('returns 0 when state is not loaded', () {
        expect(cubit.unreadCount, 0);
      });

      blocTest<NotificationsCubit, NotificationsState>(
        'returns unreadCount from loaded state',
        build: () => cubit,
        seed: () => NotificationsState.loaded(
          notifications: [
            createNotification(id: '1', readStatus: false),
            createNotification(id: '2', readStatus: false),
            createNotification(id: '3', readStatus: true),
          ],
          unreadCount: 2,
          hasMore: false,
        ),
        verify: (cubit) {
          expect(cubit.unreadCount, 2);
        },
      );
    });

    group('realtime event handling', () {
      blocTest<NotificationsCubit, NotificationsState>(
        'inserts new notification from realtime event',
        build: () {
          when(() => repository.fetchNotifications()).thenAnswer(
            (_) async => PaginatedNotifications(
              notifications: [
                createNotification(id: '1', message: 'Existing'),
              ],
              hasMore: false,
              currentPage: 1,
            ),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.fetchNotifications();
          eventsController.add(
            NotificationInserted(
              createNotification(id: '2', message: 'Realtime'),
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length after fetch', 1),
          isA<NotificationsLoaded>()
              .having(
                (s) => s.notifications.length,
                'length after insert',
                2,
              )
              .having(
                (s) => s.notifications.first.id,
                'first is newest',
                '2',
              ),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'updates notification from realtime event',
        build: () {
          when(() => repository.fetchNotifications()).thenAnswer(
            (_) async => PaginatedNotifications(
              notifications: [
                createNotification(id: '1', readStatus: false),
              ],
              hasMore: false,
              currentPage: 1,
            ),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.fetchNotifications();
          eventsController.add(
            NotificationUpdated(
              createNotification(id: '1', readStatus: true),
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.unreadCount, 'unread after fetch', 1),
          isA<NotificationsLoaded>()
              .having((s) => s.unreadCount, 'unread after update', 0)
              .having(
                (s) => s.notifications.first.readStatus,
                'readStatus',
                true,
              ),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        'removes notification on realtime delete event',
        build: () {
          when(() => repository.fetchNotifications()).thenAnswer(
            (_) async => PaginatedNotifications(
              notifications: [
                createNotification(id: '1'),
                createNotification(id: '2'),
              ],
              hasMore: false,
              currentPage: 1,
            ),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.fetchNotifications();
          eventsController.add(const NotificationDeleted('1'));
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'length after fetch', 2),
          isA<NotificationsLoaded>()
              .having(
                (s) => s.notifications.length,
                'length after delete',
                1,
              )
              .having(
                (s) => s.notifications.first.id,
                'remaining id',
                '2',
              ),
        ],
      );

      blocTest<NotificationsCubit, NotificationsState>(
        're-fetches when realtime connection is lost',
        build: () {
          var callCount = 0;
          when(() => repository.fetchNotifications()).thenAnswer(
            (_) async {
              callCount++;
              if (callCount == 1) {
                return PaginatedNotifications(
                  notifications: [
                    createNotification(id: '1'),
                  ],
                  hasMore: false,
                  currentPage: 1,
                );
              }
              return PaginatedNotifications(
                notifications: [
                  createNotification(id: '1'),
                  createNotification(id: '2'),
                ],
                hasMore: false,
                currentPage: 1,
              );
            },
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.fetchNotifications();
          eventsController.add(
            const NotificationRealtimeConnectionChanged(isConnected: false),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          isA<NotificationsLoaded>()
              .having((s) => s.notifications.length, 'after fetch', 1),
          isA<NotificationsLoaded>()
              .having(
                (s) => s.notifications.length,
                'after re-fetch',
                2,
              ),
        ],
      );
    });
  });
}
