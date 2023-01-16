String generateRoutesTemplate = """
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Routes {
 

  static Route<dynamic> generatedRoute(RouteSettings routeSettings) {
    if (kIsWeb || Platform.isWindows) {
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => _generate(routeSettings),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (_, a, __, c) => FadeTransition(
          opacity: a,
          child: c,
        ),
      );
    }
    return MaterialPageRoute(builder: (context) => _generate(routeSettings),);
  }

  static Widget _generate(RouteSettings routeSettings) {
    Object? args = routeSettings.arguments;
    switch (routeSettings.name) {      
      default:
        return Container();
    }
  }
}
""";
