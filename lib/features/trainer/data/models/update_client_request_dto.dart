import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_client_request_dto.freezed.dart';
part 'update_client_request_dto.g.dart';

@freezed
abstract class UpdateClientRequestDto with _$UpdateClientRequestDto {
  const factory UpdateClientRequestDto({
    String? name,
    String? email,
    String? phone,
    String? status,
    int? checkInDay,
    int? checkInHour,
  }) = _UpdateClientRequestDto;

  factory UpdateClientRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateClientRequestDtoFromJson(json);
}
