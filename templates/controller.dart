String controllerTemplate = """
import 'package:flutter/foundation.dart';

class {{class-name}}Controller extends ChangeNotifier {
  bool isProgress = false;

  void update() {
    notifyListeners();
  }  

  void startProgress(){
    isProgress = true;
    update();  
  }

  void stopProgress(){
    isProgress = false;
    update();  
  }
  
}
""";