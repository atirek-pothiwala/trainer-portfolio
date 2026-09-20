import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_preferences_repository.dart';

/// Controls [MaterialApp.themeMode]. Extend with settings UI + persistence later.
class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit({required ThemePreferencesRepository preferences})
      : _preferences = preferences,
        super(ThemeMode.system);

  final ThemePreferencesRepository _preferences;

  /// Call once at startup to restore a saved preference.
  Future<void> loadSavedThemeMode() async {
    final saved = await _preferences.loadThemeMode();
    if (saved != null) {
      emit(saved);
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) return;
    emit(mode);
    await _preferences.saveThemeMode(mode);
  }

  Future<void> useSystemTheme() => setThemeMode(ThemeMode.system);

  Future<void> useLightTheme() => setThemeMode(ThemeMode.light);

  Future<void> useDarkTheme() => setThemeMode(ThemeMode.dark);
}
