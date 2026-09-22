import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../data/models/exercise.dart';

Future<void> showExercisePickerSheet({
  required BuildContext context,
  required List<Exercise> exercises,
  required ValueChanged<Exercise> onSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                child: Text(
                  'Add exercise',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return ListTile(
                      title: Text(exercise.name),
                      subtitle: Text(
                        '${exercise.muscleGroup} · ${exercise.equipment}',
                        style: TextStyle(color: context.tokens.textSecondary),
                      ),
                      trailing: const Icon(Icons.add_circle_outline),
                      onTap: () {
                        onSelected(exercise);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
