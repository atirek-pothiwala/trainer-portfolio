import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trainer_portfolio/data/repositories/portfolio_repository.dart';
import 'package:trainer_portfolio/features/portfolio/bloc/portfolio_bloc.dart';
import 'package:trainer_portfolio/features/portfolio/bloc/portfolio_event.dart';
import 'package:trainer_portfolio/features/portfolio/bloc/portfolio_state.dart';

void main() {
  group('PortfolioBloc', () {
    late PortfolioRepository repository;

    setUp(() {
      repository = const PortfolioRepository();
    });

    blocTest<PortfolioBloc, PortfolioState>(
      'emits success with trainer profile on load',
      build: () => PortfolioBloc(repository: repository),
      act: (bloc) => bloc.add(const PortfolioLoadRequested()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        const PortfolioState(status: PortfolioStatus.loading),
        isA<PortfolioState>().having(
          (s) => s.status,
          'status',
          PortfolioStatus.success,
        ).having(
          (s) => s.profile?.name,
          'name',
          'Jordan Reed',
        ),
      ],
    );
  });
}
