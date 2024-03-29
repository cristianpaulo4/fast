import 'dart:io';

import 'package:grinder/grinder.dart' as grind;
import 'package:interact/interact.dart';

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
import 'creates/create_session.dart';
import 'creates/create_values.dart';
import 'enum/enum_design_system.dart';

class FastModulo {
  /// iniciando modulo
  static void initModulo(
      {required DesignSystem designSystem, bool firtModulo = false}) async {
    String? nameModulo;
    String nameProject = await GetProjectName.getName();
    if (!firtModulo) {
      print("Digite o nome do modulo:");
      nameModulo = Input(
        prompt: 'Nome do modulo ex: login, home, cadastro_produto...',
        validator: ValidateUtils.emptyValidate,
      ).interact();
    } else {
      nameModulo = "home";
    }

    await createModulo(
      name: nameModulo,
      nameProject: nameProject.trim(),
      designSystem: designSystem,
      isBasePage: false,
    );
  }

  /// iniciando em um novo projeto
  static void createNewProject({required DesignSystem designSystem}) async {
    String nameProject = await GetProjectName.getName();
    nameProject = nameProject.trim();

    // deletar arquivos base
    File('lib/main.dart').delete();

    // criando estrutura clean arquiteture
    for (var item in CleanArchitecture.createInNewProject()) {
      Directory(item).createSync(recursive: true);
    }

    if (designSystem == DesignSystem.fluente) {
      await createModulo(
        name: 'base',
        nameProject: nameProject,
        designSystem: designSystem,
        isBasePage: true,
      );
    } else {
      await createModulo(
        name: 'home',
        nameProject: nameProject,
        designSystem: designSystem,
      );
    }
    print("⏰ Adicionando dependencias");
    if (designSystem == DesignSystem.fluente) {
      grind.run(
        'flutter pub add fluent_ui bitsdojo_window provider breadcrumb_fluent_ui',
      );
    } else {
      grind.run('flutter pub add provider');
    }
    print("✅ Finalizado");

    await CreateSession.create();
  }

  /// criar arquivos
  static Future<void> createModulo({
    required String name,
    required String nameProject,
    required DesignSystem designSystem,
    bool isBasePage = false,
  }) async {
    await CreatePage.createPage(
      name: name,
      designSystem: designSystem,
      isBasePage: isBasePage,
    );

    await CreateController.createController(name: name);
    await CreateConstants.createConstants(name: name);
    await CreateValues.createConstantsValues(name: name);
    await CreateRepository.createRepository(name: name);
    await CreateServices.createServices(name: name);
    await CreateFactory.createFactory(name: name);
    await CreateRoutes.addRoute(name: name, nameProject: nameProject);
    await CreateFileMain.create(
      name: name,
      namePackage: nameProject,
      designSystem: designSystem,
    );
    print("✅ Criando modulo $name");
  }
}
