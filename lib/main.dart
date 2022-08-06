import 'package:alltests/core/utils/routes/router.dart';
import 'package:alltests/core/utils/routes/routes_name.dart';
import 'package:alltests/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:alltests/core/constants/theme.dart';

import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: ThemeData(primarySwatch: materialColor),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.root,
    );
  }
}
