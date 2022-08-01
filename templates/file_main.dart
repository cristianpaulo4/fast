String fileMainTemplate = """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:{{file-name}}/features/home/presentation/controller/home_controller.dart';
import 'package:{{file-name}}/routes/routes.dart';

void main() {  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
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
      routes: Routes.routes(),
    );
  }
}

""";