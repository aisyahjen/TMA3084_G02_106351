import 'package:flutter_test/flutter_test.dart';
import 'package:matcha_parlor/main.dart';

void main() {
  testWidgets('Matchaesya Co. app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MatchaParlorApp());

    expect(find.text('matchaesya co.'), findsOneWidget);
    expect(find.text('Our Menu'), findsOneWidget);
  });
}
