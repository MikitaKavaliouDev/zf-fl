import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_nutrition_plan_dto.dart';

part 'trainer_client_nutrition_state.freezed.dart';

@freezed
sealed class TrainerClientNutritionState with _$TrainerClientNutritionState {
  const factory TrainerClientNutritionState.initial() =
      TrainerClientNutritionInitial;

  const factory TrainerClientNutritionState.loading() =
      TrainerClientNutritionLoading;

  const factory TrainerClientNutritionState.loaded(
    TrainerNutritionPlanDto? plan,
  ) = TrainerClientNutritionLoaded;

  const factory TrainerClientNutritionState.error(String message) =
      TrainerClientNutritionError;
}
