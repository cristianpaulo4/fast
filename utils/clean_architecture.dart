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
    String entities = "./lib/features/$name/domain/entities";
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
    //shared
    String shared = "./lib/shared";

    String routes = "./lib/routes";


    return [
      data,      
      repositories,
      services,
      domain,      
      entities, 
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
      shared,
      routes,
      model,
    ];
  }
}
