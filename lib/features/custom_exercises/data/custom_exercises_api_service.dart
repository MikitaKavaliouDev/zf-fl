import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/custom_exercise_dto.dart';

@injectable
class CustomExercisesApiService {
  final Dio _dio;

  CustomExercisesApiService(this._dio);

  /// GET /api/custom-exercises — fetch all custom exercises for the user.
  Future<List<CustomExerciseDto>> getCustomExercises() async {
    final response = await _dio.get('/api/custom-exercises');
    final data = response.data['data'] as Map<String, dynamic>;
    final exercises = data['exercises'] as List<dynamic>;
    return exercises
        .map((e) => CustomExerciseDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/custom-exercises — create a new custom exercise.
  Future<CustomExerciseDto> createCustomExercise(
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.post(
      '/api/custom-exercises',
      data: body,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return CustomExerciseDto.fromJson(
      data['newExercise'] as Map<String, dynamic>,
    );
  }

  /// PUT /api/custom-exercises/[id] — update an existing custom exercise.
  Future<CustomExerciseDto> updateCustomExercise(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.put(
      '/api/custom-exercises/$id',
      data: body,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return CustomExerciseDto.fromJson(
      data['updatedExercise'] as Map<String, dynamic>,
    );
  }

  /// DELETE /api/custom-exercises/[id] — delete a custom exercise.
  Future<void> deleteCustomExercise(String id) async {
    await _dio.delete('/api/custom-exercises/$id');
  }
}
