import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_client_list_item_dto.freezed.dart';
part 'trainer_client_list_item_dto.g.dart';

@freezed
abstract class TrainerClientListItemDto with _$TrainerClientListItemDto {
  const factory TrainerClientListItemDto({
    required String id,
    required String name,
    String? email,
    String? phone,
    required String status,
    String? userId,
    String? avatarUrl,
    String? lastWorkoutDate,
    @Default('medium') String engagementScore,
    String? activeProgramName,
  }) = _TrainerClientListItemDto;

  factory TrainerClientListItemDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerClientListItemDtoFromJson(json);
}
