import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/animated_instagram_mesh_background.dart';
import '../../core/widgets/app_name_text.dart';
import '../../core/widgets/user_profile_avatar.dart';
import '../../data/repositories/app_user_repository.dart';
import '../portfolio/view/portfolio_page.dart';
import '../workouts/view/workouts_page.dart';
import 'coming_soon_page.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _index = 0;

  static const _tabs = [
    (
      label: 'Portfolio',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
    ),
    (
      label: 'Workouts',
      icon: Icons.fitness_center_outlined,
      selectedIcon: Icons.fitness_center,
    ),
    (
      label: 'Consult',
      icon: Icons.chat_bubble_outline,
      selectedIcon: Icons.chat_bubble,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navSurface = Theme.of(context).colorScheme.surface.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.82 : 0.92,
        );

    final appUser = context.read<AppUserRepository>().currentUser;

    return AnimatedInstagramMeshBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const AppNameText(fontSize: 26),
          actions: [UserProfileAvatar(user: appUser)],
        ),
        body: IndexedStack(
          index: _index,
          children: const [
            PortfolioPage(),
            WorkoutsPage(),
            ComingSoonPage(
              phaseLabel: 'Phase 3',
              title: 'Consultant service',
              description:
                  'Book 1:1 video calls, share goals, and get personalized program '
                  'reviews from your coach. Scheduling and payments will live here.',
              icon: Icons.video_call_outlined,
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: navSurface,
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: [
            for (final tab in _tabs)
              NavigationDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.selectedIcon),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}
