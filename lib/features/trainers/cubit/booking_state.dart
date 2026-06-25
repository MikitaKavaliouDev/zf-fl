import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/booking_response_dto.dart';

part 'booking_state.freezed.dart';

/// Sealed state for the booking flow (book a session with a trainer).
@freezed
sealed class BookingState with _$BookingState {
  /// Initial idle state.
  const factory BookingState.initial() = BookingInitial;

  /// Submitting the booking request.
  const factory BookingState.submitting() = BookingSubmitting;

  /// Booking successfully created.
  const factory BookingState.success(BookingResponseDto booking) =
      BookingSuccess;

  /// Booking failed with an error message.
  const factory BookingState.error(String message) = BookingError;
}
