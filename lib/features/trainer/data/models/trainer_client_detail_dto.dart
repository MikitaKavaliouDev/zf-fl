import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_client_detail_dto.freezed.dart';
part 'trainer_client_detail_dto.g.dart';

@freezed
abstract class TrainerClientDetailDto with _$TrainerClientDetailDto {
  const factory TrainerClientDetailDto({
    required String id,
    required String name,
    String? email,
    String? phone,
    required String status,
    required String createdAt,
    int? checkInDay,
    int? checkInHour,
    String? dateOfBirth,
    String? goals,
    String? healthNotes,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? avatarUrl,
    String? trainerId,
  }) = _TrainerClientDetailDto;

  factory TrainerClientDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerClientDetailDtoFromJson(json);
}
