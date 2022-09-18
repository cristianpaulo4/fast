import 'dart:io';

import 'package:grinder/grinder.dart' as grind;
import 'package:interact/interact.dart';

import '../templates/file_main_generate_routes.dart';
import '../templates/routes.dart';
import '../templates/session/app_session.dart';
import '../templates/session/session_model_tamplate.dart';
import '../utils/clean_architecture.dart';
import '../utils/validate_utils.dart';
import 'creates/create_constants.dart';
import 'creates/create_controller.dart';
import 'creates/create_factory.dart';
import 'creates/create_file_main.dart';
import 'creates/create_page.dart';
import 'creates/create_repository.dart';
import 'creates/create_routes.dart';
import 'creates/create_services.dart';
import 'creates/create_values.dart';
import 'enum/enum_generate_routes.dart';

class FastModulo {
  /// iniciando modulo
  static void initModulo() async {
    String? nameModulo;
    print("Digite o nome do modulo:");

    nameModulo = Input(
      prompt: 'Nome do modulo ex: login, home, cadastro_produto...',
      validator: ValidateUtils.emptyValidate,
    ).interact();
    await createModulo(name: nameModulo);
  }

  /// iniciando em um novo projeto
  void createNew() async {
    bool isGenerateRoutes = false;
    // selecionar tipo/modelo de rotas
    final routes = [
      opcoesGenerateRoutes.routes.name,
      opcoesGenerateRoutes.generateRoutes.name
    ];
    final selection = Select(
      prompt: 'Selecione o modelo de rotas',
      options: routes,
    ).interact();

    isGenerateRoutes = selection == opcoesGenerateRoutes.generateRoutes.index;

    String nameProject = await readNamePubspec();
    print(nameProject);
    grind.run('flutter pub add provider');
    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.createInNewProject(name: 'home')) {
      Directory(item).createSync(recursive: true);
    }
    createModulo(name: "home");

    if (isGenerateRoutes) {
      CreateRoutes.addRoute(nameProject.trim());
      _createFileMainWithGenerateRoutes(name: nameProject.trim());
    } else {
      _createRoutes(name: nameProject.trim());
      CreateFileMain.create(name: nameProject.trim());
    }
    _createSessionApp();
    _createSessionModel();
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
  static createModulo({required String name}) async {
    await CreatePage.createPage(name: name);
    await CreateController.createController(name: name);
    await CreateConstants.createConstants(name: name);
    await CreateValues.createConstantsValues(name: name);
    await CreateRepository.createRepository(name: name);
    await CreateServices.createServices(name: name);
    await CreateFactory.createFactory(name: name);
    await CreateRoutes.addRoute(name);
    await CreateFileMain.create(name: name);
  }

  // criando routes
  static _createRoutes({required String name}) async {
    routesTemplate = routesTemplate.replaceAll('{{file-name}}', name);
    await File(
      './lib/routes/routes.dart',
    ).writeAsString(routesTemplate);
  }

  // criando arquimo main
  static _createFileMainWithGenerateRoutes({required String name}) async {
    fileMainTemplateGenerateRoutes =
        fileMainTemplateGenerateRoutes.replaceAll('{{file-name}}', name);
    await File(
      './lib/main.dart',
    ).writeAsString(fileMainTemplateGenerateRoutes);
  }

  // criando session model
  static _createSessionModel() async {
    await File(
      './lib/shared/session/session_model/session_model.dart',
    ).writeAsString(session_model_template);
  }

  // criando session app
  static _createSessionApp() async {
    await File(
      './lib/shared/session/app_session.dart',
    ).writeAsString(app_session);
  }
}
