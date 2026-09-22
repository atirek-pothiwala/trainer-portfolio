import 'package:equatable/equatable.dart';

import 'workout_exercise_entry.dart';

class CompletedWorkout extends Equatable {
  const CompletedWorkout({
    required this.id,
    required this.finishedAt,
    required this.title,
    required this.exercises,
    required this.durationMinutes,
  });

  final String id;
  final DateTime finishedAt;
  final String title;
  final List<WorkoutExerciseEntry> exercises;
  final int durationMinutes;

  int get completedSetCount => exercises
      .expand((e) => e.sets)
      .where((s) => s.isCompleted)
      .length;

  int get totalVolumeKg {
    var volume = 0;
    for (final entry in exercises) {
      for (final set in entry.sets) {
        if (set.isCompleted && set.weightKg != null && set.reps != null) {
          volume += (set.weightKg! * set.reps!).round();
        }
      }
    }
    return volume;
  }

  @override
  List<Object?> get props =>
      [id, finishedAt, title, exercises, durationMinutes];
}
