import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubit/voice_coach_cubit.dart';
import '../../cubit/voice_coach_state.dart';

/// Compact voice coach button (56px circle) designed to fit in the
/// workout session's floating control bar.
///
/// Mirrors the iOS [VoiceCoachCompactButton].
class VoiceCoachCompactButton extends StatefulWidget {
  const VoiceCoachCompactButton({super.key});

  @override
  State<VoiceCoachCompactButton> createState() =>
      _VoiceCoachCompactButtonState();
}

class _VoiceCoachCompactButtonState extends State<VoiceCoachCompactButton>
    with SingleTickerProviderStateMixin {
  final _cubit = getIt<VoiceCoachCubit>();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _handleTap() {
    final state = _cubit.state;
    if (state is VoiceCoachConnecting) return;

    if (state is VoiceCoachDisconnected || state is VoiceCoachError) {
      if (!_cubit.wasMicPermissionShown) {
        _showMicPermissionSheet();
      } else {
        _cubit.toggle();
      }
    } else {
      _cubit.toggle();
    }
  }

  void _showMicPermissionSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderActive,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Icon(Icons.mic_rounded, size: 48, color: AppColors.primary),
            const SizedBox(height: 16),
            const Text(
              'Microphone Access Needed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Voice Coach needs microphone access to hear you. '
              'Your voice is processed by ElevenLabs and never stored.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _cubit.requestMicrophonePermission().then((granted) {
                    if (granted) {
                      _cubit.toggle();
                    } else {
                      _showMicDeniedAlert();
                    }
                  });
                },
                child: const Text('Allow Microphone'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(
                'Not Now',
                style: TextStyle(color: AppColors.mutedText),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showMicDeniedAlert() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Microphone Required'),
        content: const Text(
          'Voice Coach needs microphone access to hear you. '
          'Please enable it in Settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _cubit.openSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceCoachCubit, VoiceCoachState>(
      builder: (context, state) {
        if (state is VoiceCoachConnected) {
          if (!_pulseController.isAnimating) {
            _pulseController.repeat(reverse: true);
          }
        } else {
          _pulseController.reset();
        }

        return AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, _) {
            final isPulsing = state is VoiceCoachConnected;

            return Transform.scale(
              scale: isPulsing ? _pulseAnimation.value : 1.0,
              child: GestureDetector(
                onTap: _handleTap,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: _circleColor(state),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _circleColor(state).withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: state is VoiceCoachConnecting
                      ? const Center(
                          child: SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Icon(
                          _iconForState(state),
                          color: Colors.white,
                          size: 24,
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  IconData _iconForState(VoiceCoachState state) {
    return switch (state) {
      VoiceCoachDisconnected() => Icons.mic,
      VoiceCoachConnecting() => Icons.wifi_find_rounded,
      VoiceCoachConnected() => Icons.graphic_eq,
      VoiceCoachError() => Icons.warning_amber_rounded,
    };
  }

  Color _circleColor(VoiceCoachState state) {
    return switch (state) {
      VoiceCoachDisconnected() => const Color(0xFF4F46E5), // indigo
      VoiceCoachConnecting() => AppColors.primary, // blue
      VoiceCoachConnected() => Colors.red,
      VoiceCoachError() => Colors.orange,
    };
  }
}
