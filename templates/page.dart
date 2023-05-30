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

String pageTemplateFluente = """
import '../../../../routes/routes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import '../controller/{{file-name}}_controller.dart';
import '../constants/{{file-name}}_constants.dart';
import 'package:provider/provider.dart';
import 'package:breadcrumb_fluent_ui/breadcrumb_fluent_ui.dart';



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
    BreadcrumController.instance.add(
      BreadcrumItem(
        label: {{class-name}}Constants.title,
        router: Routes.{{file-name}},
      ),
    );
    super.initState();
  }

  void _init() {}

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage();
  }
}
""";

String pageBaseTemplateFluente = """
import 'package:fluent_ui/fluent_ui.dart';
import '../../../../routes/routes.dart';
import '../controller/{{file-name}}_controller.dart';
import '../constants/{{file-name}}_constants.dart';
import 'package:provider/provider.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:breadcrumb_fluent_ui/breadcrumb.dart';

class {{class-name}}Page extends StatefulWidget {
  const {{class-name}}Page({Key? key}) : super(key: key);

  @override
  State<{{class-name}}Page> createState() => _{{class-name}}PageState();
}

class _{{class-name}}PageState extends State<{{class-name}}Page> {
  late {{class-name}}Controller controller;
  int topIndex = 0;

  @override
  void initState() {
    controller = context.read<{{class-name}}Controller>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
    super.initState();
  }

  void _init() {}

   List<NavigationPaneItem> get originalItems => [ 
        /*PaneItem(
          icon: const Icon(FluentIcons.badge),
          title: const Text('Page Home'),
          body: const BreadcrumContentBody(
            initialRoute: Routes.home, 
          ),
        ),*/
      ];
  

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: const Text("Base"),
        actions: WindowTitleBarBox(
          child: Row(
            children: [Expanded(child: MoveWindow()), const WindowButtons()],
          ),
        ),
      ),

      pane: NavigationPane(        
          selected: topIndex,
          size: const NavigationPaneSize(openMaxWidth: 230),
          indicator: const EndNavigationIndicator(),
          onChanged: (index) => setState(() => topIndex = index),
          header: PageHeader(
            title: Text("Base"),
          ),
          items: originalItems,        
        ),


    );
  }
}


final buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFF805306),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFF805306),
  iconMouseOver: const Color(0xFF805306),
  iconMouseDown: const Color(0xFFFFD500),
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: const Color(0xFF805306),
  iconMouseOver: Colors.white,
);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
""";
