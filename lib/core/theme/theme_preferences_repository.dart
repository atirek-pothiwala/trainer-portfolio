import 'package:flutter/material.dart';

/// Persistence for user theme choice. Implement with shared_preferences or
/// secure storage when settings UI is added.
abstract class ThemePreferencesRepository {
  Future<ThemeMode?> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode mode);
}

/// Default until local persistence is wired; always returns null (use system).
class NoOpThemePreferencesRepository implements ThemePreferencesRepository {
  const NoOpThemePreferencesRepository();

  @override
  Future<ThemeMode?> loadThemeMode() async => null;

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {}
}
