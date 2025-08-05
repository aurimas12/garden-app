import 'package:flutter_test/flutter_test.dart';
import 'package:garden_app/main.dart';

void main() {
  testWidgets('shows login prompt', (WidgetTester tester) async {
    await tester.pumpWidget(const SodasApp());

    expect(find.text('Įvesk 6 skaitmenų kodą'), findsOneWidget);
    expect(find.text('Prisijungti'), findsOneWidget);
  });
}
