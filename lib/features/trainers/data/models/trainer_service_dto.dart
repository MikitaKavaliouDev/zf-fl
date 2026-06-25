import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_service_dto.freezed.dart';
part 'trainer_service_dto.g.dart';

String? _parsePrice(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is num) return value.toString();
  return value.toString();
}

@freezed
abstract class TrainerServiceDto with _$TrainerServiceDto {
  const factory TrainerServiceDto({
    String? id,
    String? title,
    String? description,
    @JsonKey(fromJson: _parsePrice) String? price,
    String? currency,
    int? duration,
  }) = _TrainerServiceDto;

  factory TrainerServiceDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerServiceDtoFromJson(json);
}
