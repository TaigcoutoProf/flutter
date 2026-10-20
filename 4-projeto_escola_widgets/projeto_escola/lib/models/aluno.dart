/// Model: representa os dados de um aluno dentro do sistema.
class Aluno {
  // final indica que o valor não pode ser alterado depois da criação do objeto.
  final int id;
  final String cpf;

  // Nome e telefone não são final porque podem ser editados.
  String nome;
  String telefone;

  // Construtor posicional usado para criar um novo Aluno.
  Aluno(this.id, this.nome, this.cpf, this.telefone);
}
