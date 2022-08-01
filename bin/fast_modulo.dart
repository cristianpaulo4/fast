import 'dart:io';
import 'package:interact/interact.dart';
import '../templates/constants.dart';
import '../templates/controller.dart';
import '../templates/factory.dart';
import '../templates/file_main.dart';
import '../templates/page.dart';
import '../templates/repository/repository.dart';
import '../templates/repository/repository_impl.dart';
import '../templates/routes.dart';
import '../templates/services/services.dart';
import '../templates/services/services_impl.dart';
import '../utils/directory_utils.dart';
import '../utils/validate_utils.dart';
import '../utils/clean_architecture.dart';
import '../utils/to_upp_case.dart';
import 'package:grinder/grinder.dart' as grind;

class FastModulo {
  /// iniciando modulo
  static void initModulo() async {
    String? nameModulo;
    print("Digite o nome do modulo:");

    nameModulo = Input(
      prompt: 'Nome do modulo ex: login, home, cadastro_produto...',
      validator: ValidateUtils.emptyValidate,
    ).interact();
    await createFile(name: nameModulo);
  }

  /// iniciando em um novo projeto
  void createNew() async {
    String nameProject = await readNamePubspec();
    print(nameProject);
    grind.run(
      'flutter pub add provider',
    );     
    createFile(name: "home");
    _createRoutes(name: nameProject.trim());
    _createFileMain(name: nameProject.trim()); 
  }

  Future<String> readNamePubspec() async {
    final name = File(
      'pubspec.yaml',
    );
    String file = await name.readAsString();
    final list = file.split("\n");
    final namePubspec = list.first.split(":")[1];
    return namePubspec;
  }

  /// criar arquivos
  static createFile({required String name}) async {
    await _createPage(name: name);
    await _createController(name: name);
    await _createConstants(name: name);
    await _createRepository(name: name);
    await _createServices(name: name);
    await _createFactory(name: name);
  }

  static _createPage({required String name}) async {
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

  // criando controller
  static _createController({required String name}) async {
    controllerTemplate = controllerTemplate.replaceAll(
        '{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/presentation/controller/${name}_controller.dart',
    ).writeAsString(controllerTemplate);
  }

  // criando constants
  static _createConstants({required String name}) async {
    constantsTemplate =
        constantsTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    await File(
      './lib/features/$name/presentation/constants/${name}_constants.dart',
    ).writeAsString(constantsTemplate);
  }

  // criando repository
  static _createRepository({required String name}) async {
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

  // criando services
  static _createServices({required String name}) async {
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

  // criando factory
  static _createFactory({required String name}) async {
    factoryTemplate = factoryTemplate
        .replaceAll('{{class-name}}', ToUppCase.convert(name))
        .replaceAll('{{file-name}}', name);
    await File(
      './lib/factory/${name}_factory.dart',
    ).writeAsString(factoryTemplate);
  }

  // criando routes
  static _createRoutes({required String name}) async {
    routesTemplate = routesTemplate.replaceAll('{{file-name}}', name);
    await File(
      './lib/routes/routes.dart',
    ).writeAsString(routesTemplate);
  }

  // criando arquimo main
  static _createFileMain({required String name}) async {
    fileMainTemplate = fileMainTemplate.replaceAll('{{file-name}}', name);
    await File(
      './lib/main.dart',
    ).writeAsString(fileMainTemplate);
  }
}
