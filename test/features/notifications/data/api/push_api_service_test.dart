import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/features/notifications/data/api/push_api_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('PushApiService', () {
    late Dio dio;
    late PushApiService service;

    setUp(() {
      dio = MockDio();
      service = PushApiService(dio);
    });

    test('registerToken sends correct request shape', () async {
      Map<String, dynamic>? capturedData;
      when(() => dio.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((invocation) {
        capturedData =
            invocation.namedArguments[const Symbol('data')] as Map<String, dynamic>?;
        return Future.value(Response<dynamic>(
          data: <String, dynamic>{},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/api/profile/me/push-token'),
        ));
      });

      await service.registerToken('test-fcm-token');

      expect(capturedData, isNotNull);
      expect(capturedData!['token'], 'test-fcm-token');
      expect(capturedData!['platform'], anyOf('android', 'ios'));
      expect(capturedData!.containsKey('osVersion'), isTrue);
      expect(capturedData!['appVersion'], '1.0.0');

      verify(() => dio.post(
            '/api/profile/me/push-token',
            data: any(named: 'data'),
          )).called(1);
    });
  });
}
