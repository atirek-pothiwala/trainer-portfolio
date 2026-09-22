import 'package:equatable/equatable.dart';

sealed class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutLoadRequested extends WorkoutEvent {
  const WorkoutLoadRequested();
}

final class WorkoutStartEmpty extends WorkoutEvent {
  const WorkoutStartEmpty();
}

final class WorkoutStartRoutine extends WorkoutEvent {
  const WorkoutStartRoutine(this.routineId);

  final String routineId;

  @override
  List<Object?> get props => [routineId];
}

final class WorkoutAddExercise extends WorkoutEvent {
  const WorkoutAddExercise(this.exerciseId);

  final String exerciseId;

  @override
  List<Object?> get props => [exerciseId];
}

final class WorkoutUpdateSet extends WorkoutEvent {
  const WorkoutUpdateSet({
    required this.entryId,
    required this.setIndex,
    this.weightKg,
    this.reps,
    this.isCompleted,
  });

  final String entryId;
  final int setIndex;
  final double? weightKg;
  final int? reps;
  final bool? isCompleted;

  @override
  List<Object?> get props =>
      [entryId, setIndex, weightKg, reps, isCompleted];
}

final class WorkoutAddSet extends WorkoutEvent {
  const WorkoutAddSet(this.entryId);

  final String entryId;

  @override
  List<Object?> get props => [entryId];
}

final class WorkoutFinishSession extends WorkoutEvent {
  const WorkoutFinishSession();
}

final class WorkoutDiscardSession extends WorkoutEvent {
  const WorkoutDiscardSession();
}
