import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import '../constants/login_constants.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = context.read<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
           appBar: AppBar(title: const Text(LoginConstants.title),),
           body: Container(),
        );
  }
}

