import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme_tokens.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import 'widgets/recent_workout_tile.dart';
import 'widgets/routine_card.dart';
import 'widgets/workout_section_header.dart';

class WorkoutsHubView extends StatelessWidget {
  const WorkoutsHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        if (state.status == WorkoutStatus.loading &&
            state.routines.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: context.tokens.accent),
          );
        }

        if (state.status == WorkoutStatus.failure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage ?? 'Something went wrong'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => context
                        .read<WorkoutBloc>()
                        .add(const WorkoutLoadRequested()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Text(
                'Train like Hevy — log sets, track volume, build habits.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.tokens.textSecondary,
                      height: 1.45,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FilledButton.icon(
                onPressed: () =>
                    context.read<WorkoutBloc>().add(const WorkoutStartEmpty()),
                icon: const Icon(Icons.add),
                label: const Text('Start empty workout'),
              ),
            ),
            const WorkoutSectionHeader(title: 'Routines'),
            for (final routine in state.routines)
              RoutineCard(
                routine: routine,
                onStart: () => context.read<WorkoutBloc>().add(
                      WorkoutStartRoutine(routine.id),
                    ),
              ),
            const WorkoutSectionHeader(title: 'History'),
            if (state.recentWorkouts.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'No workouts yet. Start a routine or empty workout to log your first session.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.tokens.textSecondary,
                      ),
                ),
              )
            else
              for (final workout in state.recentWorkouts)
                RecentWorkoutTile(workout: workout),
          ],
        );
      },
    );
  }
}
