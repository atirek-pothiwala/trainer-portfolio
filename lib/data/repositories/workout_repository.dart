import '../datasources/local_workout_data.dart';
import '../models/completed_workout.dart';
import '../models/exercise.dart';
import '../models/workout_routine.dart';

class WorkoutRepository {
  final List<CompletedWorkout> _history = [];

  Future<List<Exercise>> fetchExerciseLibrary() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    return List<Exercise>.from(LocalWorkoutData.exercises);
  }

  Future<List<WorkoutRoutine>> fetchRoutines() async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    return List<WorkoutRoutine>.from(LocalWorkoutData.routines);
  }

  List<CompletedWorkout> get recentWorkouts =>
      List<CompletedWorkout>.unmodifiable(_history);

  void saveCompletedWorkout(CompletedWorkout workout) {
    _history.insert(0, workout);
  }

  Exercise? findExerciseById(String id) => LocalWorkoutData.exerciseById(id);
}
