import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ziro_fit/features/custom_exercises/cubit/custom_exercises_cubit.dart';
import 'package:ziro_fit/features/custom_exercises/cubit/custom_exercises_state.dart';
import 'package:ziro_fit/features/custom_exercises/data/custom_exercises_api_service.dart';
import 'package:ziro_fit/features/custom_exercises/data/models/custom_exercise_dto.dart';

class MockCustomExercisesApiService extends Mock
    implements CustomExercisesApiService {}

void main() {
  late CustomExercisesApiService apiService;
  late CustomExercisesCubit cubit;

  final testExercise = CustomExerciseDto(
    id: '1',
    name: 'Turkish Get-Up',
    metricType: 'STRENGTH',
    muscleGroup: 'Core',
    equipment: 'Kettlebell',
    description: 'A full-body movement',
  );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    apiService = MockCustomExercisesApiService();
    cubit = CustomExercisesCubit(apiService);
  });

  tearDown(() {
    cubit.close();
  });

  group('CustomExercisesCubit', () {
    test('initial state is CustomExercisesInitial', () {
      expect(cubit.state, const CustomExercisesInitial());
    });

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => apiService.getCustomExercises())
            .thenAnswer((_) async => [testExercise]);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const CustomExercisesLoading(),
        CustomExercisesLoaded(exercises: [testExercise]),
      ],
    );

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'emits [loading, error] when load fails with no cache',
      build: () {
        when(() => apiService.getCustomExercises())
            .thenThrow(Exception('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const CustomExercisesLoading(),
        isA<CustomExercisesError>(),
      ],
    );

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'falls back to cached data when load fails',
      build: () {
        SharedPreferences.setMockInitialValues({
          'custom_exercises_cache': jsonEncode([testExercise.toJson()]),
        });

        when(() => apiService.getCustomExercises())
            .thenThrow(Exception('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const CustomExercisesLoading(),
        CustomExercisesLoaded(exercises: [testExercise]),
      ],
    );

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'emits [loading, loaded] after create succeeds',
      build: () {
        when(() => apiService.createCustomExercise(any()))
            .thenAnswer((_) async => testExercise);
        when(() => apiService.getCustomExercises())
            .thenAnswer((_) async => [testExercise]);
        return cubit;
      },
      act: (cubit) => cubit.create(name: 'Turkish Get-Up'),
      expect: () => [
        const CustomExercisesLoading(),
        CustomExercisesLoaded(exercises: [testExercise]),
      ],
    );

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'emits error when create fails',
      build: () {
        when(() => apiService.createCustomExercise(any()))
            .thenThrow(Exception('Create failed'));
        return cubit;
      },
      act: (cubit) => cubit.create(name: 'Turkish Get-Up'),
      expect: () => [
        isA<CustomExercisesError>(),
      ],
    );

    blocTest<CustomExercisesCubit, CustomExercisesState>(
      'optimistically removes exercise on delete, rolls back on failure',
      build: () {
        when(() => apiService.getCustomExercises())
            .thenAnswer((_) async => [testExercise]);
        when(() => apiService.deleteCustomExercise(any()))
            .thenThrow(Exception('Delete failed'));
        return cubit;
      },
      act: (cubit) async {
        await cubit.load();
        await cubit.delete('1');
      },
      expect: () => [
        const CustomExercisesLoading(),
        CustomExercisesLoaded(exercises: [testExercise]),
        CustomExercisesLoaded(exercises: []), // optimistic removal
        CustomExercisesLoaded(exercises: [testExercise]), // rollback
      ],
    );
  });
}
