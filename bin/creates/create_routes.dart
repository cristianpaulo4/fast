import 'dart:io';

import 'package:dart_style/dart_style.dart';

import '../../templates/generate_routes.dart';

class CreateRoutes {
  static final String _pathRoutes = "lib/routes/routes.dart";

  static Future<void> addRoute(String name) async {
    var current = Directory('lib/routes/');

    bool isExist = await current.exists();
    if (!isExist) return;

    final list = current.listSync(recursive: true, followLinks: false);
    print(list);
    bool contains = list.any(
      (element) => element.path == _pathRoutes,
    );

    if (contains) {
      _addNewRoute(
        name: name,
        directory: current,
      );
    } else {
      _createRoutes(name: name);
    }
  }

  // criando routes
  static _createRoutes({required String name}) async {
    generateRoutesTemplate =
        generateRoutesTemplate.replaceAll('{{file-name}}', name);
    await File(
      './lib/routes/routes.dart',
    ).writeAsString(
      generateRoutesTemplate,
    );
  }

  // caso já exista o arquivo de rotar
  static Future<void> _addNewRoute({
    required String name,
    required Directory directory,
  }) async {
    final list = directory.listSync(recursive: true, followLinks: false);
    var file = list.firstWhere(
      (element) => element.path == _pathRoutes,
    ) as File;

    var fileAsLines = file.readAsLinesSync();

    // adicionando routes nas constants
    int indexAddRoutes = fileAsLines.indexWhere(
      (element) => element.contains('class Routes {'),
    );
   
    fileAsLines.insertAll(
      indexAddRoutes + 1,
      ["static const String $name = \"$name\";"],
    );

    // idendificando o index do swich
    int indexPageOnSwich = fileAsLines.indexWhere(
      (element) => element.contains('switch (routeSettings.name) {'),
    );
    print(indexPageOnSwich);

    // adicionando page no switch case
    String namePage = name.replaceFirst(name[0], name[0].toUpperCase());
    fileAsLines.insertAll(
      indexPageOnSwich + 1,
      ["case Routes.$name: return const ${namePage}Page();"],
    );

    // adicionando import
    fileAsLines.insertAll(
      0,
      [
        "import 'package:name/features/$name/presentation/pages/${name}_page.dart';"
      ],
    );

    String code = "";

    for (var element in fileAsLines) {
      code += element;
    }

    final formatter = DartFormatter();
    var dartFormatter = formatter.format(code);

    await File(
      './lib/routes/routes.dart',
    ).writeAsString(dartFormatter);
  }
}
