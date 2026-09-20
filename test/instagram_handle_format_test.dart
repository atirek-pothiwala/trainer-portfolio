import 'package:flutter_test/flutter_test.dart';
import 'package:trainer_portfolio/core/utils/instagram_handle_format.dart';

void main() {
  test('formatInstagramHandle adds single @', () {
    expect(formatInstagramHandle('fit.coach.jordan'), '@fit.coach.jordan');
    expect(formatInstagramHandle('@fit.coach.jordan'), '@fit.coach.jordan');
    expect(formatInstagramHandle('@@fit.coach.jordan'), '@fit.coach.jordan');
  });
}
