import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trainer_portfolio/core/theme/theme_mode_cubit.dart';
import 'package:trainer_portfolio/core/theme/theme_preferences_repository.dart';

void main() {
  group('ThemeModeCubit', () {
    blocTest<ThemeModeCubit, ThemeMode>(
      'starts with system theme',
      build: () => ThemeModeCubit(
        preferences: const NoOpThemePreferencesRepository(),
      ),
      expect: () => [],
      verify: (cubit) => expect(cubit.state, ThemeMode.system),
    );

    blocTest<ThemeModeCubit, ThemeMode>(
      'setThemeMode updates state',
      build: () => ThemeModeCubit(
        preferences: const NoOpThemePreferencesRepository(),
      ),
      act: (cubit) => cubit.useDarkTheme(),
      expect: () => [ThemeMode.dark],
    );
  });
}
