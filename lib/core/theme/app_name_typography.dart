import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_tokens.dart';

/// Display typography for the HemiLift wordmark (distinct from body Inter).
TextStyle appNameTextStyle(
  BuildContext context, {
  double fontSize = 28,
  Color? color,
}) {
  final onSurface = color ?? Theme.of(context).colorScheme.onSurface;
  final tokens = context.tokens;

  return GoogleFonts.bebasNeue(
    fontSize: fontSize,
    letterSpacing: 1.4,
    height: 1,
    color: onSurface,
  ).copyWith(
    shadows: [
      Shadow(
        color: tokens.accent.withValues(alpha: 0.35),
        blurRadius: 12,
      ),
    ],
  );
}
