import 'package:alltests/widgets/auth_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/main.dart' as app;

void main() {
  testWidgets('ensures all elements are on the screen', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final logo = find.byKey(const Key('logo'));
    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final enterAccountButton = find.byType(LoginButton);

    expect(logo, findsOneWidget);
    expect(emailInput, findsOneWidget);
    expect(passwordInput, findsOneWidget);
    expect(enterAccountButton, findsOneWidget);
  });
}
