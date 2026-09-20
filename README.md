# Fit Coach (Trainer Portfolio)

Flutter app (mobile, web, and desktop targets) for a personal trainer portfolio — Phase 1 with BLoC architecture. Phases 2 (Hevy-style workouts) and 3 (consulting) are scaffolded as coming-soon tabs.

## Stack

- **Flutter** (mobile + web)
- **flutter_bloc** + **equatable** for state management
- Dummy data in `lib/data/datasources/local_portfolio_data.dart` (swap for API/CMS later)

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
