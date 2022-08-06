import 'package:alltests/features/auth/views/auth_view.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Auth Screen Test', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
      ])
      ..addScenario(
        name: 'Auth Screen',
        widget: AuthView(),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'Auth Screen');
  });
}
