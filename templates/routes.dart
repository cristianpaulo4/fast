String routesTemplate = """
import 'package:flutter/widgets.dart';
import 'package:{{file-name}}/features/home/presentation/pages/home_page.dart';

class Routes {
  static const String home = "home";
  static Map<String, WidgetBuilder> routes() => {
        home: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map?;
          return HomePage();
        },
      };
}
""";