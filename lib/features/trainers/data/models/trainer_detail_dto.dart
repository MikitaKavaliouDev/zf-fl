import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_detail_dto.freezed.dart';
part 'trainer_detail_dto.g.dart';

@freezed
abstract class TrainerDetailDto with _$TrainerDetailDto {
  const factory TrainerDetailDto({
    required String id,
    String? name,
    String? username,
    String? email,
    String? profilePhotoPath,
    String? bio,
    double? averageRating,
    @Default(<String>[]) List<String> specialties,
    @Default(<String>[]) List<String> certifications,
    @Default(false) bool isVerified,
    @Default(false) bool isLinked,
    String? businessCurrency,
    @Default(<dynamic>[]) List<dynamic> locations,
    @Default(<dynamic>[]) List<dynamic> services,
    Map<String, dynamic>? stats,
  }) = _TrainerDetailDto;

  factory TrainerDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerDetailDtoFromJson(json);
}
