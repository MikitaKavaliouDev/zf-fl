import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/trainer_repository.dart';
import 'trainer_detail_state.dart';

class TrainerDetailCubit extends Cubit<TrainerDetailState> {
  final TrainerRepository _repository;

  TrainerDetailCubit(this._repository) : super(const TrainerDetailInitial());

  Future<void> load(String username) async {
    emit(const TrainerDetailLoading());
    try {
      final trainer = await _repository.getTrainerDetail(username);
      final packages = await _repository.getTrainerPackages(username);
      emit(TrainerDetailLoaded(
        trainer: trainer,
        packages: packages,
      ));
    } catch (e) {
      emit(const TrainerDetailError('Failed to load trainer details.'));
    }
  }

  Future<void> linkTrainer(String trainerUsername) async {
    final current = state;
    if (current is! TrainerDetailLoaded) return;
    try {
      await _repository.linkTrainer(trainerUsername);
      await load(trainerUsername);
    } catch (e) {
      emit(const TrainerDetailError('Failed to link with trainer.'));
    }
  }
}
