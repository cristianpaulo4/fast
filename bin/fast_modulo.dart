import 'dart:io';

import 'package:grinder/grinder.dart' as grind;
import 'package:interact/interact.dart';

import '../templates/routes.dart';
import '../templates/session/app_session.dart';
import '../templates/session/session_model_tamplate.dart';
import '../utils/clean_architecture.dart';
import '../utils/get_project_name.dart';
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

class FastModulo {
  /// iniciando modulo
  static void initModulo() async {
    String? nameModulo;
    String nameProject = await GetProjectName.getName();
    print("Digite o nome do modulo:");

    nameModulo = Input(
      prompt: 'Nome do modulo ex: login, home, cadastro_produto...',
      validator: ValidateUtils.emptyValidate,
    ).interact();
    await createModulo(name: nameModulo, nameProject: nameProject.trim());
  }

  /// iniciando em um novo projeto
  void createNew() async {
    String nameProject = await GetProjectName.getName();
    nameProject = nameProject.trim();

    grind.run('flutter pub add provider');
    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.createInNewProject(name: 'home')) {
      Directory(item).createSync(recursive: true);
    }
    createModulo(name: "home", nameProject: nameProject);
    _createSessionApp();
    _createSessionModel();
  }

  /// criar arquivos
  static createModulo({
    required String name,
    required String nameProject,
  }) async {
    await CreatePage.createPage(name: name);
    await CreateController.createController(name: name);
    await CreateConstants.createConstants(name: name);
    await CreateValues.createConstantsValues(name: name);
    await CreateRepository.createRepository(name: name);
    await CreateServices.createServices(name: name);
    await CreateFactory.createFactory(name: name);
    await CreateRoutes.addRoute(name: name, nameProject: nameProject);
    await CreateFileMain.create(name: name, namePackage: nameProject);
  }

  // criando routes
  static _createRoutes({required String name}) async {
    routesTemplate = routesTemplate.replaceAll('{{file-name}}', name);
    await File(
      './lib/routes/routes.dart',
    ).writeAsString(routesTemplate);
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
