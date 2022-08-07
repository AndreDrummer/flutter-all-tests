import 'package:alltests/features/auth/controller/auth_controller.dart';
import 'package:alltests/features/auth/views/auth_view.dart';
import 'package:alltests/widgets/auth_screen_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUp(() {
    Get.lazyPut(() => AuthController());
  });

  testGoldens('check if UI is consistent with Figma', (tester) async {
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

    await screenMatchesGolden(tester, 'auth_screen');
  });

  testGoldens('check if textField error color is red', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
      ])
      ..addScenario(
        name: 'Auth Screen With Error',
        widget: AuthView(),
      );

    await tester.pumpDeviceBuilder(builder);

    await tester.tap(find.byType(LoginButton));

    await screenMatchesGolden(tester, 'auth_screen_with_error');
  });
}
