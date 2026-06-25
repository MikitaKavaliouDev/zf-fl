import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

/// A reusable onboarding slide matching iOS OnboardingSlide exactly.
///
/// Layout:
/// - Spacer top
/// - 160px circle with colored 10% opacity fill containing a 70pt icon
/// - Title (28pt bold, centered, 10px spacing below icon)
/// - Description (body, secondary color, multi-line, centered, 40px horizontal padding)
/// - Spacer bottom
/// - Gentle pulsing scale animation on the icon (1.0 ↔ 1.1, easeInOut, 2s, repeat forever)
class OnboardingSlide extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  State<OnboardingSlide> createState() => _OnboardingSlideState();
}

class _OnboardingSlideState extends State<OnboardingSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        // Animated icon in colored circle
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withValues(alpha: 0.1),
            ),
            child: Icon(
              widget.icon,
              size: 70,
              color: widget.color,
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Title
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            widget.description,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.mutedText,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}