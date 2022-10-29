import 'package:interact/interact.dart';

import 'fast_modulo.dart';

enum opcoes { Novo_Projeto, Modulo }

void main(List<String> arguments) {
  final listModos = opcoes.values.map((e) => e.name).toList();
  final selection = Select(
    prompt: 'Fast CLI - Selecione uma opção.',
    options: listModos,
  ).interact();

  switch (listModos[selection]) {
    case "Novo_Projeto":
      FastModulo().createNew();
      break;
    default:
      FastModulo.initModulo();
  }
}
