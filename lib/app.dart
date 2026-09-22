import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_branding.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_mode_cubit.dart';
import 'core/theme/theme_preferences_repository.dart';
import 'data/repositories/app_user_repository.dart';
import 'data/repositories/portfolio_repository.dart';
import 'data/repositories/workout_repository.dart';
import 'features/portfolio/bloc/portfolio_bloc.dart';
import 'features/portfolio/bloc/portfolio_event.dart';
import 'features/workouts/bloc/workout_bloc.dart';
import 'features/workouts/bloc/workout_event.dart';
import 'features/shell/main_shell_page.dart';

class HemiLiftApp extends StatelessWidget {
  const HemiLiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => const PortfolioRepository()),
        RepositoryProvider(create: (_) => const AppUserRepository()),
        RepositoryProvider(create: (_) => WorkoutRepository()),
        RepositoryProvider<ThemePreferencesRepository>(
          create: (_) => const NoOpThemePreferencesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PortfolioBloc(
              repository: context.read<PortfolioRepository>(),
            )..add(const PortfolioLoadRequested()),
          ),
          BlocProvider(
            create: (context) => ThemeModeCubit(
              preferences: context.read<ThemePreferencesRepository>(),
            )..loadSavedThemeMode(),
          ),
          BlocProvider(
            create: (context) => WorkoutBloc(
              repository: context.read<WorkoutRepository>(),
            )..add(const WorkoutLoadRequested()),
          ),
        ],
        child: BlocBuilder<ThemeModeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              title: AppBranding.name,
              debugShowCheckedModeBanner: false,
              theme: buildLightTheme(),
              darkTheme: buildDarkTheme(),
              themeMode: themeMode,
              home: const MainShellPage(),
            );
          },
        ),
      ),
    );
  }
}
