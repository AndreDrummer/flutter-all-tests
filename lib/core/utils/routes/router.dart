import 'package:alltests/core/utils/routes/routes_name.dart';
import 'package:alltests/features/auth/views/auth_view.dart';
import 'package:alltests/features/home/views/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => AuthView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
    }
    return null;
  }
}
