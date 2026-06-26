import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Bottom control bar for the active workout session.
///
/// Shows Pause/Resume and Finish buttons. Fades out when
/// the custom numeric keyboard is active.
class WorkoutBottomControls extends StatelessWidget {
  const WorkoutBottomControls({
    super.key,
    required this.isPaused,
    required this.showKeyboard,
    required this.onPauseResume,
    required this.onFinish,
  });

  final bool isPaused;
  final bool showKeyboard;
  final VoidCallback onPauseResume;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showKeyboard ? 0 : 1,
      duration: const Duration(milliseconds: 200),
      child: showKeyboard
          ? const SizedBox.shrink()
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.card,
                border: Border(top: BorderSide(color: AppColors.borderMuted)),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onPauseResume,
                        icon: Icon(
                          isPaused
                              ? Icons.play_arrow_rounded
                              : Icons.pause_rounded,
                        ),
                        label: Text(isPaused ? 'Resume' : 'Pause'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onFinish,
                        icon: const Icon(Icons.stop_rounded),
                        label: const Text('Finish'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
