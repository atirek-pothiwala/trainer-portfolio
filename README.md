# HemiLift

Flutter app (mobile, web, and desktop targets) for a personal trainer portfolio — Phase 1 with BLoC architecture. Phases 2 (Hevy-style workouts) and 3 (consulting) are scaffolded as coming-soon tabs.

**Live web (GitHub Pages):** [https://atirek-pothiwala.github.io/trainer-portfolio/](https://atirek-pothiwala.github.io/trainer-portfolio/)

## Stack

- **Flutter** (mobile + web)
- **flutter_bloc** + **equatable** for state management
- Dummy data in `lib/data/datasources/local_portfolio_data.dart` (swap for API/CMS later)

## Light & dark theme

- `buildLightTheme()` / `buildDarkTheme()` in `lib/core/theme/app_theme.dart`
- Semantic colors via `AppThemeTokens` — use `context.tokens` in widgets (not hard-coded colors)
- `ThemeModeCubit` drives `MaterialApp.themeMode` (defaults to **system**)
- `ThemePreferencesRepository` is a stub today; implement with `shared_preferences` when you add a settings toggle:

```dart
context.read<ThemeModeCubit>().useLightTheme();
context.read<ThemeModeCubit>().useDarkTheme();
context.read<ThemeModeCubit>().useSystemTheme();
```

## Phase 1 features

- Trainer profile, bio, and stats
- Skills and certifications
- Client success stories (horizontal cards)
- Recent Instagram & YouTube posts (dummy thumbnails + external links)
- “Connect on Instagram” steps and CTA buttons

## Project structure

```
lib/
  app.dart
  core/           # theme, utilities
  data/           # models, repository, local dummy data
  features/
    portfolio/    # BLoC + portfolio UI
    shell/        # bottom navigation + phase placeholders
```

## Run locally

```bash
flutter pub get
flutter run -d chrome    # web
flutter run              # connected device / emulator
```

## Tests

```bash
flutter test
flutter analyze
```

## Next phases

| Phase | Tab        | Planned work                                      |
|-------|------------|---------------------------------------------------|
| 2     | Workouts   | Exercise library, routines, set/rep logging       |
| 3     | Consult    | Booking, video calls, program review              |

Replace dummy social URLs and copy in `local_portfolio_data.dart` when real content is ready.
