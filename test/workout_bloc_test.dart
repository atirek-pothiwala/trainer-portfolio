import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trainer_portfolio/data/datasources/local_workout_data.dart';
import 'package:trainer_portfolio/data/repositories/workout_repository.dart';
import 'package:trainer_portfolio/features/workouts/bloc/workout_bloc.dart';
import 'package:trainer_portfolio/features/workouts/bloc/workout_event.dart';
import 'package:trainer_portfolio/features/workouts/bloc/workout_state.dart';

void main() {
  group('WorkoutBloc', () {
    late WorkoutRepository repository;

    setUp(() {
      repository = WorkoutRepository();
    });

    blocTest<WorkoutBloc, WorkoutState>(
      'loads routines and exercise library',
      build: () => WorkoutBloc(repository: repository),
      act: (bloc) => bloc.add(const WorkoutLoadRequested()),
      wait: const Duration(milliseconds: 250),
      expect: () => [
        isA<WorkoutState>().having(
          (s) => s.status,
          'status',
          WorkoutStatus.loading,
        ),
        isA<WorkoutState>()
            .having((s) => s.status, 'status', WorkoutStatus.ready)
            .having((s) => s.routines.length, 'routines', 3)
            .having((s) => s.exerciseLibrary.isNotEmpty, 'library', true),
      ],
    );

    blocTest<WorkoutBloc, WorkoutState>(
      'starts routine with prefilled exercises',
      build: () => WorkoutBloc(repository: repository),
      seed: () => WorkoutState(
        status: WorkoutStatus.ready,
        routines: LocalWorkoutData.routines,
        exerciseLibrary: LocalWorkoutData.exercises,
      ),
      act: (bloc) => bloc.add(const WorkoutStartRoutine('push_day')),
      verify: (bloc) {
        expect(bloc.state.activeSession, isNotNull);
        expect(bloc.state.activeSession!.title, 'Push Day');
        expect(bloc.state.activeSession!.exercises.length, 5);
      },
    );
  });
}
