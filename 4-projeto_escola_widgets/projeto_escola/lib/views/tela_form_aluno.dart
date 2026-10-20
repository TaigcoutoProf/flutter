import 'package:flutter/material.dart';
import 'package:projeto_escola/controllers/aluno_controller.dart';
import 'package:projeto_escola/core/escola_ds.dart';
import 'package:projeto_escola/models/aluno.dart';

import '../widgets/escola_botao.dart';
import '../widgets/escola_cartao.dart';
import '../widgets/escola_input.dart';
import '../widgets/escola_pagina.dart';

/// Formulário usado para cadastrar (aluno == null) e para editar.
class TelaFormAluno extends StatefulWidget {
  const TelaFormAluno({
    super.key,
    required this.controller,
    required this.aoSalvar,
    this.aluno,
  });

  final AlunoController controller;
  final VoidCallback aoSalvar;
  final Aluno? aluno;

  @override
  State<TelaFormAluno> createState() => _TelaFormAlunoState();
}

class _TelaFormAlunoState extends State<TelaFormAluno> {
  // Um controller para cada campo permite preencher e recuperar os valores.
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final telefoneController = TextEditingController();

  // Se recebeu um aluno, o formulário está editando; se recebeu null, cadastrando.
  bool get editando => widget.aluno != null;

  // O botão permanece desabilitado enquanto algum campo estiver vazio.
  bool get podeSalvar =>
      nomeController.text.trim().isNotEmpty &&
      cpfController.text.trim().isNotEmpty &&
      telefoneController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    // Na edição, inicia os campos com os dados atuais do aluno.
    final aluno = widget.aluno;
    if (aluno != null) {
      nomeController.text = aluno.nome;
      cpfController.text = aluno.cpf;
      telefoneController.text = aluno.telefone;
    }
  }

  void salvar() {
    // trim remove espaços extras no começo e no fim dos textos.
    final nome = nomeController.text.trim();
    final cpf = cpfController.text.trim();
    final telefone = telefoneController.text.trim();
    final aluno = widget.aluno;

    if (aluno == null) {
      // Sem aluno recebido, cria um novo cadastro.
      final cadastrou = widget.controller.cadastrar(nome, cpf, telefone);
      if (!cadastrou) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Já existe um aluno com esse CPF.')),
        );
        return;
      }
    } else {
      // Com aluno recebido, altera o objeto existente.
      widget.controller.editar(aluno, nome, telefone);
    }

    // Atualiza a listagem e retorna para a tela anterior.
    widget.aoSalvar();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // Controllers devem ser descartados junto com a tela.
    nomeController.dispose();
    cpfController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EscolaPagina(
      titulo: 'Alunos',
      comMenu: false,
      child: EscolaCartao(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              editando ? 'Editar Aluno' : 'Cadastrar Novo Aluno',
              style: EscolaDS.titulo,
            ),
            const SizedBox(height: 24),
            EscolaInput(
              rotulo: 'Nome',
              controller: nomeController,
              aoMudar: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            EscolaInput(
              rotulo: 'CPF',
              controller: cpfController,
              habilitado: !editando, // o CPF não muda depois de cadastrado
              teclado: TextInputType.number,
              aoMudar: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            EscolaInput(
              rotulo: 'Telefone',
              controller: telefoneController,
              teclado: TextInputType.phone,
              aoMudar: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            EscolaBotao(
              texto: editando ? 'Salvar alterações' : 'Cadastrar',
              aoPressionar: podeSalvar ? salvar : null,
            ),
          ],
        ),
      ),
    );
  }
}
