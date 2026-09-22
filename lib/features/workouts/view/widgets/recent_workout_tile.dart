import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../data/models/completed_workout.dart';

class RecentWorkoutTile extends StatelessWidget {
  const RecentWorkoutTile({super.key, required this.workout});

  final CompletedWorkout workout;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final dateLabel = DateFormat.MMMd().add_jm().format(workout.finishedAt);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: frostedSurface(context),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: tokens.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateLabel,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: tokens.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${workout.completedSetCount} sets',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '${workout.durationMinutes} min',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: tokens.textSecondary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
