import 'dart:io';

import '../../templates/controller.dart';
import '../../utils/to_upp_case.dart';

class CreateController {
  // criando controller
  static Future<void> createController({required String name}) async {
    controllerTemplate = controllerTemplate.replaceAll(
        '{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/presentation/controller/${name}_controller.dart',
    ).writeAsString(controllerTemplate);
  }
}
