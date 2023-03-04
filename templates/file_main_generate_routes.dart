String fileMainTemplateGenerateRoutes = """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:{{file-name}}/routes/routes.dart';


void main() {  
  runApp(
    MultiProvider(
      providers: [
       
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generatedRoute,
    );
  }
}

""";
String fileMainTemplateGenerateRoutesFluent = """
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:{{file-name}}/routes/routes.dart';
import 'package:breadcrumb_fluent_ui/breadcrumb.dart';


void main() {  
  BreadcrumController.instance.settings(Routes.generatedRoute);
  runApp(
    MultiProvider(
      providers: [
       
      ],
      child: const MyApp(),
    ),
  );
  doWhenWindowReady(() {
    const initialSize = Size(1200, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(),
      initialRoute: Routes.base,
      onGenerateRoute: Routes.generatedRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

""";
