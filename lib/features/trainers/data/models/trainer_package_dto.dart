import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_package_dto.freezed.dart';
part 'trainer_package_dto.g.dart';

@freezed
abstract class TrainerPackageDto with _$TrainerPackageDto {
  const factory TrainerPackageDto({
    required String id,
    required String name,
    String? description,
    required String price,
    String? currency,
    required int numberOfSessions,
    @Default(false) bool isActive,
  }) = _TrainerPackageDto;

  factory TrainerPackageDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerPackageDtoFromJson(json);
}
