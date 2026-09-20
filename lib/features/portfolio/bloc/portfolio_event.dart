import 'package:equatable/equatable.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

final class PortfolioLoadRequested extends PortfolioEvent {
  const PortfolioLoadRequested();
}

final class PortfolioRefreshRequested extends PortfolioEvent {
  const PortfolioRefreshRequested();
}
