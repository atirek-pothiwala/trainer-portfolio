import 'package:equatable/equatable.dart';

class WorkoutRoutine extends Equatable {
  const WorkoutRoutine({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.exerciseIds,
    required this.estimatedMinutes,
  });

  final String id;
  final String name;
  final String subtitle;
  final List<String> exerciseIds;
  final int estimatedMinutes;

  @override
  List<Object?> get props => [id, name, subtitle, exerciseIds, estimatedMinutes];
}
