import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../data/models/workout_routine.dart';

class RoutineCard extends StatelessWidget {
  const RoutineCard({
    super.key,
    required this.routine,
    required this.onStart,
  });

  final WorkoutRoutine routine;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: frostedSurface(context),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onStart,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: tokens.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: tokens.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.fitness_center, color: tokens.accent),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        routine.name,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        routine.subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: tokens.textSecondary,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${routine.exerciseIds.length} exercises · ~${routine.estimatedMinutes} min',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: tokens.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.play_arrow_rounded, color: tokens.accent, size: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
