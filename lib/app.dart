import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'data/repositories/portfolio_repository.dart';
import 'features/portfolio/bloc/portfolio_bloc.dart';
import 'features/portfolio/bloc/portfolio_event.dart';
import 'features/shell/main_shell_page.dart';

class TrainerPortfolioApp extends StatelessWidget {
  const TrainerPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => const PortfolioRepository(),
      child: BlocProvider(
        create: (context) => PortfolioBloc(
          repository: context.read<PortfolioRepository>(),
        )..add(const PortfolioLoadRequested()),
        child: MaterialApp(
          title: 'Fit Coach',
          debugShowCheckedModeBanner: false,
          theme: buildAppTheme(),
          home: const MainShellPage(),
        ),
      ),
    );
  }
}
