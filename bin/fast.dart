import 'package:args/args.dart';
import 'dart:io';

import 'package:interact/interact.dart';
import 'fast_modulo.dart';

enum opcoes { Novo_Projeto, Modulo }

void main(List<String> arguments) {
  final languages = [opcoes.Novo_Projeto.name, opcoes.Modulo.name];
  final selection = Select(
    prompt: 'Fast CLI - Selecione uma opção.',
    options: languages,
  ).interact();

  switch (languages[selection]) {
    case "Novo_Projeto":
      FastModulo().createNew();
      break;
    default:
      FastModulo.initModulo();
  }
}
