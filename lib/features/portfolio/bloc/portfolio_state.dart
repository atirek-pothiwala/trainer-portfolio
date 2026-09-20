import 'package:equatable/equatable.dart';

import '../../../data/models/trainer_profile.dart';

enum PortfolioStatus { initial, loading, success, failure }

class PortfolioState extends Equatable {
  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.profile,
    this.errorMessage,
  });

  final PortfolioStatus status;
  final TrainerProfile? profile;
  final String? errorMessage;

  PortfolioState copyWith({
    PortfolioStatus? status,
    TrainerProfile? profile,
    String? errorMessage,
    bool clearError = false,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [status, profile, errorMessage];
}
