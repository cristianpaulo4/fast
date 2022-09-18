
import 'dart:io';

import '../../templates/constants_value.dart';
import '../../utils/to_upp_case.dart';

class CreateValues {
  // criando constants
  static Future<void> createConstantsValues({required String name}) async {
    constantsValueTemplate = constantsValueTemplate.replaceAll(
        '{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/presentation/constants/${name}_values.dart',
    ).writeAsString(constantsValueTemplate);
  }
}