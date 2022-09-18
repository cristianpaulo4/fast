import 'dart:io';

import '../../templates/factory.dart';
import '../../utils/to_upp_case.dart';

class CreateFactory {
  static createFactory({required String name}) async {
    factoryTemplate = factoryTemplate
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    await File(
      './lib/factory/${name}_factory.dart',
    ).writeAsString(factoryTemplate);
  }
}
