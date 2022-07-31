import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import '../constants/home_constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    controller = context.read<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
           appBar: AppBar(title: const Text(HomeConstants.title),),
           body: Container(),
        );
  }
}

