import 'dart:io';

import '../../templates/session/app_session.dart';

class CreateSession {
  static Future<void> create() async {
    _createSessionApp();
  }

  // criando session app
  static Future<void> _createSessionApp() async {
    await File(
      './lib/shared/session/app_session.dart',
    ).writeAsString(app_session);
  }
}
