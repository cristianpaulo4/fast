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
import 'package:fluent_ui/fluent_ui.dart';
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
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(),
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generatedRoute,
    );
  }
}

""";
