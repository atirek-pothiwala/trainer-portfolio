import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/portfolio_repository.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({required PortfolioRepository repository})
      : _repository = repository,
        super(const PortfolioState()) {
    on<PortfolioLoadRequested>(_onLoad);
    on<PortfolioRefreshRequested>(_onRefresh);
  }

  final PortfolioRepository _repository;

  Future<void> _onLoad(
    PortfolioLoadRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(status: PortfolioStatus.loading, clearError: true));
    await _fetch(emit);
  }

  Future<void> _onRefresh(
    PortfolioRefreshRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    await _fetch(emit);
  }

  Future<void> _fetch(Emitter<PortfolioState> emit) async {
    try {
      final profile = await _repository.fetchTrainerProfile();
      emit(
        state.copyWith(
          status: PortfolioStatus.success,
          profile: profile,
          clearError: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PortfolioStatus.failure,
          errorMessage: 'Could not load portfolio. Please try again.',
        ),
      );
    }
  }
}
