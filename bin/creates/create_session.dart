import 'dart:io';

import '../../templates/session/app_session.dart';
import '../../templates/session/session_model_tamplate.dart';

class CreateSession {
  static Future<void> create() async {
    _createSessionApp();
    _createSessionModel();
  }

  // criando session model
  static Future<void> _createSessionModel() async {
    await File(
      './lib/shared/session/session_model/session_model.dart',
    ).writeAsString(session_model_template);
  }

  // criando session app
  static Future<void> _createSessionApp() async {
    await File(
      './lib/shared/session/app_session.dart',
    ).writeAsString(app_session);
  }
}
