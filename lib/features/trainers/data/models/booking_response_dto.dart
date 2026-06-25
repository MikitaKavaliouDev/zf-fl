import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_response_dto.freezed.dart';
part 'booking_response_dto.g.dart';

/// Full booking response from POST /api/bookings.
@freezed
abstract class BookingResponseDto with _$BookingResponseDto {
  const factory BookingResponseDto({
    required String id,
    required String trainerId,
    String? clientId,
    String? clientName,
    String? clientEmail,
    String? clientNotes,
    required String startTime,
    required String endTime,
    required String status,
    String? createdAt,
    String? updatedAt,
  }) = _BookingResponseDto;

  factory BookingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseDtoFromJson(json);
}
