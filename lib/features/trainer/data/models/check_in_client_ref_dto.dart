import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_client_ref_dto.freezed.dart';
part 'check_in_client_ref_dto.g.dart';

@freezed
abstract class CheckInClientRefDto with _$CheckInClientRefDto {
  const factory CheckInClientRefDto({
    required String id,
    required String name,
    String? avatarPath,
  }) = _CheckInClientRefDto;

  factory CheckInClientRefDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInClientRefDtoFromJson(json);
}
