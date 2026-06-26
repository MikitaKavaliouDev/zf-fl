import 'package:flutter/material.dart';

/// iOS-style consistency widget — large purple percentage + purple-blue
/// gradient capsule bar. Matches PersonalAnalyticsView.
class ConsistencyWidget extends StatelessWidget {
  final int consistency;

  const ConsistencyWidget({super.key, required this.consistency});

  static const Color _purple = Color(0xFF7B2FBE);

  @override
  Widget build(BuildContext context) {
    final percentage = (consistency / 100.0).clamp(0.0, 1.0);

    return Row(
      children: [
        // Progress Bar
        Expanded(
          child: SizedBox(
            height: 12,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    // Background track
                    Container(
                      width: constraints.maxWidth,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    // Foreground fill
                    FractionallySizedBox(
                      widthFactor: percentage,
                      child: Container(
                        height: 12,
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
        ),
        const SizedBox(width: 16),
        // Percentage text
        Text(
          '${(percentage * 100).toInt()}%',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: _purple,
          ),
        ),
      ],
    );
  }
}
      