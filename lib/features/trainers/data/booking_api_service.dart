import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/booking_response_dto.dart';

@injectable
class BookingApiService {
  final Dio _dio;

  BookingApiService(this._dio);

  /// Create a new booking request (client books a session with a trainer).
  Future<BookingResponseDto> createBooking({
    required String trainerId,
    required DateTime startTime,
    required DateTime endTime,
    String? clientNotes,
  }) async {
    final response = await _dio.post(
      '/api/bookings',
      data: {
        'trainerId': trainerId,
        'startTime': startTime.toUtc().toIso8601String(),
        'endTime': endTime.toUtc().toIso8601String(),
        if (clientNotes != null && clientNotes.isNotEmpty)
          'clientNotes': clientNotes,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final booking = data['booking'] as Map<String, dynamic>;
    return BookingResponseDto.fromJson(booking);
  }
}
