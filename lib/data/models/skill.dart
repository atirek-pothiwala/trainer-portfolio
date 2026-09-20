import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  const Skill({
    required this.name,
    required this.level,
    required this.category,
  });

  final String name;
  final int level; // 1–5
  final String category;

  @override
  List<Object?> get props => [name, level, category];
}
