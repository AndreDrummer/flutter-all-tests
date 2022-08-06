import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  late StartScreenRepository repository;
  late Country initialCountry;

  setUp(() {
    initialCountry = Country.brasil;
    repository = StartScreenRepository(initialCountry);
  });

  testGoldens('Start Screen Test', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
      ])
      ..addScenario(
        name: 'Start Screen',
        widget: StartScreen(repository: repository),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'Start Screen');
  });
}
