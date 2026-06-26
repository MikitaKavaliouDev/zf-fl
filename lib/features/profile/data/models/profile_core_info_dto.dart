import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_core_info_dto.freezed.dart';
part 'profile_core_info_dto.g.dart';

@freezed
abstract class ProfileCoreInfoDto with _$ProfileCoreInfoDto {
  const factory ProfileCoreInfoDto({
    required String name,
    required String username,
    @Default('KG') String weightUnit,
    String? phone,
    String? certifications,
    String? aboutMe,
    @Default('PLN') String businessCurrency,
    @Default(<String>[]) List<String> specialties,
    @Default(<String>[]) List<String> trainingTypes,
    @Default(<ProfileLocationDto>[]) List<ProfileLocationDto> locations,
  }) = _ProfileCoreInfoDto;

  factory ProfileCoreInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileCoreInfoDtoFromJson(json);
}

@freezed
abstract class ProfileLocationDto with _$ProfileLocationDto {
  const factory ProfileLocationDto({
    required String id,
    required String address,
    double? latitude,
    double? longitude,
  }) = _ProfileLocationDto;

  factory ProfileLocationDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileLocationDtoFromJson(json);
}
