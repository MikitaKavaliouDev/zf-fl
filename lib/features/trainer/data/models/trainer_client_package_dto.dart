import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_client_package_dto.freezed.dart';
part 'trainer_client_package_dto.g.dart';

@freezed
abstract class TrainerClientPackageDto with _$TrainerClientPackageDto {
  const factory TrainerClientPackageDto({
    required String id,
    required String clientId,
    required String packageId,
    @Default(0) int sessionsRemaining,
    required String purchaseDate,
    required ClientPackageInfo package,
  }) = _TrainerClientPackageDto;

  factory TrainerClientPackageDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerClientPackageDtoFromJson(json);
}

@freezed
abstract class ClientPackageInfo with _$ClientPackageInfo {
  const factory ClientPackageInfo({
    required String name,
    @Default(0) int numberOfSessions,
  }) = _ClientPackageInfo;

  factory ClientPackageInfo.fromJson(Map<String, dynamic> json) =>
      _$ClientPackageInfoFromJson(json);
}
