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

  /// Build a nested response matching GET /api/trainer/profile shape.
  Map<String, dynamic> _buildResponse({
    required String name,
    String? username,
    String? bio,
    String? philosophy,
    String? methodology,
    dynamic specialties,
    String? certifications,
    String? avatarUrl,
    String? bannerUrl,
    List<Map<String, dynamic>> packages = const [],
    List<Map<String, dynamic>> services = const [],
    List<Map<String, dynamic>> socialLinks = const [],
    List<Map<String, dynamic>> externalLinks = const [],
    List<Map<String, dynamic>> testimonials = const [],
    List<Map<String, dynamic>> transformationPhotos = const [],
  }) {
    return {
      'data': {
        'profile': {
          'id': 'trainer-uuid',
          'name': name,
          'email': 'trainer@ziro.fit',
          'username': username,
          'role': 'trainer',
          'profile': {
            'aboutMe': bio,
            'philosophy': philosophy,
            'methodology': methodology,
            'specialties': specialties,
            'certifications': certifications,
            'profilePhotoPath': avatarUrl,
            'bannerImagePath': bannerUrl,
            'services': services,
            'socialLinks': socialLinks,
            'externalLinks': externalLinks,
            'testimonials': testimonials,
            'transformationPhotos': transformationPhotos,
          },
          'packages': packages,
        },
      },
    };
  }

  setUp(() {
    dio = MockDio();
    service = TrainerStorefrontApiService(dio);
  });

  group('TrainerStorefrontApiService', () {
    test('getProfile returns parsed DTO from nested shape', () async {
      final responseJson = _buildResponse(
        name: 'Test Trainer',
        username: 'testtrainer',
        bio: 'Experienced fitness coach',
        specialties: ['Strength Training', 'HIIT'],
        certifications: 'CPT, CSCS',
        packages: [
          {
            'id': 'pkg1',
            'name': 'Basic Plan',
            'price': '99.99',
            'numberOfSessions': 12,
          },
        ],
        services: [
          {
            'id': 'svc1',
            'title': 'Personal Training',
            'description': 'One-on-one coaching',
            'price': '50',
          },
        ],
      );

      when(() => dio.get('/api/trainer/profile')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile'),
          data: responseJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Test Trainer');
      expect(result.username, 'testtrainer');
      expect(result.bio, 'Experienced fitness coach');
      expect(result.specialties, ['Strength Training', 'HIIT']);
      expect(result.certifications, 'CPT, CSCS');
      expect(result.packages, hasLength(1));
      expect(result.packages.first.name, 'Basic Plan');
      expect(result.packages.first.price, '99.99');
      expect(result.packages.first.duration, 12);
      expect(result.services, hasLength(1));
      expect(result.services.first.name, 'Personal Training');
    });

    test('getProfile handles empty packages and services', () async {
      final responseJson = _buildResponse(
        name: 'Empty Trainer',
        username: 'empty',
        bio: 'No packages yet',
      );

      when(() => dio.get('/api/trainer/profile')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile'),
          data: responseJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Empty Trainer');
      expect(result.packages, isEmpty);
      expect(result.services, isEmpty);
    });

    test('getProfile handles null nested profile', () async {
      final responseJson = {
        'data': {
          'profile': {
            'id': 'trainer-uuid',
            'name': 'Minimal Trainer',
            'email': 'trainer@ziro.fit',
            'profile': null,
            'packages': <Map<String, dynamic>>[],
          },
        },
      };

      when(() => dio.get('/api/trainer/profile')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile'),
          data: responseJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Minimal Trainer');
      expect(result.bio, isNull);
      expect(result.specialties, isEmpty);
      expect(result.packages, isEmpty);
    });

    test('getProfile handles missing optional fields', () async {
      final responseJson = _buildResponse(name: 'Trainer');

      when(() => dio.get('/api/trainer/profile')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/trainer/profile'),
          data: responseJson,
          statusCode: 200,
        ),
      );

      final result = await service.getProfile();
      expect(result.name, 'Trainer');
      expect(result.bio, isNull);
      expect(result.username, isNull);
      expect(result.specialties, isEmpty);
    });

    test('getProfile throws on network error', () async {
      when(() => dio.get('/api/trainer/profile')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/trainer/profile'),
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
