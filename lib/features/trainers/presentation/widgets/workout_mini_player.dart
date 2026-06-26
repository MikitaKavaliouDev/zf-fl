import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/workout_session_cubit.dart';
import '../../cubit/workout_session_state.dart';

/// Floating mini player shown when the active workout session is minimized.
///
/// Mirrors iOS `WorkoutMiniPlayer` layout:
/// - Left: workout icon (48×48 circle)
/// - Center: session title + timer line
/// - Right: pause/play + expand (chevron up) buttons
/// - Tap / drag up to maximize
class WorkoutMiniPlayer extends StatefulWidget {
  const WorkoutMiniPlayer({super.key});

  @override
  State<WorkoutMiniPlayer> createState() => _WorkoutMiniPlayerState();
}

class _WorkoutMiniPlayerState extends State<WorkoutMiniPlayer> {
  double _dragOffset = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, state) {
        if (state is! WorkoutSessionActive) return const SizedBox.shrink();

        final elapsed = state.elapsed;
        final isPaused = state.isPaused;
        final isResting = state.restStartedAt != null;
        final cubit = context.read<WorkoutSessionCubit>();

        return GestureDetector(
          onTap: () => _maximize(context, cubit),
          onVerticalDragUpdate: (details) {
            // Dragging up (negative delta) moves the mini player up
            setState(() {
              _dragOffset += details.delta.dy;
            });
          },
          onVerticalDragEnd: (details) {
            // If dragged up significantly → maximize
            if (_dragOffset < -60) {
              _maximize(context, cubit);
            }
            setState(() => _dragOffset = 0);
          },
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: Offset(0, _dragOffset > 0 ? _dragOffset / 300 : 0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.card.withValues(alpha: 0.96),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.borderMuted),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // ── Left: Workout icon (48×48 circle) ──
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: isResting ? AppColors.primary : Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (isResting)
                          _MiniPlayerRestRing(
                            remaining: state.restRemaining ?? state.restElapsed.inSeconds,
                            total: state.restDuration ?? 120,
                          ),
                        const Icon(
                          Icons.fitness_center_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),

                  // ── Center: Title + Timer ──
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'My Session',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              _formatDuration(elapsed),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFeatures: [FontFeature.tabularFigures()],
                                color: AppColors.mutedText,
                              ),
                            ),
                            const SizedBox(width: 6),
                            if (isPaused)
                              const Icon(
                                Icons.pause_circle_filled_rounded,
                                size: 12,
                                color: Colors.orange,
                              )
                            else
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ── Right: Pause/Play + Expand buttons ──
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Pause / Play
                      _RoundIconButton(
                        icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                        onTap: () {
                          if (isPaused) {
                            cubit.resume();
                          } else {
                            cubit.pause();
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      // Expand (chevron up)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4D007AFF),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () => _maximize(context, cubit),
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _maximize(BuildContext context, WorkoutSessionCubit cubit) {
    cubit.maximize();
    context.push('/workout/session');
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Small circular icon button with subtle background.
class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.foreground.withValues(alpha: 0.05),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Icon(icon, size: 20, color: AppColors.foreground),
        ),
      ),
    );
  }
}

/// Circular progress ring shown during rest (matches iOS MiniPlayerRestRing).
class _MiniPlayerRestRing extends StatelessWidget {
  final int remaining;
  final int total;

  const _MiniPlayerRestRing({required this.remaining, required this.total});

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? remaining / total : 0.0;
    return SizedBox(
      width: 48,
      height: 48,
      child: CustomPaint(
        painter: _RingPainter(progress: progress.clamp(0.0, 1.0)),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;

  _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start at top
      2 * pi * progress, // Clockwise sweep
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
