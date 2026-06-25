import 'package:flutter/material.dart';

/// iOS-style consistency widget — large purple percentage + purple-blue
/// gradient capsule bar. Matches PersonalAnalyticsView.
class ConsistencyWidget extends StatelessWidget {
  final int consistency;

  const ConsistencyWidget({super.key, required this.consistency});

  static const Color _purple = Color(0xFF7B2FBE);

  @override
  Widget build(BuildContext context) {
    final percentage = consistency / 100.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Percentage text, right-aligned
        Row(
          children: [
            const Spacer(),
            Text(
              '${(percentage * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: _purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Purple-blue gradient capsule bar
        SizedBox(
          height: 8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // Background track
                  Container(
                    width: constraints.maxWidth,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _purple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  // Foreground fill
                  FractionallySizedBox(
                    widthFactor: percentage.clamp(0.0, 1.0),
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [_purple, Colors.blue],
                        ),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
