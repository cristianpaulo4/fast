String app_session = """


class AppSession {
  static AppSession? _instance;
  // Avoid self isntance
  AppSession._();

  static AppSession get instance {
    _instance ??= AppSession._();
    return _instance!;
  }

  Future<bool> save() async {
    // aplicar regra de negocio
    return true;
  }

  get() async {
     // aplicar regra de negocio   
    return null;
  }

  Future<bool> destroy() async {
    // aplicar regra de negocio
    return true;
  }
 
}

""";
