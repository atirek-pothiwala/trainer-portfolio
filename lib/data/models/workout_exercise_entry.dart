import 'package:equatable/equatable.dart';

import 'exercise.dart';
import 'workout_set.dart';

class WorkoutExerciseEntry extends Equatable {
  const WorkoutExerciseEntry({
    required this.id,
    required this.exercise,
    required this.sets,
  });

  final String id;
  final Exercise exercise;
  final List<WorkoutSet> sets;

  WorkoutExerciseEntry copyWith({
    String? id,
    Exercise? exercise,
    List<WorkoutSet>? sets,
  }) {
    return WorkoutExerciseEntry(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      sets: sets ?? this.sets,
    );
  }

  @override
  List<Object?> get props => [id, exercise, sets];
}
