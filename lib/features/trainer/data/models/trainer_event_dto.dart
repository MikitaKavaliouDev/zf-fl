import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_event_dto.freezed.dart';
part 'trainer_event_dto.g.dart';

/// Backend returns price as a String (e.g. "12.17"), parse to double.
/// Must be a top-level function (not a class static method) so freezed
/// generated code can reference it across library boundaries.
double stringFromNum(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

@freezed
abstract class TrainerEventDto with _$TrainerEventDto {
  const factory TrainerEventDto({
    required String id,
    required String title,
    required String startTime,
    required String endTime,
    @JsonKey(fromJson: stringFromNum) required double price,
    required int capacity,
    required String locationName,
    required String address,
    String? city,
    String? description,
    double? latitude,
    double? longitude,
    String? imageUrl,
    String? category,
    String? currency,
    @Default(0) int enrolledCount,
    String? status,
    @Default(false) bool isPromoted,
    required String createdAt,
  }) = _TrainerEventDto;

  factory TrainerEventDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerEventDtoFromJson(json);
}
