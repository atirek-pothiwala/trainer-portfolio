import 'package:equatable/equatable.dart';

class Certification extends Equatable {
  const Certification({
    required this.title,
    required this.issuer,
    required this.year,
    required this.description,
  });

  final String title;
  final String issuer;
  final int year;
  final String description;

  @override
  List<Object?> get props => [title, issuer, year, description];
}
