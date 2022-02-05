import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_course/main.dart';

void main() {
  testWidgets("Test home page", (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("No string entries"), findsOneWidget);
    expect(find.byType(ListView), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    var fieldFinder = find.byKey(ValueKey("field"));
    await tester.ensureVisible(fieldFinder);
    await tester.enterText(fieldFinder, "Hello, world!");
    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
  });
}
