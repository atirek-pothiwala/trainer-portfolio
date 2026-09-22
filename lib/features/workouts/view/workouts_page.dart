import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../bloc/workout_state.dart';
import 'active_workout_view.dart';
import 'workouts_hub_view.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      buildWhen: (prev, next) =>
          prev.hasActiveSession != next.hasActiveSession ||
          prev.activeSession != next.activeSession ||
          prev.status != next.status ||
          prev.routines != next.routines ||
          prev.recentWorkouts != next.recentWorkouts,
      builder: (context, state) {
        final session = state.activeSession;
        if (session != null) {
          return ActiveWorkoutView(session: session);
        }
        return const WorkoutsHubView();
      },
    );
  }
}
