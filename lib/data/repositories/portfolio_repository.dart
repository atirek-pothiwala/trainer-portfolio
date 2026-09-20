import '../datasources/local_portfolio_data.dart';
import '../models/trainer_profile.dart';

class PortfolioRepository {
  const PortfolioRepository();

  Future<TrainerProfile> fetchTrainerProfile() async {
    // Simulate network latency for realistic loading states.
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return LocalPortfolioData.trainer;
  }
}
