import 'package:flutter/material.dart';

import '../portfolio/view/portfolio_page.dart';
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
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          PortfolioPage(),
          ComingSoonPage(
            phaseLabel: 'Phase 2',
            title: 'Workout tracking',
            description:
                'Log sets, reps, and rest timers — inspired by apps like Hevy. '
                'Routines, exercise library, and progress charts coming next.',
            icon: Icons.fitness_center,
          ),
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
    );
  }
}
