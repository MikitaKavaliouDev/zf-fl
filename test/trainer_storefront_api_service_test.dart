import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainer/data/trainer_storefront_api_service.dart';
import 'package:ziro_fit/features/trainer/data/models/storefront_profile_dto.dart';
import 'package:ziro_fit/features/trainer/data/models/stripe_status_dto.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late TrainerStorefrontApiService service;

  final profileJson = {
    'data': {
      'name': 'Test Trainer',
      'username': 'testtrainer',
      'bio': 'Experienced fitness coach',
      'specialties': 'Strength Training, HIIT',
      'tags': ['Strength', 'Cardio'],
      'packages': [
        {
          'id': 'pkg1',
          'name': 'Basic Plan',
          'price': '99.99',
          'duration': 'Monthly',
        },
      ],
      'services': [
        {
          'id': 'svc1',
          'name': 'Personal Training',
          'description': 'One-on-one coaching',
          'price': '50',
        },
      ],
      'socialLinks': [],
      'externalLinks': [],
      'testimonials': [],
      'transformationPhotos': [],
    },
  };

  setUp(() {
    dio = MockDio();
    service = TrainerStorefrontApiService(dio);
  });

  group('TrainerStorefrontApiService', () {
    test('getProfile returns parsed DTO', () async {
      when(() => dio.get('/api/trainer/profile/text')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile/text'),
          data: profileJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Test Trainer');
      expect(result.bio, 'Experienced fitness coach');
      expect(result.specialties, 'Strength Training, HIIT');
      expect(result.tags, ['Strength', 'Cardio']);
      expect(result.packages, hasLength(1));
      expect(result.packages.first.name, 'Basic Plan');
      expect(result.packages.first.price, '99.99');
      expect(result.packages.first.duration, 'Monthly');
      expect(result.services, hasLength(1));
      expect(result.services.first.name, 'Personal Training');
    });

    test('getProfile handles empty packages and services', () async {
      final emptyJson = {
        'data': {
          'name': 'Empty Trainer',
          'username': 'empty',
          'bio': 'No packages yet',
          'packages': <Map<String, dynamic>>[],
          'services': <Map<String, dynamic>>[],
          'tags': <String>[],
          'socialLinks': [],
          'externalLinks': [],
          'testimonials': [],
          'transformationPhotos': [],
        },
      };

      when(() => dio.get('/api/trainer/profile/text')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile/text'),
          data: emptyJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Empty Trainer');
      expect(result.packages, isEmpty);
      expect(result.services, isEmpty);
    });

    test('getProfile handles missing optional fields', () async {
      final minimalJson = {
        'data': {
          'name': 'Trainer',
          'packages': <Map<String, dynamic>>[],
          'services': <Map<String, dynamic>>[],
          'tags': <String>[],
          'socialLinks': [],
          'externalLinks': [],
          'testimonials': [],
          'transformationPhotos': [],
        },
      };

      when(() => dio.get('/api/trainer/profile/text')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile/text'),
          data: minimalJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Trainer');
      expect(result.bio, isNull);
      expect(result.username, isNull);
      expect(result.specialties, isNull);
    });

    test('getProfile throws on network error', () async {
      when(() => dio.get('/api/trainer/profile/text')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/trainer/profile/text'),
          error: 'Connection refused',
          type: DioExceptionType.connectionError,
        ),
      );

      expect(
        () => service.getProfile(),
        throwsA(isA<DioException>()),
      );
    });
  });
}
