import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_request_dto.freezed.dart';
part 'create_event_request_dto.g.dart';

@freezed
abstract class CreateEventRequestDto with _$CreateEventRequestDto {
  const factory CreateEventRequestDto({
    required String title,
    String? startTime,
    String? endTime,
    @Default(0) double price,
    @Default(1) int capacity,
    @Default('') String locationName,
    @Default('') String address,
    String? city,
    String? description,
    double? latitude,
    double? longitude,
    String? imageUrl,
    String? category,
  }) = _CreateEventRequestDto;

  factory CreateEventRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateEventRequestDtoFromJson(json);
}
