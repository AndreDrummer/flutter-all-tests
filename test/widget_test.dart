import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/main.dart' as app;
import 'package:alltests/widgets/nu_logo.dart';
import 'package:alltests/widgets/rounded_button.dart';
import 'package:alltests/widgets/switch_country_button.dart';

void main() {
  testWidgets('ensures all elements are on the screen', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final imageBackground = find.byKey(const ValueKey('background_image'));
    final enterAccountButton = find.text('Entrar na minha conta');
    final switchcountryButton = find.byType(SwitchCountryButton);
    final footTextHeadline1 = find.text('Você no controle da');
    final footTextHeadline2 = find.text('sua vida financeira');
    final startButton = find.byType(RoundedButton);
    final nuLogo = find.byType(NuLogo);

    expect(imageBackground, findsOneWidget);
    expect(enterAccountButton, findsOneWidget);
    expect(switchcountryButton, findsOneWidget);
    expect(footTextHeadline1, findsOneWidget);
    expect(footTextHeadline2, findsOneWidget);
    expect(startButton, findsOneWidget);
    expect(nuLogo, findsOneWidget);
  });
}
