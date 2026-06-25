import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_detail_dto.freezed.dart';
part 'check_in_detail_dto.g.dart';

@freezed
abstract class CheckInDetailDto with _$CheckInDetailDto {
  const factory CheckInDetailDto({
    required String id,
    required DateTime date,
    required String status,
    double? weight,
    double? waistCm,
    double? sleepHours,
    int? energyLevel,
    int? stressLevel,
    int? hungerLevel,
    int? digestionLevel,
    String? nutritionCompliance,
    String? clientNotes,
    @Default(<CheckInPhotoDetailDto>[]) List<CheckInPhotoDetailDto> photos,
    CheckInReviewerDto? reviewedBy,
  }) = _CheckInDetailDto;

  factory CheckInDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInDetailDtoFromJson(json);
}

@freezed
abstract class CheckInPhotoDetailDto with _$CheckInPhotoDetailDto {
  const factory CheckInPhotoDetailDto({
    required String id,
    required String imageUrl,
    String? caption,
    DateTime? photoDate,
  }) = _CheckInPhotoDetailDto;

  factory CheckInPhotoDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInPhotoDetailDtoFromJson(json);
}

@freezed
abstract class CheckInReviewerDto with _$CheckInReviewerDto {
  const factory CheckInReviewerDto({
    required String name,
    String? photoUrl,
  }) = _CheckInReviewerDto;

  factory CheckInReviewerDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInReviewerDtoFromJson(json);
}
