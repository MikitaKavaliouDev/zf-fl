import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_detail_dto.freezed.dart';
part 'event_detail_dto.g.dart';

/// Matches the Prisma Event fields returned by the backend.
/// Backend sends Prisma column names (startTime, locationName, latitude, etc.)
/// NOT the Zod schema names (date, location, lat, lon, etc.).
@freezed
abstract class EventDetailDto with _$EventDetailDto {
  const factory EventDetailDto({
    required String id,
    required String title,
    String? description,
    @JsonKey(name: 'startTime') required DateTime date,
    @JsonKey(name: 'locationName') String? location,
    @JsonKey(name: 'category') String? category,
    @Default(0) double price,
    @JsonKey(name: 'latitude') double? lat,
    @JsonKey(name: 'longitude') double? lon,
    @JsonKey(name: 'trainer') CreatedBy? createdBy,
    @JsonKey(name: 'enrolledCount') @Default(0) int bookingCount,
    @JsonKey(name: 'capacity') int? maxAttendees,
  }) = _EventDetailDto;

  const EventDetailDto._(); // for custom getters

  factory EventDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EventDetailDtoFromJson(json);

  /// isFree is NOT sent by the backend — derive from price.
  bool get isFree => price == 0;
}

/// Matches the `trainer` relation from getEventById (includes name, username, profile).
/// NOT the Zod schema's `createdBy` which was a different shape.
@freezed
abstract class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    @Default('') String id,
    String? name,
    String? username,
    String? profilePhotoPath,
    String? aboutMe,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}
