import 'package:flutter_test/flutter_test.dart';
import 'package:lab6_prm393/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ResponsiveMovieApp());

    // Verify that the title is present.
    expect(find.text('Find a Movie'), findsOneWidget);
  });
}
