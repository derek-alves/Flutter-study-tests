import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/main.dart' as app;

void main() {
  group("multiple", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("multiple App test", (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final emailFormField = find.byKey(Key("email"));

      expect(emailFormField, findsWidgets);
    });
  });
}
