
import 'dart:io';

import '../../templates/repository/repository.dart';
import '../../templates/repository/repository_impl.dart';
import '../../utils/to_upp_case.dart';

class CreateRepository {
   // criando repository
  static Future<void> createRepository({required String name}) async {
    repositoryTemplate = repositoryTemplate.replaceAll(
        '{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/domain/repositories/${name}_repository.dart',
    ).writeAsString(repositoryTemplate);

    // criando a implementação
    repositoryImplTemplate = repositoryImplTemplate
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    await File(
      './lib/features/$name/data/repositories/${name}_impl_repository.dart',
    ).writeAsString(repositoryImplTemplate);
  }
}