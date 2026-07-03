import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_client_list_item_dto.dart';

part 'trainer_clients_state.freezed.dart';

@freezed
sealed class TrainerClientsState with _$TrainerClientsState {
  const factory TrainerClientsState.initial() = TrainerClientsInitial;

  const factory TrainerClientsState.loading() = TrainerClientsLoading;

  const factory TrainerClientsState.loaded({
    @Default([]) List<TrainerClientListItemDto> clients,
    @Default(false) bool isSearching,
  }) = TrainerClientsLoaded;

  const factory TrainerClientsState.error(String message) = TrainerClientsError;
}
