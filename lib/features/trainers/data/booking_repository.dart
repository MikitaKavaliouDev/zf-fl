import 'package:injectable/injectable.dart';

import 'booking_api_service.dart';
import 'models/booking_response_dto.dart';

@singleton
class BookingRepository {
  final BookingApiService _api;

  BookingRepository(this._api);

  /// Creates a booking request for a session with a trainer.
  Future<BookingResponseDto> createBooking({
    required String trainerId,
    required DateTime startTime,
    required DateTime endTime,
    String? clientNotes,
  }) {
    return _api.createBooking(
      trainerId: trainerId,
      startTime: startTime,
      endTime: endTime,
      clientNotes: clientNotes,
    );
  }
}
