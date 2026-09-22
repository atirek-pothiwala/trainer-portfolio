import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_tokens.dart';

ThemeData buildLightTheme() => _buildTheme(
      brightness: Brightness.light,
      tokens: AppThemeTokens.light,
      background: const Color(0xFFF5F7FA),
      surface: Colors.white,
      onSurface: const Color(0xFF1A1D21),
      onPrimary: Colors.white,
    );

ThemeData buildDarkTheme() => _buildTheme(
      brightness: Brightness.dark,
      tokens: AppThemeTokens.dark,
      background: const Color(0xFF0D0F12),
      surface: const Color(0xFF161A20),
      onSurface: const Color(0xFFF4F6F8),
      onPrimary: const Color(0xFF0D0F12),
    );

ThemeData _buildTheme({
  required Brightness brightness,
  required AppThemeTokens tokens,
  required Color background,
  required Color surface,
  required Color onSurface,
  required Color onPrimary,
}) {
  final isDark = brightness == Brightness.dark;
  final base = ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: tokens.accent,
      onPrimary: onPrimary,
      secondary: tokens.accentMuted,
      onSecondary: onPrimary,
      error: const Color(0xFFE5484D),
      onError: Colors.white,
      surface: surface,
      onSurface: onSurface,
    ),
    extensions: [tokens],
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: onSurface,
      displayColor: onSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      foregroundColor: onSurface,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: isDark ? 0 : 1,
      shadowColor: isDark ? null : Colors.black.withValues(alpha: 0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: tokens.surfaceElevated,
      labelStyle: TextStyle(color: onSurface),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dividerTheme: DividerThemeData(color: tokens.border),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: surface,
      indicatorColor: tokens.accent.withValues(alpha: 0.2),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 12,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          color: selected ? tokens.accent : tokens.textSecondary,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? tokens.accent : tokens.textSecondary,
        );
      }),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: tokens.accent,
        foregroundColor: onPrimary,
      ),
    ),
  );
}
