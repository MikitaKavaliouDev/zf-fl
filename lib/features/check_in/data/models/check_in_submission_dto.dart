import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_submission_dto.freezed.dart';
part 'check_in_submission_dto.g.dart';

@freezed
abstract class CheckInSubmissionDto with _$CheckInSubmissionDto {
  const factory CheckInSubmissionDto({
    double? weight,
    double? waistCm,
    double? sleepHours,
    int? energyLevel,
    int? stressLevel,
    int? hungerLevel,
    int? digestionLevel,
    String? nutritionCompliance,
    @Default('') String clientNotes,
    @Default(<CheckInPhotoDto>[]) List<CheckInPhotoDto> photos,
  }) = _CheckInSubmissionDto;

  factory CheckInSubmissionDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInSubmissionDtoFromJson(json);
}

@freezed
abstract class CheckInPhotoDto with _$CheckInPhotoDto {
  const factory CheckInPhotoDto({
    required String imagePath,
    String? caption,
    String? date,
  }) = _CheckInPhotoDto;

  factory CheckInPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInPhotoDtoFromJson(json);
}
