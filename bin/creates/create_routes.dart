import 'dart:io';

import 'package:dart_style/dart_style.dart';

import '../../templates/generate_routes.dart';
import '../../utils/to_upp_case.dart';

class CreateRoutes {
  static final String _pathRoutes = "lib/routes/routes.dart";

  static Future<void> addRoute({
    required String name,
    required String nameProject,
  }) async {
    var current = Directory('lib/routes/');

    bool isExist = await current.exists();
    if (!isExist) return;

    final list = current.listSync(recursive: true, followLinks: false);  
    bool contains = list.any(
      (element) => element.path == _pathRoutes,
    );

    if (!contains) {
      await _createRoutes(name: nameProject);
    }

    await _addNewRoute(
      name: name,
      directory: current,
      nameProject: nameProject,
    );
  }

  // criando routes
  static Future<void> _createRoutes({required String name}) async {
    generateRoutesTemplate = generateRoutesTemplate.replaceAll(
      '{{file-name}}',
      name,
    );
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
    required String nameProject,
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
  

    // adicionando page no switch case
    String namePage = ToUppCase.convert(name);
    fileAsLines.insertAll(
      indexPageOnSwich + 1,
      ["case Routes.$name: return const ${namePage}Page();"],
    );

    // adicionando import
    fileAsLines.insertAll(
      0,
      [
        "import 'package:$nameProject/features/$name/presentation/pages/${name}_page.dart';"
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
