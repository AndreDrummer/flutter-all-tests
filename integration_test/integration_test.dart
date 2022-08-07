import 'package:alltests/features/auth/controller/auth_controller.dart';
import 'package:alltests/widgets/auth_screen_widgets.dart';
import 'package:integration_test/integration_test.dart';
import 'package:alltests/features/home/views/home.dart';
import 'package:alltests/core/constants/strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late String password = '';
  late String email = '';

  setUp(() {
    Get.lazyPut(() => AuthController());
  });

  testWidgets('check if all widget necessary is on screen', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final loginButton = find.byType(LoginButton);

    expect(emailInput, findsOneWidget);
    expect(passwordInput, findsOneWidget);
    expect(loginButton, findsOneWidget);
  });

  testWidgets('should perform login sucessfully', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    email = 'liukang@wins.com';
    password = 'KitanaKahn';

    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final loginButton = find.byType(LoginButton);
    final homeView = find.byType(HomeView);

    await tester.enterText(emailInput, email);
    await tester.enterText(passwordInput, password);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(homeView, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login: wrong password', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    email = 'liukang@wins.com';
    password = 'wrongpassword';

    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final loginButton = find.byType(LoginButton);
    final alertDialog = find.byType(AlertDialog);

    await tester.enterText(emailInput, email);
    await tester.enterText(passwordInput, password);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(alertDialog, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login: wrong email', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    email = 'wrong@email.com';
    password = 'wrongpassword';

    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final loginButton = find.byType(LoginButton);
    final alertDialog = find.byType(AlertDialog);

    await tester.enterText(emailInput, email);
    await tester.enterText(passwordInput, password);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(alertDialog, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login: empty data', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    email = '';
    password = '';

    final emailInput = find.byType(EmailInput);
    final passwordInput = find.byType(PasswordInput);
    final loginButton = find.byType(LoginButton);

    final requiredField = find.text(Strings.requiredField);
    final invalideEmail = find.text(Strings.invalideEmail);

    await tester.enterText(emailInput, email);
    await tester.enterText(passwordInput, password);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(requiredField, findsOneWidget);
    expect(invalideEmail, findsOneWidget);
  });
}
