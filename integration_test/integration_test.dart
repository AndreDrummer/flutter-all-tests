import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/constants/country_enum.dart';
import 'package:alltests/main.dart';
import 'package:alltests/repository/repository.dart';
import 'package:alltests/widgets/switch_country_button.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late StartScreenRepository repository;
  late Country countryAfterCountryChanged;
  late Country initialCountry;

  setUp(() {
    countryAfterCountryChanged = Country.mexico;
    initialCountry = Country.brasil;
    repository = StartScreenRepository(initialCountry);
  });

  testWidgets('should change country from brasil to mexico', (tester) async {
    tester.printToConsole('Initial Country ${repository.country}');

    // Initialize Screen
    await tester.pumpWidget(StartScreen(repository: repository));
    await tester.pumpAndSettle();

    // Check if the initial country matches
    expect(repository.country, initialCountry);

    // Find the SwitchCountryButton which has the initial country value
    final switchCountryButtonInitialState = find.byWidgetPredicate((widget) {
      if (widget is SwitchCountryButton) {
        return widget.initialValue == initialCountry;
      }
      return false;
    });

    // Check if there is only one SwitchCountryButton of this type
    expect(switchCountryButtonInitialState, findsOneWidget);

    // Clicks the button...
    await tester.tap(switchCountryButtonInitialState);
    await tester.pumpAndSettle();

    // Find the mexico country option
    final mexicoCountryOption = find.descendant(
      of: find.byType(DropdownMenuItem<Country>),
      matching: find.text(
        countryAfterCountryChanged.tostring(),
      ),
    );

    // Hits that option
    await tester.tap(mexicoCountryOption);
    await tester.pumpAndSettle();

    // verifies if the SwitchCountryButton has a new country value
    final switchCountryButtonChangedState = find.byWidgetPredicate((widget) {
      if (widget is SwitchCountryButton) {
        final newCountry = widget.initialValue;
        return newCountry == countryAfterCountryChanged;
      }
      return false;
    });

    // Do some validations after change performed.
    // Notes that the repository has the new value assigned during the cycle.
    expect(switchCountryButtonChangedState, findsOneWidget);
    expect(repository.country, countryAfterCountryChanged);
    expect(switchCountryButtonInitialState, findsNothing);

    tester.printToConsole('New Country Switched ${repository.country}');
  });
}
