import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/custom_exercises/data/custom_exercises_api_service.dart';
import 'package:ziro_fit/features/custom_exercises/data/models/custom_exercise_dto.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late CustomExercisesApiService service;

  setUp(() {
    dio = MockDio();
    service = CustomExercisesApiService(dio);
  });

  group('CustomExercisesApiService', () {
    test('getCustomExercises returns parsed list', () async {
      when(() => dio.get('/api/custom-exercises')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/custom-exercises'),
          data: {
            'data': {
              'exercises': [
                {
                  'id': '1',
                  'name': 'Turkish Get-Up',
                  'metricType': 'STRENGTH',
                  'muscleGroup': 'Core',
                  'equipment': 'Kettlebell',
                },
              ],
            },
          },
          statusCode: 200,
        ),
      );

      final exercises = await service.getCustomExercises();
      expect(exercises, hasLength(1));
      expect(exercises.first.name, 'Turkish Get-Up');
      expect(exercises.first.metricType, 'STRENGTH');
    });

    test('createCustomExercise returns parsed DTO', () async {
      when(() => dio.post('/api/custom-exercises', data: any(named: 'data')))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/custom-exercises'),
          data: {
            'data': {
              'newExercise': {
                'id': '2',
                'name': 'Pallof Press',
                'metricType': 'STRENGTH',
              },
            },
          },
          statusCode: 201,
        ),
      );

      final result =
          await service.createCustomExercise({'name': 'Pallof Press'});
      expect(result.name, 'Pallof Press');
      expect(result.id, '2');
    });

    test('updateCustomExercise returns parsed DTO', () async {
      when(() => dio.put('/api/custom-exercises/1', data: any(named: 'data')))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/custom-exercises/1'),
          data: {
            'data': {
              'updatedExercise': {
                'id': '1',
                'name': 'Turkish Get-Up V2',
                'metricType': 'STRENGTH',
              },
            },
          },
          statusCode: 200,
        ),
      );

      final result = await service.updateCustomExercise(
        '1',
        {'name': 'Turkish Get-Up V2'},
      );
      expect(result.name, 'Turkish Get-Up V2');
    });

    test('deleteCustomExercise succeeds', () async {
      when(() => dio.delete('/api/custom-exercises/1')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/custom-exercises/1'),
          data: {'data': {'message': 'Custom exercise deleted.'}},
          statusCode: 200,
        ),
      );

      await expectLater(service.deleteCustomExercise('1'), completes);
    });
  });
}
