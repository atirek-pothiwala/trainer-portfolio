import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/active_workout_session.dart';
import '../../../data/models/completed_workout.dart';
import '../../../data/models/exercise.dart';
import '../../../data/models/workout_exercise_entry.dart';
import '../../../data/models/workout_routine.dart';
import '../../../data/models/workout_set.dart';
import '../../../data/repositories/workout_repository.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc({required WorkoutRepository repository})
      : _repository = repository,
        super(const WorkoutState()) {
    on<WorkoutLoadRequested>(_onLoad);
    on<WorkoutStartEmpty>(_onStartEmpty);
    on<WorkoutStartRoutine>(_onStartRoutine);
    on<WorkoutAddExercise>(_onAddExercise);
    on<WorkoutUpdateSet>(_onUpdateSet);
    on<WorkoutAddSet>(_onAddSet);
    on<WorkoutFinishSession>(_onFinish);
    on<WorkoutDiscardSession>(_onDiscard);
  }

  final WorkoutRepository _repository;
  int _idCounter = 0;

  String _nextId(String prefix) {
    _idCounter += 1;
    return '${prefix}_${DateTime.now().millisecondsSinceEpoch}_$_idCounter';
  }

  Future<void> _onLoad(
    WorkoutLoadRequested event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutStatus.loading, clearError: true));
    try {
      final routines = await _repository.fetchRoutines();
      final library = await _repository.fetchExerciseLibrary();
      emit(
        state.copyWith(
          status: WorkoutStatus.ready,
          routines: routines,
          exerciseLibrary: library,
          recentWorkouts: _repository.recentWorkouts,
          clearError: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: WorkoutStatus.failure,
          errorMessage: 'Could not load workouts. Please try again.',
        ),
      );
    }
  }

  void _onStartEmpty(WorkoutStartEmpty event, Emitter<WorkoutState> emit) {
    emit(
      state.copyWith(
        activeSession: ActiveWorkoutSession(
          id: _nextId('session'),
          startedAt: DateTime.now(),
          title: 'Workout',
          exercises: const [],
        ),
      ),
    );
  }

  void _onStartRoutine(WorkoutStartRoutine event, Emitter<WorkoutState> emit) {
    WorkoutRoutine? routine;
    for (final r in state.routines) {
      if (r.id == event.routineId) {
        routine = r;
        break;
      }
    }
    if (routine == null) return;

    final entries = <WorkoutExerciseEntry>[];
    for (final exerciseId in routine.exerciseIds) {
      final exercise = _repository.findExerciseById(exerciseId);
      if (exercise != null) {
        entries.add(_newEntry(exercise));
      }
    }

    emit(
      state.copyWith(
        activeSession: ActiveWorkoutSession(
          id: _nextId('session'),
          startedAt: DateTime.now(),
          title: routine.name,
          exercises: entries,
        ),
      ),
    );
  }

  void _onAddExercise(WorkoutAddExercise event, Emitter<WorkoutState> emit) {
    final session = state.activeSession;
    if (session == null) return;

    final exercise = _repository.findExerciseById(event.exerciseId);
    if (exercise == null) return;

    emit(
      state.copyWith(
        activeSession: session.copyWith(
          exercises: [...session.exercises, _newEntry(exercise)],
        ),
      ),
    );
  }

  void _onUpdateSet(WorkoutUpdateSet event, Emitter<WorkoutState> emit) {
    final session = state.activeSession;
    if (session == null) return;

    final updatedExercises = session.exercises.map((entry) {
      if (entry.id != event.entryId) return entry;
      final sets = entry.sets.map((set) {
        if (set.index != event.setIndex) return set;
        return set.copyWith(
          weightKg: event.weightKg,
          reps: event.reps,
          isCompleted: event.isCompleted,
        );
      }).toList();
      return entry.copyWith(sets: sets);
    }).toList();

    emit(
      state.copyWith(
        activeSession: session.copyWith(exercises: updatedExercises),
      ),
    );
  }

  void _onAddSet(WorkoutAddSet event, Emitter<WorkoutState> emit) {
    final session = state.activeSession;
    if (session == null) return;

    final updatedExercises = session.exercises.map((entry) {
      if (entry.id != event.entryId) return entry;
      final nextIndex = entry.sets.isEmpty ? 1 : entry.sets.last.index + 1;
      final previous = entry.sets.isNotEmpty ? entry.sets.last : null;
      return entry.copyWith(
        sets: [
          ...entry.sets,
          WorkoutSet(
            index: nextIndex,
            weightKg: previous?.weightKg,
            reps: previous?.reps,
          ),
        ],
      );
    }).toList();

    emit(
      state.copyWith(
        activeSession: session.copyWith(exercises: updatedExercises),
      ),
    );
  }

  void _onFinish(WorkoutFinishSession event, Emitter<WorkoutState> emit) {
    final session = state.activeSession;
    if (session == null || session.exercises.isEmpty) return;

    final duration = DateTime.now().difference(session.startedAt).inMinutes;
    final completed = CompletedWorkout(
      id: _nextId('done'),
      finishedAt: DateTime.now(),
      title: session.title,
      exercises: session.exercises,
      durationMinutes: duration < 1 ? 1 : duration,
    );
    _repository.saveCompletedWorkout(completed);

    emit(
      state.copyWith(
        clearActiveSession: true,
        recentWorkouts: _repository.recentWorkouts,
      ),
    );
  }

  void _onDiscard(WorkoutDiscardSession event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(clearActiveSession: true));
  }

  WorkoutExerciseEntry _newEntry(Exercise exercise) {
    return WorkoutExerciseEntry(
      id: _nextId('entry'),
      exercise: exercise,
      sets: const [
        WorkoutSet(index: 1),
        WorkoutSet(index: 2),
        WorkoutSet(index: 3),
      ],
    );
  }
}
