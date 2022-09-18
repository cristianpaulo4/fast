import 'dart:io';

class GetProjectName {
 static Future<String> getName() async {
    final name = File(
      'pubspec.yaml',
    );
    String file = await name.readAsString();
    final list = file.split("\n");
    final namePubspec = list.first.split(":")[1];
    return namePubspec;
  }
}
