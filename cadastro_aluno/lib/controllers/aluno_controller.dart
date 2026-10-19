import 'package:cadastro_aluno/models/aluno.dart';

class AlunoController {
  Aluno? aluno;

  void cadastrar(String nome, String curso) {
    aluno = Aluno(nome, curso);
  }

  String mostrarAluno() {
    if (aluno == null) {
      return "";
    }

    return "Aluno: ${aluno!.nome}\n"
        "Curso: ${aluno!.curso}";
  }
}
