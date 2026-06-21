import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_repository.dart';
import 'trainer_list_state.dart';

part 'trainer_list_cubit.freezed.dart';

@freezed
sealed class TrainerListEvent with _$TrainerListEvent {
  const factory TrainerListEvent.load({
    String? query,
    double? lat,
    double? lng,
    String? sortBy,
    String? specialties,
    double? minRating,
    String? trainingTypes,
  }) = TrainerListLoad;

  const factory TrainerListEvent.loadMore() = TrainerListLoadMore;

  const factory TrainerListEvent.search(String query) = TrainerListSearch;

  const factory TrainerListEvent.refresh() = TrainerListRefresh;
}

@injectable
class TrainerListCubit extends Cubit<TrainerListState> {
  final TrainerRepository _repository;
  Timer? _debounce;

  TrainerListCubit(this._repository) : super(const TrainerListInitial());

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }

  Future<void> load({
    String? query,
    double? lat,
    double? lng,
    String? sortBy,
    String? specialties,
    double? minRating,
    String? trainingTypes,
  }) async {
    emit(const TrainerListLoading());
    try {
      final trainers = await _repository.getTrainers(
        query: query,
        lat: lat,
        lng: lng,
        sortBy: sortBy,
        specialties: specialties,
        minRating: minRating,
        trainingTypes: trainingTypes,
      );
      emit(TrainerListLoaded(
        trainers: trainers,
        page: 1,
        hasMore: trainers.length >= 15,
        query: query,
        lat: lat,
        lng: lng,
        sortBy: sortBy,
        specialties: specialties,
        minRating: minRating,
        trainingTypes: trainingTypes,
      ));
    } catch (e) {
      emit(const TrainerListError('Failed to load trainers.'));
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! TrainerListLoaded || !current.hasMore) return;
    if (current is TrainerListLoadingMore) return;

    emit(TrainerListLoadingMore(current));
    try {
      final nextPage = current.page + 1;
      final trainers = await _repository.getTrainers(
        page: nextPage,
        query: current.query,
        lat: current.lat,
        lng: current.lng,
        sortBy: current.sortBy,
        specialties: current.specialties,
        minRating: current.minRating,
        trainingTypes: current.trainingTypes,
      );
      emit(current.copyWith(
        trainers: [...current.trainers, ...trainers],
        page: nextPage,
        hasMore: trainers.length >= 15,
      ));
    } catch (e) {
      emit(current); // revert to previous loaded state
    }
  }

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      load(query: query.isEmpty ? null : query);
    });
  }

  Future<void> refresh() async {
    final current = state;
    if (current is TrainerListLoaded) {
      await load(query: current.query);
    } else {
      await load();
    }
  }
}
