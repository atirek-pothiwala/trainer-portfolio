import 'package:flutter/material.dart';

/// Semantic colors shared across light and dark themes.
/// Read via [Theme.of(context).extension<AppThemeTokens>()] or [ThemeTokensX.tokens].
@immutable
class AppThemeTokens extends ThemeExtension<AppThemeTokens> {
  const AppThemeTokens({
    required this.surfaceElevated,
    required this.textSecondary,
    required this.border,
    required this.accent,
    required this.accentMuted,
    required this.heroGradientStart,
    required this.heroGradientEnd,
    required this.instagram,
    required this.youtube,
  });

  final Color surfaceElevated;
  final Color textSecondary;
  final Color border;
  final Color accent;
  final Color accentMuted;
  final Color heroGradientStart;
  final Color heroGradientEnd;
  final Color instagram;
  final Color youtube;

  static const light = AppThemeTokens(
    surfaceElevated: Color(0xFFEEF1F5),
    textSecondary: Color(0xFF5C6570),
    border: Color(0xFFE2E6EB),
    accent: Color(0xFF7C3AED),
    accentMuted: Color(0xFF6D28D9),
    heroGradientStart: Color(0xFFF5F0FC),
    heroGradientEnd: Color(0xFFEDE4FA),
    instagram: Color(0xFFE1306C),
    youtube: Color(0xFFFF0000),
  );

  static const dark = AppThemeTokens(
    surfaceElevated: Color(0xFF1E242C),
    textSecondary: Color(0xFF9AA3AD),
    border: Color(0xFF2A3139),
    accent: Color(0xFFA78BFA),
    accentMuted: Color(0xFF8B5CF6),
    heroGradientStart: Color(0xFF1E1A28),
    heroGradientEnd: Color(0xFF14121C),
    instagram: Color(0xFFE1306C),
    youtube: Color(0xFFFF0000),
  );

  @override
  AppThemeTokens copyWith({
    Color? surfaceElevated,
    Color? textSecondary,
    Color? border,
    Color? accent,
    Color? accentMuted,
    Color? heroGradientStart,
    Color? heroGradientEnd,
    Color? instagram,
    Color? youtube,
  }) {
    return AppThemeTokens(
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      accentMuted: accentMuted ?? this.accentMuted,
      heroGradientStart: heroGradientStart ?? this.heroGradientStart,
      heroGradientEnd: heroGradientEnd ?? this.heroGradientEnd,
      instagram: instagram ?? this.instagram,
      youtube: youtube ?? this.youtube,
    );
  }

  @override
  AppThemeTokens lerp(ThemeExtension<AppThemeTokens>? other, double t) {
    if (other is! AppThemeTokens) return this;
    return AppThemeTokens(
      surfaceElevated:
          Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentMuted: Color.lerp(accentMuted, other.accentMuted, t)!,
      heroGradientStart:
          Color.lerp(heroGradientStart, other.heroGradientStart, t)!,
      heroGradientEnd: Color.lerp(heroGradientEnd, other.heroGradientEnd, t)!,
      instagram: Color.lerp(instagram, other.instagram, t)!,
      youtube: Color.lerp(youtube, other.youtube, t)!,
    );
  }
}

extension ThemeTokensX on BuildContext {
  AppThemeTokens get tokens =>
      Theme.of(this).extension<AppThemeTokens>() ?? AppThemeTokens.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
