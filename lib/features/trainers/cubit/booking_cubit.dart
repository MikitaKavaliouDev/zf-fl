import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/booking_repository.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _repository;

  BookingCubit(this._repository) : super(const BookingInitial());

  /// Create a new booking session with a trainer.
  Future<void> createBooking({
    required String trainerId,
    required DateTime startTime,
    required DateTime endTime,
    String? clientNotes,
  }) async {
    emit(const BookingSubmitting());
    try {
      final booking = await _repository.createBooking(
        trainerId: trainerId,
        startTime: startTime,
        endTime: endTime,
        clientNotes: clientNotes,
      );
      emit(BookingSuccess(booking));
    } catch (e) {
      final message = _mapError(e);
      emit(BookingError(message));
    }
  }

  /// Reset to initial state (e.g., after dismissing the sheet).
  void reset() {
    emit(const BookingInitial());
  }

  String _mapError(Object e) {
    final str = e.toString();
    if (str.contains('409') || str.contains('is already booked')) {
      return 'This time slot is already booked. Please choose another time.';
    }
    if (str.contains('outside trainer\'s available hours')) {
      return 'The selected time is outside the trainer\'s available hours.';
    }
    if (str.contains('401') || str.contains('Unauthorized')) {
      return 'Please sign in to book a session.';
    }
    return 'Failed to create booking. Please try again.';
  }
}
