String app_session = """
import 'session_model/session_model.dart';

class AppSession {
  static AppSession? _instance;
  // Avoid self isntance
  AppSession._();

  static AppSession get instance {
    _instance ??= AppSession._();
    return _instance!;
  }

  Future<bool> save({required SessionModel sessionModel}) async {
    // aplicar regra de negocio
    return true;
  }

  Future<SessionModel> get() async {
     // aplicar regra de negocio
    SessionModel sessionModel = SessionModel();
   
    return sessionModel;
  }

  Future<bool> destroy() async {
    // aplicar regra de negocio
    return true;
  }

  Future<bool> isLogged() async {
    // aplicar regra de negocio
    return true;
  }
}

""";