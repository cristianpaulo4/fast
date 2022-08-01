String controllerTemplate = """
import 'package:flutter/foundation.dart';

class {{class-name}}Controller extends ChangeNotifier {

  void update() {
    notifyListeners();
  }  
}
""";