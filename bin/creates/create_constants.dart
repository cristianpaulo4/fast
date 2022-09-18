
import 'dart:io';

import '../../templates/constants.dart';
import '../../utils/to_upp_case.dart';

class CreateConstants {
  // criando constants
  static Future<void> createConstants({required String name}) async {
    constantsTemplate =
        constantsTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/presentation/constants/${name}_constants.dart',
    ).writeAsString(constantsTemplate);
  }
}