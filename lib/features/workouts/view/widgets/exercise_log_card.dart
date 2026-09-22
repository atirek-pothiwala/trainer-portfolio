import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../data/models/workout_exercise_entry.dart';
import '../../../../data/models/workout_set.dart';
import '../../bloc/workout_bloc.dart';
import '../../bloc/workout_event.dart';

class ExerciseLogCard extends StatelessWidget {
  const ExerciseLogCard({
    super.key,
    required this.entry,
    required this.bloc,
  });

  final WorkoutExerciseEntry entry;
  final WorkoutBloc bloc;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Container(
        decoration: BoxDecoration(
          color: frostedSurface(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: tokens.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.exercise.name,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Text(
                          '${entry.exercise.muscleGroup} · ${entry.exercise.equipment}',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: tokens.textSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => bloc.add(WorkoutAddSet(entry.id)),
                    child: const Text('Add set'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  _HeaderCell('Set', flex: 1),
                  _HeaderCell('kg', flex: 2),
                  _HeaderCell('Reps', flex: 2),
                  const SizedBox(width: 44),
                ],
              ),
            ),
            const SizedBox(height: 4),
            for (final set in entry.sets)
              _SetRow(
                entryId: entry.id,
                set: set,
                bloc: bloc,
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.label, {required this.flex});

  final String label;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: context.tokens.textSecondary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  const _SetRow({
    required this.entryId,
    required this.set,
    required this.bloc,
  });

  final String entryId;
  final WorkoutSet set;
  final WorkoutBloc bloc;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '${set.index}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _SetField(
              fieldKey: ValueKey('$entryId-${set.index}-w-${set.weightKg}'),
              hint: '—',
              initial: set.weightKg?.toString() ?? '',
              onSubmitted: (v) {
                final parsed = double.tryParse(v.replaceAll(',', '.'));
                bloc.add(
                  WorkoutUpdateSet(
                    entryId: entryId,
                    setIndex: set.index,
                    weightKg: parsed,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: _SetField(
              fieldKey: ValueKey('$entryId-${set.index}-r-${set.reps}'),
              hint: '—',
              initial: set.reps?.toString() ?? '',
              keyboardType: TextInputType.number,
              onSubmitted: (v) {
                final parsed = int.tryParse(v);
                bloc.add(
                  WorkoutUpdateSet(
                    entryId: entryId,
                    setIndex: set.index,
                    reps: parsed,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 44,
            child: IconButton(
              tooltip: set.isCompleted ? 'Completed' : 'Mark done',
              onPressed: () {
                bloc.add(
                  WorkoutUpdateSet(
                    entryId: entryId,
                    setIndex: set.index,
                    isCompleted: !set.isCompleted,
                  ),
                );
              },
              icon: Icon(
                set.isCompleted
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                color:
                    set.isCompleted ? tokens.accent : tokens.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SetField extends StatelessWidget {
  const _SetField({
    required this.fieldKey,
    required this.hint,
    required this.initial,
    required this.onSubmitted,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
  });

  final Key fieldKey;
  final String hint;
  final String initial;
  final TextInputType keyboardType;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      initialValue: initial,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      ],
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onFieldSubmitted: onSubmitted,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
