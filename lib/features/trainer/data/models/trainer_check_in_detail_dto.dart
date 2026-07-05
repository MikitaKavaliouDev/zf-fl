import 'package:freezed_annotation/freezed_annotation.dart';

import 'check_in_photo_dto.dart';
import 'check_in_client_ref_dto.dart';

part 'trainer_check_in_detail_dto.freezed.dart';
part 'trainer_check_in_detail_dto.g.dart';

@freezed
abstract class TrainerCheckInDetailDto with _$TrainerCheckInDetailDto {
  const factory TrainerCheckInDetailDto({
    required String id,
    required String clientId,
    required String date,
    required String status,
    String? checkInType,
    String? requestedBy,
    String? requestedAt,
    String? dueDate,
    double? weight,
    double? waistCm,
    double? sleepHours,
    int? energyLevel,
    int? stressLevel,
    int? hungerLevel,
    int? digestionLevel,
    String? nutritionCompliance,
    String? weeklyNotes,
    String? clientNotes,
    String? weeklyPhotoUrl,
    double? chestCm,
    double? armCm,
    double? thighCm,
    double? hipCm,
    double? sleepQuality,
    String? energyTrend,
    int? programSatisfaction,
    bool? hasInjuries,
    String? injuryNotes,
    bool? goalsOnTrack,
    String? goalNotes,
    String? monthlyNotes,
    String? frontPhotoUrl,
    String? sidePhotoUrl,
    String? backPhotoUrl,
    String? trainerResponse,
    String? reviewedAt,
    String? reviewedByUserId,
    @Default(<CheckInPhotoDto>[]) List<CheckInPhotoDto> photos,
    required CheckInClientRefDto client,
    required String createdAt,
    required String updatedAt,
  }) = _TrainerCheckInDetailDto;

  factory TrainerCheckInDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerCheckInDetailDtoFromJson(json);
}
