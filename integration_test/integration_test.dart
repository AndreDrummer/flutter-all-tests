import 'package:alltests/core/constants/strings.dart';
import 'package:alltests/features/auth/controller/auth_controller.dart';
import 'package:alltests/widgets/auth_screen_widgets.dart';
import 'package:alltests/features/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/main.dart' as app;
import 'package:get/get.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.lazyPut(() => AuthController());
  });

  testWidgets('check if all widget necessary is on screen', (tester) async {
    // Initialize Screen
    app.main();
    await tester.pumpAndSettle();

    // Find the EmailInput
    final emailInput = find.byType(EmailInput);

    // Find the PasswordInput
    final passwordInput = find.byType(PasswordInput);

    // Find the LoginButton
    final loginButton = find.byType(LoginButton);

    // Check if there is only one EmailInput
    expect(emailInput, findsOneWidget);

    // Check if there is only one PasswordInput
    expect(passwordInput, findsOneWidget);

    // Check if there is only one LoginButton
    expect(loginButton, findsOneWidget);
  });

  testWidgets('should perform login sucessfully', (tester) async {
    // Initialize Screen
    app.main();
    await tester.pumpAndSettle();

    // Find the EmailInput
    final emailInput = find.byType(EmailInput);

    // Find the PasswordInput
    final passwordInput = find.byType(PasswordInput);

    // Find the LoginButton
    final loginButton = find.byType(LoginButton);

    await tester.enterText(emailInput, 'liukang@wins.com');
    await tester.enterText(passwordInput, 'KitanaKahn');

    // Clicks the button...
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Check if HomeView is being presented
    final homeView = find.byType(HomeView);
    expect(homeView, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login sucessfully with wrong password',
      (tester) async {
    // Initialize Screen
    app.main();
    await tester.pumpAndSettle();

    // Find the EmailInput
    final emailInput = find.byType(EmailInput);

    // Find the PasswordInput
    final passwordInput = find.byType(PasswordInput);

    // Find the LoginButton
    final loginButton = find.byType(LoginButton);

    await tester.enterText(emailInput, 'liukang@wins.com');
    await tester.enterText(passwordInput, 'wrongpassword');

    // Clicks the button...
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Shows dialog
    final alertDialog = find.byType(AlertDialog);
    expect(alertDialog, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login sucessfully with wrong email',
      (tester) async {
    // Initialize Screen
    app.main();
    await tester.pumpAndSettle();

    // Find the EmailInput
    final emailInput = find.byType(EmailInput);

    // Find the PasswordInput
    final passwordInput = find.byType(PasswordInput);

    // Find the LoginButton
    final loginButton = find.byType(LoginButton);

    await tester.enterText(emailInput, 'wrong@email.com');
    await tester.enterText(passwordInput, 'KitanaKahn');

    // Clicks the button...
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Shows dialog
    final alertDialog = find.byType(AlertDialog);
    expect(alertDialog, findsOneWidget);
  });
  testWidgets('shouldn\'t perform login sucessfully with empty data',
      (tester) async {
    // Initialize Screen
    app.main();
    await tester.pumpAndSettle();

    // Find the EmailInput
    final emailInput = find.byType(EmailInput);

    // Find the PasswordInput
    final passwordInput = find.byType(PasswordInput);

    // Find the LoginButton
    final loginButton = find.byType(LoginButton);

    await tester.enterText(emailInput, '');
    await tester.enterText(passwordInput, '');

    // Clicks the button...
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Shows dialog
    final requiredField = find.text(Strings.requiredField);
    expect(requiredField, findsWidgets);
  });
}
