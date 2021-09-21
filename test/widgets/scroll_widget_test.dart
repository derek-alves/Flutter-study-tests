import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests/widgets/scroll_widget.dart';

void main() {
  group("ScrollWidget", () {
    testWidgets("should not scroll with less items", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollWidget(
          bookTitles: List.generate(5, (index) => "Book $index"),
        ),
      ));

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text("Book 0");
      expect(firstBookFinder, findsOneWidget);
    });

    testWidgets("should not scroll with a lot of items", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollWidget(
          bookTitles: List.generate(100, (index) => "Book $index"),
        ),
      ));

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text("Book 0");
      final elevenBookFinder = find.text("Book 11");

      final listTileFinder = find.byType(ListTile);

      expect(firstBookFinder, findsNothing);
      expect(elevenBookFinder, findsOneWidget);
      expect(listTileFinder, findsNWidgets(12));
    });

    testWidgets("should show only 2 items on small screen size", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(320, 350);

      await tester.pumpWidget(MaterialApp(
        home: ScrollWidget(
          bookTitles: List.generate(2, (index) => "Book $index"),
        ),
      ));

      expect(find.byType(ListTile), findsNWidgets(2));
    });

    testWidgets("should throw error if empty list is provided", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(320, 350);

      await tester.pumpWidget(MaterialApp(
        home: ScrollWidget(
          bookTitles: [],
        ),
      ));

      expect(tester.takeException(), isAssertionError);
    });
  });
}
