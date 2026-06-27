import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:ziro_fit/core/di/injection.dart' show getIt;
import 'package:ziro_fit/core/theme/app_theme.dart';
import '../../cubit/booking_cubit.dart';
import '../../cubit/booking_state.dart';
import '../../data/booking_repository.dart';
import '../../data/models/trainer_schedule_dto.dart';

import 'schedule_animations.dart';
import 'schedule_day_cell.dart';
import 'schedule_slot_list.dart';

/// Interactive month-calendar schedule section with heat-color availability and
/// inline booking. Tapping a date reveals available time slots + a booking form.
///
/// Heat colors (kiwi.com style):
///   • 0 slots  → light gray
///   • 1-2 slots → light green
///   • 3-4 slots → medium green
///   • 5+ slots  → deep green
class ScheduleSection extends StatefulWidget {
  final String trainerId;
  final String trainerName;
  final TrainerScheduleDto? schedule;
  final bool isLoading;
  final VoidCallback? onLoadSchedule;
  final VoidCallback? onBookingSuccess;

  const ScheduleSection({
    super.key,
    required this.trainerId,
    required this.trainerName,
    this.schedule,
    this.isLoading = false,
    this.onLoadSchedule,
    this.onBookingSuccess,
  });

  @override
  State<ScheduleSection> createState() => _ScheduleSectionState();
}

class _ScheduleSectionState extends State<ScheduleSection>
    with SingleTickerProviderStateMixin {
  late DateTime _currentMonth;
  DateTime? _selectedDate;
  String? _selectedTimeSlot;
  int _durationMinutes = 60;
  final _notesController = TextEditingController();

  /// Direction of last month navigation: -1 = prev, +1 = next, 0 = initial
  int _monthNavDirection = 0;

  /// Animates time-slot staggered entries
  late final AnimationController _staggerCtrl;
  late final Animation<double> _staggerAnim;

  static const _dayHeaders = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];
  static const _dayNames = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _staggerAnim = CurvedAnimation(
      parent: _staggerCtrl,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // ── Helpers ──

  String _dayName(DateTime date) => _dayNames[date.weekday - 1];

  List<String> _availableSlots(DateTime date) {
    if (widget.schedule == null) return [];
    final day = _dayName(date);
    return widget.schedule!.availability[day] ?? [];
  }

  int _slotCount(DateTime date) => _availableSlots(date).length;

  bool _isPast(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .isBefore(DateTime(now.year, now.month, now.day));
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  DateTime _dateFromDay(int day) =>
      DateTime(_currentMonth.year, _currentMonth.month, day);

  void _previousMonth() {
    setState(() {
      _monthNavDirection = -1;
      _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      _selectedDate = null;
      _selectedTimeSlot = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _monthNavDirection = 1;
      _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      _selectedDate = null;
      _selectedTimeSlot = null;
    });
  }

  void _selectDate(DateTime date) {
    if (_isPast(date) && !_isToday(date)) return;
    final changed = _selectedDate != date;
    setState(() {
      _selectedDate = date;
      _selectedTimeSlot = null;
    });
    if (changed && _availableSlots(date).isNotEmpty) {
      _staggerCtrl.forward(from: 0);
    }
  }

  // ── Booking ──

  Future<void> _submitBooking() async {
    if (_selectedDate == null || _selectedTimeSlot == null) return;
    final timeParts = _selectedTimeSlot!.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = timeParts.length > 1 ? int.parse(timeParts[1]) : 0;
    final startTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      hour,
      minute,
    );
    final endTime = startTime.add(Duration(minutes: _durationMinutes));
    final cubit = context.read<BookingCubit>();
    await cubit.createBooking(
      trainerId: widget.trainerId,
      startTime: startTime,
      endTime: endTime,
      clientNotes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(getIt<BookingRepository>()),
      child: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            setState(() {
              _selectedTimeSlot = null;
              _notesController.clear();
            });
            widget.onBookingSuccess?.call();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Session booked successfully!'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is BookingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red.shade700,
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('Schedule'),
            if (widget.isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (widget.schedule != null)
              _buildContent()
            else
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: GestureDetector(
                  onTap: widget.onLoadSchedule,
                  child: const Row(
                    children: [
                      Icon(Icons.schedule_rounded,
                          size: 14, color: AppColors.primary),
                      SizedBox(width: 6),
                      Text(
                        'Tap to load schedule',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          // ── Month navigation ──
          _buildMonthNav(),

          // ── Legend ──
          _buildLegend(),
          const SizedBox(height: 8),

          // ── Animated calendar grid (slides on month change) ──
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              final offset = _monthNavDirection == 0
                  ? 0.0
                  : _monthNavDirection.toDouble();
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-offset * 0.3, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                )),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: _buildCalendarGrid(key: ValueKey(_currentMonth)),
          ),
          const SizedBox(height: 8),

          // ── Selected date info + time slots (animated expand) ──
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _selectedDate != null ? _buildTimeSlotsSection() : const SizedBox.shrink(),
          ),

          // ── Booking form (animated slide-up + fade) ──
          AnimatedSize(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _selectedDate != null && _selectedTimeSlot != null
                ? _buildBookingForm()
                : const SizedBox.shrink(),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ── Month Navigation ──

  Widget _buildMonthNav() {
    final monthLabel = DateFormat('MMMM yyyy').format(_currentMonth);
    final now = DateTime.now();
    final firstOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final canGoBack =
        firstOfMonth.isAfter(DateTime(now.year, now.month, 1));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Prev button with scale tap
          GestureDetector(
            onTap: canGoBack ? _previousMonth : null,
            child: TapScale(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: canGoBack
                      ? AppColors.mutedSurface
                      : AppColors.borderMuted,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 18,
                  color: canGoBack
                      ? AppColors.foreground
                      : AppColors.mutedText,
                ),
              ),
            ),
          ),
          const Spacer(),
          // Month label with cross-fade
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: child,
            ),
            child: Text(
              monthLabel,
              key: ValueKey(monthLabel),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
          ),
          const Spacer(),
          // Next button with scale tap
          GestureDetector(
            onTap: _nextMonth,
            child: TapScale(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: AppColors.foreground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Legend ──

  Widget _buildLegend() {
    return AnimatedOpacity(
      opacity: widget.schedule != null ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            _legendDot(const Color(0xFFF4F4F5), 'None'),
            const SizedBox(width: 12),
            _legendDot(const Color(0xFFBBF7D0), 'Few'),
            const SizedBox(width: 12),
            _legendDot(const Color(0xFF4ADE80), 'Good'),
            const SizedBox(width: 12),
            _legendDot(const Color(0xFF16A34A), 'Plenty'),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
        ),
      ],
    );
  }

  // ── Calendar Grid ──

  Widget _buildCalendarGrid({Key? key}) {
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstWeekday =
        DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;

    return Column(
      key: key,
      children: [
        // Day headers
        Row(
          children: _dayHeaders.map((d) {
            return Expanded(
              child: Center(
                child: Text(
                  d,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 4),
        ..._buildWeeks(daysInMonth, firstWeekday),
      ],
    );
  }

  List<Widget> _buildWeeks(int daysInMonth, int firstWeekday) {
    final cells = <Widget>[];
    for (int i = 1; i < firstWeekday; i++) {
      cells.add(const Spacer());
    }
    for (int day = 1; day <= daysInMonth; day++) {
      cells.add(DayCell(
        day: day,
        date: _dateFromDay(day),
        slotCount: _slotCount(_dateFromDay(day)),
        isPast: _isPast(_dateFromDay(day)),
        isToday: _isToday(_dateFromDay(day)),
        isSelected: _selectedDate != null &&
            _selectedDate!.day == day &&
            _selectedDate!.month == _currentMonth.month &&
            _selectedDate!.year == _currentMonth.year,
        onTap: () => _selectDate(_dateFromDay(day)),
      ));
    }

    final rows = <Widget>[];
    int idx = 0;
    while (idx < cells.length) {
      final rowCells = <Widget>[];
      for (int col = 0; col < 7 && idx < cells.length; col++) {
        rowCells.add(Expanded(child: cells[idx]));
        idx++;
      }
      while (rowCells.length < 7) {
        rowCells.add(const Expanded(child: SizedBox.shrink()));
      }
      if (rows.isNotEmpty) rows.add(const SizedBox(height: 2));
      rows.add(Row(children: rowCells));
    }
    return rows;
  }

  // ── Time Slots (staggered fade-in + slide-up) ──

  Widget _buildTimeSlotsSection() {
    final slots = _availableSlots(_selectedDate!);
    final dateStr = DateFormat('EEE, MMM d').format(_selectedDate!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        // Date header with fade slide
        FadeTransition(
          opacity: _staggerAnim,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.15),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _staggerCtrl,
              curve: const Interval(0.0, 0.3, curve: Curves.easeOutCubic),
            )),
            child: Row(
              children: [
                Text(
                  dateStr,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const Spacer(),
                Text(
                  '${slots.length} available',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (slots.isEmpty)
          FadeTransition(
            opacity: _staggerAnim,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'No availability on this day',
                  style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                ),
              ),
            ),
          )
        else
          StaggeredSlotList(
            slots: slots,
            selectedSlot: _selectedTimeSlot,
            animation: _staggerAnim,
            onTap: (slot) => setState(() => _selectedTimeSlot = slot),
          ),
      ],
    );
  }

  // ── Booking Form (elastic slide-up) ──

  Widget _buildBookingForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _staggerCtrl,
          curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
        )),
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: _staggerCtrl,
            curve: const Interval(0.3, 0.7, curve: Curves.easeIn),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Duration picker
                const Text(
                  'Duration',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [30, 60, 90].map((min) {
                    final isSelected = _durationMinutes == min;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TapScale(
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _durationMinutes = min),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOutCubic,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.borderMuted,
                              ),
                            ),
                            child: Text(
                              '$min min',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.foreground,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),

                // Notes
                const Text(
                  'Notes (optional)',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderMuted),
                  ),
                  child: TextField(
                    controller: _notesController,
                    maxLines: 2,
                    maxLength: 500,
                    decoration: const InputDecoration(
                      hintText: 'Anything specific you want to work on...',
                      hintStyle:
                          TextStyle(fontSize: 12, color: AppColors.mutedText),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                      counterStyle:
                          TextStyle(fontSize: 10, color: AppColors.mutedText),
                    ),
                    style:
                        const TextStyle(fontSize: 13, color: AppColors.foreground),
                  ),
                ),
                const SizedBox(height: 14),

                // Book button
                BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                    final isSubmitting = state is BookingSubmitting;
                    return TapScale(
                      child: SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          decoration: BoxDecoration(
                            color: isSubmitting
                                ? AppColors.primary.withAlpha(80)
                                : AppColors.primary,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: isSubmitting ? null : _submitBooking,
                              borderRadius: BorderRadius.circular(99),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration:
                                      const Duration(milliseconds: 200),
                                  transitionBuilder: (child, anim) =>
                                      FadeTransition(
                                    opacity: anim,
                                    child: ScaleTransition(
                                      scale: anim,
                                      child: child,
                                    ),
                                  ),
                                  child: isSubmitting
                                      ? const SizedBox(
                                          key: ValueKey('spinner'),
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          'Book Session',
                                          key: ValueKey('text'),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Shared Widgets ──

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            height: 1,
            width: 20,
            child: Divider(),
          ),
          const SizedBox(width: 0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
      ),
      const Spacer(),
    ],
      ),
    );
  }
}
