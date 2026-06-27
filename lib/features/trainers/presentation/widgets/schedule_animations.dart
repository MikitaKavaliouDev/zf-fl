import 'package:flutter/material.dart';

// ────────────────────────────────────────────
// Press-scale feedback for tappable widgets
// ────────────────────────────────────────────

class TapScale extends StatefulWidget {
  final Widget child;

  const TapScale({required this.child});

  @override
  State<TapScale> createState() => _TapScaleState();
}

class _TapScaleState extends State<TapScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _ctrl.forward(),
      onPointerUp: (_) {
        _ctrl.reverse();
        // Spring-back feel: release → slight overshoot then settle
        Future.delayed(const Duration(milliseconds: 80), () {
          if (mounted) _ctrl.reverse();
        });
      },
      onPointerCancel: (_) => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnim.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

// ────────────────────────────────────────────
// Spring scale-up for selected state
// ────────────────────────────────────────────

class SelectionSpring extends StatefulWidget {
  final bool isSelected;
  final Widget child;

  const SelectionSpring({
    required this.isSelected,
    required this.child,
  });

  @override
  State<SelectionSpring> createState() => _SelectionSpringState();
}

class _SelectionSpringState extends State<SelectionSpring>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _anim = CurvedAnimation(
      parent: _ctrl,
      curve: Curves.elasticOut,
    );
  }

  @override
  void didUpdateWidget(SelectionSpring old) {
    super.didUpdateWidget(old);
    if (widget.isSelected && !old.isSelected) {
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        final scale = 1.0 + (_anim.value * 0.08);
        return Transform.scale(scale: scale, child: child);
      },
      child: widget.child,
    );
  }
}
