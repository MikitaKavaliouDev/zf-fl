import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/daily_targets_repository.dart';
import 'daily_targets_state.dart';

@injectable
class DailyTargetsCubit extends Cubit<DailyTargetsState> {
  final DailyTargetsRepository _repository;

  DailyTargetsCubit(this._repository) : super(const DailyTargetsState.initial());

  /// Load daily targets for a specific date (ISO string, e.g. "2026-06-25").
  Future<void> loadTargets({String? date}) async {
    emit(const DailyTargetsState.loading());
    try {
      final targets = await _repository.getTargets(date: date);
      emit(DailyTargetsState.loaded(targets: targets));
    } catch (e) {
      developer.log('DailyTargetsCubit.loadTargets failed: $e',
          name: 'daily_targets');
      emit(const DailyTargetsState.error('Failed to load daily targets.'));
    }
  }

  /// Toggle the completion status of a target with optimistic UI + rollback.
  Future<bool> toggleComplete(String id, bool isCompleted) async {
    final s = state;
    if (s is! DailyTargetsLoaded) return false;
    final snapshot = s;

    // Optimistic update
    final updated = s.targets.map((t) {
      if (t.id == id) return t.copyWith(isCompleted: isCompleted);
      return t;
    }).toList();
    emit(DailyTargetsState.loaded(targets: updated));

    try {
      await _repository.updateTarget(id, isCompleted: isCompleted);
      return true;
    } catch (e) {
      developer.log('DailyTargetsCubit.toggleComplete failed: $e',
          name: 'daily_targets');
      emit(snapshot); // rollback
      return false;
    }
  }

  /// Update progress (currentValue) for a target with optimistic UI + rollback.
  Future<bool> updateProgress(String id, double currentValue) async {
    final s = state;
    if (s is! DailyTargetsLoaded) return false;
    final snapshot = s;

    // Optimistic update
    final updated = s.targets.map((t) {
      if (t.id == id) return t.copyWith(currentValue: currentValue);
      return t;
    }).toList();
    emit(DailyTargetsState.loaded(targets: updated));

    try {
      await _repository.updateTarget(id, currentValue: currentValue);
      return true;
    } catch (e) {
      developer.log('DailyTargetsCubit.updateProgress failed: $e',
          name: 'daily_targets');
      emit(snapshot); // rollback
      return false;
    }
  }

  /// Create a new daily target.
  Future<bool> createTarget(Map<String, dynamic> body) async {
    try {
      await _repository.createTarget(body);
      await loadTargets(date: body['date'] as String?);
      return true;
    } catch (e) {
      developer.log('DailyTargetsCubit.createTarget failed: $e',
          name: 'daily_targets');
      emit(const DailyTargetsState.error('Failed to create target.'));
      return false;
    }
  }

  /// Delete a daily target by ID.
  Future<bool> deleteTarget(String id) async {
    try {
      await _repository.deleteTarget(id);
      final s = state;
      if (s is DailyTargetsLoaded) {
        final updated = s.targets.where((t) => t.id != id).toList();
        emit(DailyTargetsState.loaded(targets: updated));
      }
      return true;
    } catch (e) {
      developer.log('DailyTargetsCubit.deleteTarget failed: $e',
          name: 'daily_targets');
      emit(const DailyTargetsState.error('Failed to delete target.'));
      return false;
    }
  }

  /// Pull-to-refresh with current date context.
  Future<void> refresh({String? date}) => loadTargets(date: date);
}
