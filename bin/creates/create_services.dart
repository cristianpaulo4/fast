
import 'dart:io';

import '../../templates/services/services.dart';
import '../../templates/services/services_impl.dart';
import '../../utils/to_upp_case.dart';

class CreateServices {
  
 
  static Future<void> createServices({required String name}) async {
    servicesTemplate =
        servicesTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/domain/services/${name}_services.dart',
    ).writeAsString(servicesTemplate);

    servicesImplTemplate = servicesImplTemplate
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);

    await File(
      './lib/features/$name/data/services/${name}_impl_services.dart',
    ).writeAsString(servicesImplTemplate);
  }
}