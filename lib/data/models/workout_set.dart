import 'package:equatable/equatable.dart';

class WorkoutSet extends Equatable {
  const WorkoutSet({
    required this.index,
    this.weightKg,
    this.reps,
    this.isCompleted = false,
  });

  final int index;
  final double? weightKg;
  final int? reps;
  final bool isCompleted;

  WorkoutSet copyWith({
    int? index,
    double? weightKg,
    int? reps,
    bool? isCompleted,
    bool clearWeight = false,
    bool clearReps = false,
  }) {
    return WorkoutSet(
      index: index ?? this.index,
      weightKg: clearWeight ? null : (weightKg ?? this.weightKg),
      reps: clearReps ? null : (reps ?? this.reps),
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [index, weightKg, reps, isCompleted];
}
