String controllerTemplate = """
import 'package:flutter/widgets.dart';

class {{class-name}}Controller extends ChangeNotifier {
  bool isProgress = false;

  void update() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());    
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
