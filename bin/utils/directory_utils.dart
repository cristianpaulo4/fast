import 'dart:io';

import 'package:path/path.dart' as path;

class DirectoryUtils {
  static String getPathScritp() {
    return path
        .dirname(Platform.script.toString())
        .split('.')
        .first
        .replaceAll("file:///", "")
        .replaceAll("%20", " ");
  }

  static List<String> listModules() {
    final modules = Directory(
      '.${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules',
    ).listSync();

    return modules.map<String>((element) {
      return element.path.split(Platform.pathSeparator).last;
    }).toList();
  }
}
