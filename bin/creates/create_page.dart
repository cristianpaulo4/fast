import 'dart:io';

import '../../templates/page.dart';
import '../../utils/clean_architecture.dart';
import '../../utils/to_upp_case.dart';

class CreatePage {
  static Future<void> createPage({required String name}) async {
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
}
