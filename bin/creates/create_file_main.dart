import 'dart:io';

import 'package:dart_style/dart_style.dart';

import '../../templates/file_main_generate_routes.dart';
import '../../utils/to_upp_case.dart';
import '../enum/enum_design_system.dart';

enum TypesOnStateManeger { provider }

class CreateFileMain {
  static var directory = Directory('lib/');

  static final String _pathFileMain = "lib/main.dart";

  static Future<void> create({
    required String name,
    required String namePackage,
    required DesignSystem designSystem,
  }) async {
    bool isExist = await directory.exists();
    if (!isExist) return;
    final list = directory.listSync(recursive: true, followLinks: false);

    bool contains = list.any(
      (element) => element.path == _pathFileMain,
    );

    if (contains) {
      await _addProvider(name: name, namePackage: namePackage);
    } else {
      switch (designSystem) {
        case DesignSystem.material:
          await _createFileMainMaterial(nameProject: namePackage);
          break;
        case DesignSystem.fluente:
          await _createFileMainFluente(
            nameProject: namePackage,
          );
          break;
        default:
      }

      await _addProvider(name: name, namePackage: namePackage);
    }
  }

  static Future<void> _createFileMainMaterial({
    required String nameProject,
  }) async {
    fileMainTemplateGenerateRoutes =
        fileMainTemplateGenerateRoutes.replaceAll('{{file-name}}', nameProject);
    await File(
      './lib/main.dart',
    ).writeAsString(fileMainTemplateGenerateRoutes);
  }

  static Future<void> _createFileMainFluente({
    required String nameProject,
  }) async {
    fileMainTemplateGenerateRoutesFluent = fileMainTemplateGenerateRoutesFluent
        .replaceAll('{{file-name}}', nameProject);
    await File(
      './lib/main.dart',
    ).writeAsString(fileMainTemplateGenerateRoutesFluent);
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
        "import 'package:$namePackage/features/$name/presentation/controller/${name}_controller.dart';"
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
