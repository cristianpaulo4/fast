import 'dart:ffi';
import 'dart:io';

import 'package:interact/interact.dart';

import '../utils/directory_utils.dart';
import '../utils/validate_utils.dart';
import '../utils/clean_architecture.dart';
import '../utils/to_upp_case.dart';


class FastModulo {
  static void init() async {
    String? nameModulo;
    print("Digite o nome do modulo:");

    nameModulo = Input(
      prompt: 'Nome do modulo ex: login, home...',
      validator: ValidateUtils.emptyValidate,
    ).interact();
    await createFile(name: nameModulo);
  }

  /// criar arquivos
  static createFile({required String name}) async {
    await _createPage(name: name);
    await _createController(name: name);
    await _createConstants(name: name);
    await _createRepository(name: name);
    await _createServices(name: name);
  }

  static _createPage({required String name}) async {
    final page = File(
      '${DirectoryUtils.getPathScritp()}templates/page.txt',
    );

    String pageTemplate = await page.readAsString();    
    pageTemplate = pageTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name)).replaceAll('{{file-name}}', name);

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
    final controller = File(
      '${DirectoryUtils.getPathScritp()}templates/controller.txt',
    );

    String controllerTemplate = await controller.readAsString();    
    controllerTemplate = controllerTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    
    await File(
      './lib/features/$name/presentation/controller/${name}_controller.dart',
    ).writeAsString(controllerTemplate);  
  }

  // criando constants
  static _createConstants({required String name}) async {
    final constants = File(
      '${DirectoryUtils.getPathScritp()}templates/constants.txt',
    );

    String constantsTemplate = await constants.readAsString();    
    constantsTemplate = constantsTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    
    await File(
      './lib/features/$name/presentation/constants/${name}_constants.dart',
    ).writeAsString(constantsTemplate);  
  }

  // criando repository
  static _createRepository({required String name}) async {
    final repository = File(
      '${DirectoryUtils.getPathScritp()}templates/repository/repository.txt',
    );   

    String repositoryTemplate = await repository.readAsString();    
    repositoryTemplate = repositoryTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    
    await File(
      './lib/features/$name/domain/repositories/${name}_repository.dart',
    ).writeAsString(repositoryTemplate);  
    
    // criando a implementação
     final repositoryImpl = File(
      '${DirectoryUtils.getPathScritp()}templates/repository/repository_impl.txt',      
    );

    String repositoryImplTemplate = await repositoryImpl.readAsString();    
    repositoryImplTemplate = repositoryImplTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name)).replaceAll('{{file-name}}', name);

    await File(
      './lib/features/$name/data/repositories/${name}_impl_repository.dart',
    ).writeAsString(repositoryImplTemplate);  
  }

  // criando services
  static _createServices({required String name}) async {
    final services = File(
      '${DirectoryUtils.getPathScritp()}templates/services/services.txt',
    );   

    String servicesTemplate = await services.readAsString();    
    servicesTemplate = servicesTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name));
    
    await File(
      './lib/features/$name/domain/services/${name}_services.dart',
    ).writeAsString(servicesTemplate);  
    
    // criando a implementação
     final servicesImpl = File(
      '${DirectoryUtils.getPathScritp()}templates/services/services_impl.txt',      
    );

    String servicesImplTemplate = await servicesImpl.readAsString();    
    servicesImplTemplate = servicesImplTemplate.replaceAll('{{class-name}}', ToUppCase.convert(name)).replaceAll('{{file-name}}', name);

    await File(
      './lib/features/$name/data/services/${name}_impl_services.dart',
    ).writeAsString(servicesImplTemplate);  
  }
}
