import 'package:interact/interact.dart';

import '../utils/remove_native_bar_windows.dart';
import 'enum/enum_design_system.dart';
import 'fast_modulo.dart';

enum Opcoes { novoProjeto, modulo }

enum OpcoesDesigner { material, fluent }

void main(List<String> arguments) {
  final listModos = Opcoes.values.map((e) => e.name).toList();
  final listDesigner = OpcoesDesigner.values.map((e) => e.name).toList();

  final selectionDesigner = Select(
    prompt: 'Fast CLI - Selecione um Designer System',
    options: listDesigner,
  ).interact();

  final selection = Select(
    prompt: 'Fast CLI - Selecione uma opção.',
    options: listModos,
  ).interact();

  if (listDesigner[selectionDesigner] == OpcoesDesigner.material.name) {
    if (listModos[selection] == Opcoes.modulo.name) {
      FastModulo.initModulo(designSystem: DesignSystem.material);
    } else {
      FastModulo.createNewProject(designSystem: DesignSystem.material);
    }
  } else {
    if (listModos[selection] == Opcoes.modulo.name) {
      FastModulo.initModulo(designSystem: DesignSystem.fluente);
    } else {
      FastModulo.createNewProject(designSystem: DesignSystem.fluente);
      RemoveNativeBarWindows.update();
    }
  }
}
