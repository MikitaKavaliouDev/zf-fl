import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/features/notifications/data/api/notification_api_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('NotificationApiService', () {
    late Dio dio;
    late NotificationApiService service;

    setUp(() {
      dio = MockDio();
      service = NotificationApiService(dio);
    });

    group('fetchNotifications', () {
      test('returns NotificationListResponse with parsed notifications', () async {
        final responseData = <String, dynamic>{
          'data': {
            'notifications': [
              {
                'id': 'n1',
                'userId': 'user-1',
                'senderId': null,
                'message': 'Test notification',
                'type': 'GENERAL',
                'readStatus': false,
                'createdAt': 1000,
                'updatedAt': 1000,
                'syncStatus': 'synced',
              },
            ],
            'total': 1,
            'page': 1,
            'pageSize': 20,
            'hasMore': false,
          },
        };

        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: responseData,
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications'),
            ));

        final result = await service.fetchNotifications();

        expect(result.notifications, hasLength(1));
        expect(result.notifications.first.id, 'n1');
        expect(result.notifications.first.message, 'Test notification');
        expect(result.notifications.first.type, 'GENERAL');
        expect(result.notifications.first.readStatus, false);
        expect(result.total, 1);
        expect(result.page, 1);
        expect(result.pageSize, 20);
        expect(result.hasMore, false);

        verify(() => dio.get(
          '/api/notifications',
          queryParameters: {'page': 1, 'pageSize': 20},
        )).called(1);
      });

      test('handles empty response gracefully', () async {
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: <String, dynamic>{'data': <String, dynamic>{}},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications'),
            ));

        final result = await service.fetchNotifications();

        expect(result.notifications, isEmpty);
        expect(result.total, 0);
        expect(result.page, 1);
        expect(result.hasMore, false);
      });

      test('uses custom page and pageSize', () async {
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: <String, dynamic>{'data': <String, dynamic>{}},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications'),
            ));

        await service.fetchNotifications(page: 3, pageSize: 10);

        verify(() => dio.get(
          '/api/notifications',
          queryParameters: {'page': 3, 'pageSize': 10},
        )).called(1);
      });
    });

    group('markAsRead', () {
      test('sends PUT /api/notifications/:id', () async {
        when(() => dio.put(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications/n1'),
            ));

        await service.markAsRead('n1');

        verify(() => dio.put('/api/notifications/n1')).called(1);
      });
    });

    group('markAllAsRead', () {
      test('sends PUT /api/notifications/read-all', () async {
        when(() => dio.put(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications/read-all'),
            ));

        await service.markAllAsRead();

        verify(() => dio.put('/api/notifications/read-all')).called(1);
      });
    });

    group('acceptRequest', () {
      test('sends POST /api/notifications/:id/accept', () async {
        when(() => dio.post(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications/n1/accept'),
            ));

        await service.acceptRequest('n1');

        verify(() => dio.post('/api/notifications/n1/accept')).called(1);
      });
    });

    group('declineRequest', () {
      test('sends POST /api/notifications/:id/decline', () async {
        when(() => dio.post(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications/n1/decline'),
            ));

        await service.declineRequest('n1');

        verify(() => dio.post('/api/notifications/n1/decline')).called(1);
      });
    });

    group('delete', () {
      test('sends DELETE /api/notifications/:id', () async {
        when(() => dio.delete(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications/n1'),
            ));

        await service.delete('n1');

        verify(() => dio.delete('/api/notifications/n1')).called(1);
      });
    });

    group('deleteAll', () {
      test('sends DELETE /api/notifications', () async {
        when(() => dio.delete(any())).thenAnswer((_) async => Response(
              data: <String, dynamic>{},
              statusCode: 200,
              requestOptions: RequestOptions(path: '/api/notifications'),
            ));

        await service.deleteAll();

        verify(() => dio.delete('/api/notifications')).called(1);
      });
    });
  });
}
