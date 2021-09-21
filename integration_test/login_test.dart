import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/main.dart' as app;

void main() {
  group("App test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Full App test", (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final emailFormField = find.byKey(Key("email"));
      final passwordFormField = find.byKey(Key("password"));
      final loginButton = find.byKey(Key("loginButton"));

      await tester.enterText(emailFormField, "derek@derek.com");
      await tester.enterText(passwordFormField, "123456");
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      final firstCheckBox = find.byType(Checkbox).first;

      expect(
          tester.getSemantics(firstCheckBox),
          matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
          ));

      await tester.tap(firstCheckBox);
      await tester.pumpAndSettle();

      expect(
          tester.getSemantics(firstCheckBox),
          matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
          ));
    });
  });
}
