import '../models/exercise.dart';
import '../models/workout_routine.dart';

/// Dummy workout library for Phase 2. Replace with API / sync later.
class LocalWorkoutData {
  static const exercises = <Exercise>[
    Exercise(
      id: 'bench_press',
      name: 'Barbell Bench Press',
      muscleGroup: 'Chest',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 'incline_db_press',
      name: 'Incline Dumbbell Press',
      muscleGroup: 'Chest',
      equipment: 'Dumbbell',
    ),
    Exercise(
      id: 'lat_pulldown',
      name: 'Lat Pulldown',
      muscleGroup: 'Back',
      equipment: 'Cable',
    ),
    Exercise(
      id: 'barbell_row',
      name: 'Barbell Row',
      muscleGroup: 'Back',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 'squat',
      name: 'Back Squat',
      muscleGroup: 'Legs',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 'rdl',
      name: 'Romanian Deadlift',
      muscleGroup: 'Legs',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 'ohp',
      name: 'Overhead Press',
      muscleGroup: 'Shoulders',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 'lateral_raise',
      name: 'Lateral Raise',
      muscleGroup: 'Shoulders',
      equipment: 'Dumbbell',
    ),
    Exercise(
      id: 'tricep_pushdown',
      name: 'Tricep Pushdown',
      muscleGroup: 'Arms',
      equipment: 'Cable',
    ),
    Exercise(
      id: 'barbell_curl',
      name: 'Barbell Curl',
      muscleGroup: 'Arms',
      equipment: 'Barbell',
    ),
  ];

  static const routines = <WorkoutRoutine>[
    WorkoutRoutine(
      id: 'push_day',
      name: 'Push Day',
      subtitle: 'Chest, shoulders, triceps',
      exerciseIds: [
        'bench_press',
        'incline_db_press',
        'ohp',
        'lateral_raise',
        'tricep_pushdown',
      ],
      estimatedMinutes: 55,
    ),
    WorkoutRoutine(
      id: 'pull_day',
      name: 'Pull Day',
      subtitle: 'Back & biceps',
      exerciseIds: [
        'lat_pulldown',
        'barbell_row',
        'barbell_curl',
      ],
      estimatedMinutes: 45,
    ),
    WorkoutRoutine(
      id: 'leg_day',
      name: 'Leg Day',
      subtitle: 'Quads, hamstrings, glutes',
      exerciseIds: [
        'squat',
        'rdl',
      ],
      estimatedMinutes: 50,
    ),
  ];

  static Exercise? exerciseById(String id) {
    for (final e in exercises) {
      if (e.id == id) return e;
    }
    return null;
  }
}
