import 'package:flutter_test/flutter_test.dart';
import 'package:hemant_fitness/app.dart';

void main() {
  testWidgets('App loads portfolio shell', (tester) async {
    await tester.pumpWidget(const HemantFitnessApp());
    await tester.pump();
    expect(find.text('Portfolio'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Hemant Rathod'), findsWidgets);
  });
}
