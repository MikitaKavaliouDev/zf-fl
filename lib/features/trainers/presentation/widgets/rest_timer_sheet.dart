import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/app_theme.dart';

/// Full-screen modal bottom sheet for rest timer control.
///
/// Two modes: selection (preset grid + custom picker) and active
/// (circular countdown + adjustment buttons + skip).
///
/// Usage:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (_) => RestTimerSheet(
///     isRunning: isResting,
///     remainingSeconds: remainingSec,
///     totalSeconds: totalSec,
///     onStartTimer: (duration) => cubit.startRest(duration: duration),
///     onAdjust: (delta) => cubit.adjustRest(delta),
///     onSkip: () => cubit.endRest(),
///     onDismiss: () => Navigator.of(context).pop(),
///   ),
/// );
/// ```
class RestTimerSheet extends StatefulWidget {
  /// Whether the rest timer is currently running.
  final bool isRunning;

  /// Seconds remaining in the current countdown.
  final int remainingSeconds;

  /// Total seconds for the current countdown.
  final int totalSeconds;

  /// Called when user taps a preset or the Start Timer button.
  final void Function(int durationSeconds) onStartTimer;

  /// Called when user taps -10s or +10s during active timer.
  final void Function(int deltaSeconds) onAdjust;

  /// Called when user taps Skip Rest.
  final VoidCallback onSkip;

  /// Called when user taps the X close button.
  final VoidCallback onDismiss;

  const RestTimerSheet({
    super.key,
    required this.isRunning,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.onStartTimer,
    required this.onAdjust,
    required this.onSkip,
    required this.onDismiss,
  });

  @override
  State<RestTimerSheet> createState() => _RestTimerSheetState();
}

class _RestTimerSheetState extends State<RestTimerSheet> {
  int _selectedMinutes = 2;
  int _selectedSeconds = 0;
  List<int> _savedTimers = [];

  late final FixedExtentScrollController _minuteController;
  late final FixedExtentScrollController _secondController;

  @override
  void initState() {
    super.initState();
    _minuteController = FixedExtentScrollController(initialItem: 2);
    _secondController = FixedExtentScrollController();
    _loadSavedTimers();
  }

  @override
  void dispose() {
    _minuteController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  // ── Presets ──────────────────────────────────────────────────────────

  static const _presets = <_Preset>[
    _Preset(label: '0:30', seconds: 30),
    _Preset(label: '1:00', seconds: 60),
    _Preset(label: '1:30', seconds: 90),
    _Preset(label: '2:00', seconds: 120),
    _Preset(label: '3:00', seconds: 180),
    _Preset(label: '5:00', seconds: 300),
  ];

  // ── Saved Timer Persistence ──────────────────────────────────────────

  Future<void> _loadSavedTimers() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('custom_rest_timers');
    if (raw != null && mounted) {
      final list = (jsonDecode(raw) as List).cast<int>();
      setState(() => _savedTimers = list);
    }
  }

  Future<void> _saveTimer(int seconds) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('custom_rest_timers');
    List<int> timers = [];
    if (raw != null) {
      timers = (jsonDecode(raw) as List).cast<int>();
    }
    timers.remove(seconds);
    timers.insert(0, seconds);
    if (timers.length > 10) {
      timers = timers.sublist(0, 10);
    }
    await prefs.setString('custom_rest_timers', jsonEncode(timers));
    if (mounted) {
      setState(() => _savedTimers = timers);
    }
  }

  // ── Build ────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPad),
        child: Column(
          children: [
            // ── Header ───────────────────────────────────────────────
            _buildHeader(),

            // ── Body ─────────────────────────────────────────────────
            Expanded(
              child: widget.isRunning ? _buildActiveBody() : _buildSelectionBody(),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: SizedBox(
        height: 32,
        child: Row(
          children: [
            // Close button
            GestureDetector(
              onTap: widget.onDismiss,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.mutedSurface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: AppColors.mutedText,
                ),
              ),
            ),
            const Spacer(),
            // Title
            const Text(
              'Rest Timer',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const Spacer(),
            // Spacer (balanced width)
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  // ── Selection Body ───────────────────────────────────────────────────

  Widget _buildSelectionBody() {
    return Column(
      children: [
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Quick Presets
                _buildPresetsSection(),

                const SizedBox(height: 24),

                // Saved Presets
                _buildSavedPresets(),

                if (_savedTimers.isNotEmpty) const SizedBox(height: 24),

                // Custom Duration
                _buildCustomDurationSection(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),

        // Start Timer button (fixed at bottom)
        _buildStartTimerButton(),
      ],
    );
  }

  Widget _buildPresetsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'QUICK SELECT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.mutedText,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _presets.map((p) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 40 - 24) / 3,
                child: _PresetButton(
                  label: p.label,
                  onTap: () {
                    _saveTimer(p.seconds);
                    widget.onStartTimer(p.seconds);
                    widget.onDismiss();
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSavedPresets() {
    if (_savedTimers.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'SAVED',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.mutedText,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _savedTimers.map((seconds) {
              final label = seconds >= 60
                  ? '${seconds ~/ 60}:${(seconds.remainder(60)).toString().padLeft(2, '0')}'
                  : '0:${seconds.toString().padLeft(2, '0')}';
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 40 - 24) / 3,
                child: _PresetButton(
                  label: label,
                  onTap: () {
                    _saveTimer(seconds);
                    widget.onStartTimer(seconds);
                    widget.onDismiss();
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomDurationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'CUSTOM DURATION',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.mutedText,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // Column headers
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Minutes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Seconds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Wheel pickers
                SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListWheelScrollView(
                          controller: _minuteController,
                          itemExtent: 32,
                          diameterRatio: 1.2,
                          onSelectedItemChanged: (i) {
                            setState(() => _selectedMinutes = i);
                          },
                          children: List.generate(16, (i) {
                            return Center(
                              child: Text(
                                '$i',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: ListWheelScrollView(
                          controller: _secondController,
                          itemExtent: 32,
                          diameterRatio: 1.2,
                          onSelectedItemChanged: (i) {
                            setState(() => _selectedSeconds = i * 5);
                          },
                          children: List.generate(12, (i) {
                            final val = (i * 5).toString().padLeft(2, '0');
                            return Center(
                              child: Text(
                                val,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStartTimerButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.card,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            final total = (_selectedMinutes * 60) + _selectedSeconds;
            if (total > 0) {
              _saveTimer(total);
              widget.onStartTimer(total);
              widget.onDismiss();
            }
          },
          icon: const Icon(Icons.play_arrow_rounded, size: 20),
          label: const Text('Start Timer'),
        ),
      ),
    );
  }

  // ── Active Body ──────────────────────────────────────────────────────

  Widget _buildActiveBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // Circular progress indicator
          _CircularRestTimer(
            remainingSeconds: widget.remainingSeconds,
            totalSeconds: widget.totalSeconds,
          ),

          const SizedBox(height: 40),

          // Adjustment buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AdjustmentButton(
                label: '-10s',
                onTap: () => widget.onAdjust(-10),
              ),
              const SizedBox(width: 20),
              _AdjustmentButton(
                label: '+10s',
                onTap: () => widget.onAdjust(10),
              ),
            ],
          ),

          const Spacer(),

          // Skip Rest button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                widget.onSkip();
                widget.onDismiss();
              },
              icon: const Icon(Icons.skip_next_rounded, size: 20),
              label: const Text('Skip Rest'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Preset model
// ─────────────────────────────────────────────────────────────────────────────

class _Preset {
  final String label;
  final int seconds;
  const _Preset({required this.label, required this.seconds});
}

// ─────────────────────────────────────────────────────────────────────────────
// Preset button (quick select pill)
// ─────────────────────────────────────────────────────────────────────────────

class _PresetButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PresetButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Adjustment button (-10s / +10s capsule)
// ─────────────────────────────────────────────────────────────────────────────

class _AdjustmentButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _AdjustmentButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.mutedText,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Circular rest timer (CustomPainter ring + centered time display)
// ─────────────────────────────────────────────────────────────────────────────

class _CircularRestTimer extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;

  const _CircularRestTimer({
    required this.remainingSeconds,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final progress =
        totalSeconds > 0 ? remainingSeconds / totalSeconds : 0.0;

    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ring
          CustomPaint(
            size: const Size(240, 240),
            painter: _RingPainter(
              progress: 1.0,
              color: AppColors.mutedText.withValues(alpha: 0.1),
              strokeWidth: 20,
            ),
          ),
          // Progress ring
          CustomPaint(
            size: const Size(240, 240),
            painter: _RingPainter(
              progress: progress,
              color: Colors.orange,
              strokeWidth: 20,
            ),
          ),
          // Center content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formatTime(remainingSeconds),
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  fontFeatures: [FontFeature.tabularFigures()],
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Resting',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds.remainder(60);
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Ring painter — draws an arc from top (-π/2) clockwise
// ─────────────────────────────────────────────────────────────────────────────

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  const _RingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // start at top
      2 * math.pi * progress, // sweep clockwise
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
