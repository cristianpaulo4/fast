import 'dart:io';

import '../../templates/page.dart';
import '../../utils/clean_architecture.dart';
import '../../utils/to_upp_case.dart';
import '../enum/enum_design_system.dart';

class CreatePage {
  static Future<void> createPage({
    required String name,
    required DesignSystem designSystem,
    required bool isBasePage,
  }) async {
    if (isBasePage) {
      _createPageBaseFluente(name: name);
      return;
    }

    if (designSystem == DesignSystem.fluente) {
      _createPageFluente(name: name);
    } else {
      _createPageMaterial(name: name);
    }
  }

  static Future<void> _createPageMaterial({required String name}) async {
    pageTemplate = pageTemplate
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.create(name: name)) {
      Directory(item).createSync(recursive: true);
    }

    await File(
      './lib/features/$name/presentation/pages/${name}_page.dart',
    ).writeAsString(pageTemplate);
  }

  static Future<void> _createPageFluente({required String name}) async {
    pageTemplateFluente = pageTemplateFluente
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.create(name: name)) {
      Directory(item).createSync(recursive: true);
    }

    await File(
      './lib/features/$name/presentation/pages/${name}_page.dart',
    ).writeAsString(pageTemplateFluente);
  }

  static Future<void> _createPageBaseFluente({required String name}) async {
    pageBaseTemplateFluente = pageBaseTemplateFluente
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.create(name: name)) {
      Directory(item).createSync(recursive: true);
    }

    await File(
      './lib/features/$name/presentation/pages/${name}_page.dart',
    ).writeAsString(pageBaseTemplateFluente);
  }
}
