import 'package:projeto_escola/models/aluno.dart';

class AlunoController {
  // Por enquanto os dados ficam na memória.
  // Mais para frente eles virão de um banco de dados ou de uma API.
  final List<Aluno> alunos = [
    Aluno(2, 'Maria Clara', '222.222.222-22', '(11)97777-2222'),
    Aluno(3, 'André Silva', '123.456.789-09', '123456789'),
    Aluno(4, 'Tainá Couto', '123.456.098-09', '(12)345678654'),
  ];

  List<Aluno> listar() {
    return alunos;
  }

  /// Retorna true se cadastrou e false se o CPF já existe.
  bool cadastrar(String nome, String cpf, String telefone) {
    for (final aluno in alunos) {
      if (aluno.cpf == cpf) {
        return false;
      }
    }

    int id = 1;
    if (alunos.isNotEmpty) {
      id = alunos.last.id + 1;
    }

    alunos.add(Aluno(id, nome, cpf, telefone));
    return true;
  }

  // O CPF não entra aqui: ele é final no Model e não pode mudar.
  void editar(Aluno aluno, String nome, String telefone) {
    aluno.nome = nome;
    aluno.telefone = telefone;
  }

  void excluir(Aluno aluno) {
    alunos.remove(aluno);
  }
}
