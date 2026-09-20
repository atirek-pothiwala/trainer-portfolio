import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Classic Instagram-style drifting color blobs, tuned for black + violet.
class AnimatedInstagramMeshBackground extends StatefulWidget {
  const AnimatedInstagramMeshBackground({
    super.key,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.duration = const Duration(seconds: 10),
  });

  final Widget child;
  final BorderRadius borderRadius;
  final Duration duration;

  @override
  State<AnimatedInstagramMeshBackground> createState() =>
      _AnimatedInstagramMeshBackgroundState();
}

class _AnimatedInstagramMeshBackgroundState
    extends State<AnimatedInstagramMeshBackground>
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return CustomPaint(
                  painter: _MeshPainter(
                    progress: _controller.value,
                    isDark: isDark,
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.35)
                    : Colors.black.withValues(alpha: 0.08),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({required this.progress, required this.isDark});

  final double progress;
  final bool isDark;

  static const _base = Color(0xFF050508);
  static const _violetDeep = Color(0xFF4C1D95);
  static const _violetMid = Color(0xFF7C3AED);
  static const _violetSoft = Color(0xFFA78BFA);
  static const _violetInk = Color(0xFF2E1065);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = _base);

    final t = progress * 2 * math.pi;
    final blobs = [
      _Blob(
        color: _violetMid,
        opacity: isDark ? 0.55 : 0.42,
        radius: size.shortestSide * 0.55,
        center: Offset(
          size.width * (0.2 + 0.12 * math.sin(t)),
          size.height * (0.25 + 0.1 * math.cos(t * 0.9)),
        ),
      ),
      _Blob(
        color: _violetDeep,
        opacity: isDark ? 0.65 : 0.5,
        radius: size.shortestSide * 0.5,
        center: Offset(
          size.width * (0.85 + 0.08 * math.cos(t * 1.1)),
          size.height * (0.2 + 0.12 * math.sin(t * 0.8)),
        ),
      ),
      _Blob(
        color: _violetSoft,
        opacity: isDark ? 0.35 : 0.28,
        radius: size.shortestSide * 0.45,
        center: Offset(
          size.width * (0.55 + 0.15 * math.sin(t * 1.3 + 1)),
          size.height * (0.75 + 0.1 * math.cos(t * 1.05)),
        ),
      ),
      _Blob(
        color: _violetInk,
        opacity: isDark ? 0.7 : 0.55,
        radius: size.shortestSide * 0.6,
        center: Offset(
          size.width * (0.35 + 0.1 * math.cos(t * 0.7 + 2)),
          size.height * (0.55 + 0.14 * math.sin(t * 1.15)),
        ),
      ),
    ];

    for (final blob in blobs) {
      _drawBlob(canvas, blob);
    }
  }

  void _drawBlob(Canvas canvas, _Blob blob) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          blob.color.withValues(alpha: blob.opacity),
          blob.color.withValues(alpha: 0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: blob.center, radius: blob.radius))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 42);

    canvas.drawCircle(blob.center, blob.radius, paint);
  }

  @override
  bool shouldRepaint(covariant _MeshPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isDark != isDark;
  }
}

class _Blob {
  const _Blob({
    required this.color,
    required this.opacity,
    required this.radius,
    required this.center,
  });

  final Color color;
  final double opacity;
  final double radius;
  final Offset center;
}
