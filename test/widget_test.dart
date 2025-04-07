import 'package:flutter_test/flutter_test.dart';
import 'package:neuro_hub/main.dart';

void main() {
  testWidgets('App displays welcome message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NeuroHubApp());

    // Verify that the app displays the welcome message.
    expect(find.text('Welcome to Neuro Hub'), findsOneWidget);
  });
}
