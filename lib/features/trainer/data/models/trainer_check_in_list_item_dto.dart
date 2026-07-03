import 'package:freezed_annotation/freezed_annotation.dart';

import 'check_in_client_ref_dto.dart';

part 'trainer_check_in_list_item_dto.freezed.dart';
part 'trainer_check_in_list_item_dto.g.dart';

@freezed
abstract class TrainerCheckInListItemDto with _$TrainerCheckInListItemDto {
  const factory TrainerCheckInListItemDto({
    required String id,
    required String clientId,
    required String date,
    required String status,
    String? trainerResponse,
    String? reviewedAt,
    required CheckInClientRefDto client,
  }) = _TrainerCheckInListItemDto;

  factory TrainerCheckInListItemDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerCheckInListItemDtoFromJson(json);
}
