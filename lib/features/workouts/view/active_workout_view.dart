import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme_tokens.dart';
import '../../../data/models/active_workout_session.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import 'widgets/exercise_log_card.dart';
import 'widgets/exercise_picker_sheet.dart';

class ActiveWorkoutView extends StatelessWidget {
  const ActiveWorkoutView({super.key, required this.session});

  final ActiveWorkoutSession session;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutBloc>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
          child: Row(
            children: [
              IconButton(
                tooltip: 'Discard workout',
                onPressed: () => _confirmDiscard(context),
                icon: const Icon(Icons.close),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      'In progress',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: context.tokens.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: session.exercises.isEmpty
                    ? null
                    : () => bloc.add(const WorkoutFinishSession()),
                child: const Text('Finish'),
              ),
            ],
          ),
        ),
        Expanded(
          child: session.exercises.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Add your first exercise to start logging sets.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: context.tokens.textSecondary,
                          ),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 4, bottom: 16),
                  itemCount: session.exercises.length,
                  itemBuilder: (context, index) {
                    final entry = session.exercises[index];
                    return ExerciseLogCard(entry: entry, bloc: bloc);
                  },
                ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: OutlinedButton.icon(
              onPressed: () {
                final library =
                    context.read<WorkoutBloc>().state.exerciseLibrary;
                showExercisePickerSheet(
                  context: context,
                  exercises: library,
                  onSelected: (exercise) {
                    bloc.add(WorkoutAddExercise(exercise.id));
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add exercise'),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmDiscard(BuildContext context) async {
    final discard = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard workout?'),
        content: const Text('Your logged sets for this session will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep training'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
        ],
      ),
    );
    if (discard == true && context.mounted) {
      context.read<WorkoutBloc>().add(const WorkoutDiscardSession());
    }
  }
}
