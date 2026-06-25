import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/analytics_repository.dart';
import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import '../data/models/widget_config_dto.dart';
import 'analytics_state.dart';

@injectable
class AnalyticsCubit extends Cubit<AnalyticsState> {
  final AnalyticsRepository _repository;

  AnalyticsCubit(this._repository) : super(const AnalyticsState.initial());

  /// Fetch analytics, progress, and widget config in parallel.
  Future<void> loadData() async {
    emit(const AnalyticsState.loading());
    try {
      final results = await Future.wait([
        _repository.getAnalytics(),
        _repository.getProgress(),
        _repository.getWidgetConfig(),
      ]);
      emit(AnalyticsState.loaded(
        analytics: results[0] as AnalyticsResponseDto,
        progress: results[1] as ProgressResponseDto,
        widgets: results[2] as WidgetConfigDto,
      ));
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit.loadData failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      emit(const AnalyticsState.error('Failed to load analytics data.'));
    }
  }

  /// Toggle a widget's visibility by its [widgetId].
  void toggleWidgetVisibility(String widgetId) {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    final updatedWidgets = s.widgets.widgets.map((w) {
      if (w.id == widgetId) {
        return w.copyWith(isVisible: !w.isVisible);
      }
      return w;
    }).toList();
    emit(s.copyWith(widgets: s.widgets.copyWith(widgets: updatedWidgets)));
  }

  /// Reorder widgets after a drag-and-drop.
  void reorderWidgets(int oldIndex, int newIndex) {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    final widgets = [...s.widgets.widgets];
    final item = widgets.removeAt(oldIndex);
    widgets.insert(newIndex, item);
    final reordered = widgets.asMap().entries.map((e) {
      return e.value.copyWith(order: e.key);
    }).toList();
    emit(s.copyWith(
      widgets: s.widgets.copyWith(widgets: reordered),
    ));
  }

  /// Persist widget configuration to the backend.
  Future<void> saveWidgetConfig() async {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    try {
      await _repository.updateWidgetConfig(s.widgets);
      developer.log('Widget config saved successfully', name: 'analytics');
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit.saveWidgetConfig failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      emit(const AnalyticsState.error('Failed to save widget configuration.'));
    }
  }

  /// Reload all data.
  Future<void> refresh() => loadData();
}
