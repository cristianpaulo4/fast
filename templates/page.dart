String pageTemplate = """
import 'package:flutter/material.dart';
import '../controller/{{file-name}}_controller.dart';
import '../constants/{{file-name}}_constants.dart';
import 'package:provider/provider.dart';


class {{class-name}}Page extends StatefulWidget {
  const {{class-name}}Page({Key? key}) : super(key: key);

  @override
  State<{{class-name}}Page> createState() => _{{class-name}}PageState();
}

class _{{class-name}}PageState extends State<{{class-name}}Page> {
  late {{class-name}}Controller controller;

  @override
  void initState() {
    controller = context.read<{{class-name}}Controller>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
    super.initState();
  }

  void _init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text({{class-name}}Constants.title),
      ),
      body: Container(),
    );
  }
}
""";
