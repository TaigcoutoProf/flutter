import 'package:projeto_escola/models/aluno.dart';

/// Controller: concentra as operações realizadas com os alunos.
/// A interface solicita as ações, mas não manipula a lista diretamente.
class AlunoController {
  // Por enquanto os dados ficam na memória.
  // Mais para frente eles virão de um banco de dados ou de uma API.
  final List<Aluno> alunos = [
    Aluno(2, 'Maria Clara', '222.222.222-22', '(11)97777-2222'),
    Aluno(3, 'André Silva', '123.456.789-09', '123456789'),
    Aluno(4, 'Tainá Couto', '123.456.098-09', '(12)345678654'),
  ];

  // Disponibiliza a lista para a tela montar a tabela.
  List<Aluno> listar() {
    return alunos;
  }

  /// Retorna true se cadastrou e false se o CPF já existe.
  bool cadastrar(String nome, String cpf, String telefone) {
    // Verifica se já existe um cadastro com o mesmo CPF.
    for (final aluno in alunos) {
      if (aluno.cpf == cpf) {
        return false;
      }
    }

    // O primeiro cadastro recebe ID 1; os próximos recebem o último ID + 1.
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

  // Remove da lista o mesmo objeto recebido pela tela.
  void excluir(Aluno aluno) {
    alunos.remove(aluno);
  }
}
