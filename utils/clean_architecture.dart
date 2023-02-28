class CleanArchitecture {
  static List<String> create({required String name}) {
    /// camada de data
    String data = "./lib/features/$name/data";
    String datasources = "./lib/features/$name/data/datasources";
    String repositories = "./lib/features/$name/data/repositories";
    String services = "./lib/features/$name/data/services";
    String model = "./lib/features/$name/data/model";

    /// camada de domain
    String domain = "./lib/features/$name/domain";
    String datasourcesDomain = "./lib/features/$name/domain/datasources";
    String repositoriesDomain = "./lib/features/$name/domain/repositories";
    String servicesDomain = "./lib/features/$name/domain/services";
    String usecase = "./lib/features/$name/domain/usecases";

    /// camada de apresentação
    String presentation = "./lib/features/$name/presentation";
    String constants = "./lib/features/$name/presentation/constants";
    String controller = "./lib/features/$name/presentation/controller";
    String page = "./lib/features/$name/presentation/pages";
    String widgets = "./lib/features/$name/presentation/widgets";

    String utils = "./lib/features/$name/utils";

    //factory
    String factory = "./lib/factory";

    //core
    String coreEntities = "./lib/core/entities";
    String coreInfra = "./lib/core/infra";

    return [
      data,
      repositories,
      services,
      domain,
      repositoriesDomain,
      usecase,
      presentation,
      constants,
      controller,
      page,
      widgets,
      utils,
      servicesDomain,
      factory,
      model,
      coreEntities,
      coreInfra,
    ];
  }

  static List<String> createInNewProject() {
    //shared
    String shared = "./lib/shared";
    //shared
    String sharedConstants = "./lib/shared/constants";
    //shared
    String sharedWidgets = "./lib/shared/widgets";
    //shared
    String sharedSection = "./lib/shared/session";
    // routes
    String routes = "./lib/routes";

    return [
      routes,
      shared,
      sharedConstants,
      sharedWidgets,
      sharedSection,
    ];
  }
}
