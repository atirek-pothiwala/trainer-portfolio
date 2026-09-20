import 'package:equatable/equatable.dart';

class SuccessStory extends Equatable {
  const SuccessStory({
    required this.clientName,
    required this.goal,
    required this.result,
    required this.duration,
    required this.quote,
    required this.imageUrl,
  });

  final String clientName;
  final String goal;
  final String result;
  final String duration;
  final String quote;
  final String imageUrl;

  @override
  List<Object?> get props =>
      [clientName, goal, result, duration, quote, imageUrl];
}
