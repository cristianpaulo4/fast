import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:interact/interact.dart';

import '../../templates/file_main_generate_routes.dart';
import '../../utils/to_upp_case.dart';

enum typesOnStateManeger { provider }

class CreateFileMain {
  static final String _pathFileMain = "lib/main.dart";
  static var directory = Directory('lib/');

  static Future<void> create({
    required String name,
    required String namePackage,
  }) async {
    bool isExist = await directory.exists();
    if (!isExist) return;
    final list = directory.listSync(recursive: true, followLinks: false);

    bool contains = list.any(
      (element) => element.path == _pathFileMain,
    );

    if (contains) {
      _addProvider(name: name, namePackage: namePackage);
      //_selectedStateManeger(name);
    } else {
      _createFile(name);
    }
  }

  // quando houver novas implementações
  static Future<void> _selectedStateManeger(
    String name,
    String namePackage,
  ) async {
    final stateManeger = typesOnStateManeger.values.map((e) => e.name).toList();
    final selection = Select(
      prompt: 'Escolha um modo',
      options: stateManeger,
    ).interact();

    switch (stateManeger[selection]) {
      case "provider":
        _addProvider(
          name: name,
          namePackage: namePackage,
        );
        break;
    }
  }

  static Future<void> _createFile(String name) async {
    fileMainTemplateGenerateRoutes =
        fileMainTemplateGenerateRoutes.replaceAll('{{file-name}}', name);
    await File(
      './lib/main.dart',
    ).writeAsString(fileMainTemplateGenerateRoutes);
  }

  static Future<void> _addProvider({
    required String name,
    required String namePackage,
  }) async {
    final list = directory.listSync(recursive: true, followLinks: false);
    var file = list.firstWhere(
      (element) => element.path == _pathFileMain,
    ) as File;

    var fileAsLines = file.readAsLinesSync();

    // encontrando lista de provider
    int indexProvider = fileAsLines.indexWhere(
      (element) => element.contains('providers: ['),
    );

    print(indexProvider);
    // adicionando page no switch case
    String nameProvider = ToUppCase.convert(name);

    fileAsLines.insertAll(
      indexProvider + 1,
      [
        "ChangeNotifierProvider<${nameProvider}Controller>(create: (_) => ${nameProvider}Controller(),),"
      ],
    );

    // adicionando import
    fileAsLines.insertAll(
      0,
      [
        "import 'package:$namePackage/features/$name/presentation/pages/${name}_page.dart';"
      ],
    );

    String code = "";

    for (var element in fileAsLines) {
      code += element;
    }

    final formatter = DartFormatter();
    var dartFormatter = formatter.format(code);

    await File(
      './$_pathFileMain',
    ).writeAsString(dartFormatter);
  }
}
