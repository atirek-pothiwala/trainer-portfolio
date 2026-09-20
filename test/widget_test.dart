import 'package:flutter_test/flutter_test.dart';
import 'package:trainer_portfolio/app.dart';

void main() {
  testWidgets('App loads portfolio shell', (tester) async {
    await tester.pumpWidget(const HemiLiftApp());
    await tester.pump();
    expect(find.text('Portfolio'), findsWidgets);
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Jordan Reed'), findsWidgets);
  });
}
