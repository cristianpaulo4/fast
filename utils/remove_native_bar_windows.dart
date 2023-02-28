import 'dart:io';

abstract class RemoveNativeBarWindows {
  static update() async {
    final file = File(
      'windows/runner/main.cpp',
    );

    var fileAsLines = file.readAsLinesSync();

    int indexProvider = fileAsLines.indexWhere(
      (element) => element.contains('#include "utils.h"'),
    );
    fileAsLines.insertAll(
      indexProvider + 1,
      [
        "#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>",
        "auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);"
      ],
    );

    String newFile = "";

    for (var element in fileAsLines) {
      newFile += "$element\n";
    }

    await File(
      'windows/runner/main.cpp',
    ).writeAsString(newFile);
  }
}
