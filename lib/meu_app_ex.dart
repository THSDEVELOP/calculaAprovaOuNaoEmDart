import 'dart:io';

import 'package:meu_app_ex/exception/nome_invalido_exception.dart';
import 'package:meu_app_ex/models/Aluno.dart';
import 'package:meu_app_ex/models/console_utils.dart';

void execute() {
  print("Bem vindo a calculadora de notas!");
  String nome = ConsoleUtils.lerStringcomTexto("Digite o nome do aluno");
  var aluno = Aluno(nome);
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  double? nota;
  do {
    nota = ConsoleUtils.lerDoublecomTextoComSaida("Digite a nota do $nome ou 'S' para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);

  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do aluno ${aluno.getNome()} foi: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} foi aprovado");
  } else {
    print("O aluno ${aluno.getNome()} foi reprovado");
  }
}