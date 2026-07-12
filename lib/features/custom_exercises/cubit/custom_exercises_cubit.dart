import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/custom_exercises_api_service.dart';
import '../data/models/custom_exercise_dto.dart';
import 'custom_exercises_state.dart';

@injectable
class CustomExercisesCubit extends Cubit<CustomExercisesState> {
  final CustomExercisesApiService _apiService;

  static const String _cacheKey = 'custom_exercises_cache';

  CustomExercisesCubit(this._apiService)
      : super(const CustomExercisesState.initial());

  /// Load exercises from the API. Falls back to cached data on failure.
  Future<void> load() async {
    emit(const CustomExercisesState.loading());
    try {
      final exercises = await _apiService.getCustomExercises();
      _cacheExercises(exercises);
      emit(CustomExercisesState.loaded(exercises: exercises));
    } catch (e) {
      developer.log('load failed: $e', name: 'custom_exercises');
      final cached = await _readCachedExercises();
      if (cached != null) {
        emit(CustomExercisesState.loaded(exercises: cached));
      } else {
        emit(const CustomExercisesState.error('Failed to load exercises.'));
      }
    }
  }

  /// Create a new custom exercise, then re-fetch the list.
  Future<void> create({
    required String name,
    String? metricType,
    String? muscleGroup,
    String? equipment,
    String? description,
    String? videoUrl,
  }) async {
    try {
      await _apiService.createCustomExercise({
        'name': name,
        if (metricType != null) 'metricType': metricType,
        if (muscleGroup != null) 'muscleGroup': muscleGroup,
        if (equipment != null) 'equipment': equipment,
        if (description != null) 'description': description,
        if (videoUrl != null) 'videoUrl': videoUrl,
      });
      await load();
    } catch (e) {
      developer.log('create failed: $e', name: 'custom_exercises');
      emit(const CustomExercisesState.error('Failed to create exercise.'));
    }
  }

  /// Update an existing custom exercise, then re-fetch the list.
  Future<void> update(String id, Map<String, dynamic> body) async {
    try {
      await _apiService.updateCustomExercise(id, body);
      await load();
    } catch (e) {
      developer.log('update failed: $e', name: 'custom_exercises');
      emit(const CustomExercisesState.error('Failed to update exercise.'));
    }
  }

  /// Delete a custom exercise with optimistic removal. Rollback on failure.
  Future<void> delete(String id) async {
    final currentState = state;
    if (currentState is! CustomExercisesLoaded) return;

    final snapshot = currentState;
    final updatedExercises =
        currentState.exercises.where((e) => e.id != id).toList();
    emit(CustomExercisesState.loaded(exercises: updatedExercises));

    try {
      await _apiService.deleteCustomExercise(id);
      _cacheExercises(updatedExercises);
    } catch (e) {
      developer.log('delete failed: $e', name: 'custom_exercises');
      emit(snapshot);
    }
  }

  // ── Cache helpers ──

  Future<void> _cacheExercises(List<CustomExerciseDto> exercises) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(exercises.map((e) => e.toJson()).toList());
    await prefs.setString(_cacheKey, json);
  }

  Future<List<CustomExerciseDto>?> _readCachedExercises() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_cacheKey);
      if (json == null) return null;
      final list = jsonDecode(json) as List<dynamic>;
      return list
          .map((e) => CustomExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      developer.log('cache read failed: $e', name: 'custom_exercises');
      return null;
    }
  }
}
