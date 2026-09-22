import 'package:equatable/equatable.dart';

import 'workout_exercise_entry.dart';

class ActiveWorkoutSession extends Equatable {
  const ActiveWorkoutSession({
    required this.id,
    required this.startedAt,
    required this.title,
    required this.exercises,
  });

  final String id;
  final DateTime startedAt;
  final String title;
  final List<WorkoutExerciseEntry> exercises;

  ActiveWorkoutSession copyWith({
    String? id,
    DateTime? startedAt,
    String? title,
    List<WorkoutExerciseEntry>? exercises,
  }) {
    return ActiveWorkoutSession(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      title: title ?? this.title,
      exercises: exercises ?? this.exercises,
    );
  }

  @override
  List<Object?> get props => [id, startedAt, title, exercises];
}
