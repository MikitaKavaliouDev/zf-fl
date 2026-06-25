import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_service_dto.freezed.dart';
part 'trainer_service_dto.g.dart';

@freezed
abstract class TrainerServiceDto with _$TrainerServiceDto {
  const factory TrainerServiceDto({
    required String id,
    required String title,
    required String description,
    String? price,
    String? currency,
    int? duration,
  }) = _TrainerServiceDto;

  factory TrainerServiceDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerServiceDtoFromJson(json);
}
