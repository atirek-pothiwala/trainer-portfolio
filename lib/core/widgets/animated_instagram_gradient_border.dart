import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Stories-style rotating Instagram gradient frame around [child].
class AnimatedInstagramGradientBorder extends StatefulWidget {
  const AnimatedInstagramGradientBorder({
    super.key,
    required this.child,
    this.borderWidth = 2.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.duration = const Duration(seconds: 5),
  });

  final Widget child;
  final double borderWidth;
  final BorderRadius borderRadius;
  final Duration duration;

  static const _gradientColors = [
    Color(0xFFE1306C),
    Color(0xFFFD1D1D),
    Color(0xFFF77737),
    Color(0xFFFCAF45),
    Color(0xFFE1306C),
  ];

  @override
  State<AnimatedInstagramGradientBorder> createState() =>
      _AnimatedInstagramGradientBorderState();
}

class _AnimatedInstagramGradientBorderState
    extends State<AnimatedInstagramGradientBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    colors: AnimatedInstagramGradientBorder._gradientColors,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(widget.borderWidth),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
