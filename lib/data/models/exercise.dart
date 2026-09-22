import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  const Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
  });

  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;

  @override
  List<Object?> get props => [id, name, muscleGroup, equipment];
}
