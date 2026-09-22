import 'package:equatable/equatable.dart';

import '../../../data/models/active_workout_session.dart';
import '../../../data/models/completed_workout.dart';
import '../../../data/models/exercise.dart';
import '../../../data/models/workout_routine.dart';

enum WorkoutStatus { initial, loading, ready, failure }

class WorkoutState extends Equatable {
  const WorkoutState({
    this.status = WorkoutStatus.initial,
    this.routines = const [],
    this.exerciseLibrary = const [],
    this.recentWorkouts = const [],
    this.activeSession,
    this.errorMessage,
  });

  final WorkoutStatus status;
  final List<WorkoutRoutine> routines;
  final List<Exercise> exerciseLibrary;
  final List<CompletedWorkout> recentWorkouts;
  final ActiveWorkoutSession? activeSession;
  final String? errorMessage;

  bool get hasActiveSession => activeSession != null;

  WorkoutState copyWith({
    WorkoutStatus? status,
    List<WorkoutRoutine>? routines,
    List<Exercise>? exerciseLibrary,
    List<CompletedWorkout>? recentWorkouts,
    ActiveWorkoutSession? activeSession,
    String? errorMessage,
    bool clearActiveSession = false,
    bool clearError = false,
  }) {
    return WorkoutState(
      status: status ?? this.status,
      routines: routines ?? this.routines,
      exerciseLibrary: exerciseLibrary ?? this.exerciseLibrary,
      recentWorkouts: recentWorkouts ?? this.recentWorkouts,
      activeSession:
          clearActiveSession ? null : (activeSession ?? this.activeSession),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        routines,
        exerciseLibrary,
        recentWorkouts,
        activeSession,
        errorMessage,
      ];
}
