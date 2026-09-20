import 'package:flutter/material.dart';

/// Semi-opaque panels that sit on top of the animated app background.
Color frostedSurface(BuildContext context, {double? alpha}) {
  final surface = Theme.of(context).colorScheme.surface;
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return surface.withValues(alpha: alpha ?? (isDark ? 0.78 : 0.9));
}
