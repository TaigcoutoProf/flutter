import 'package:flutter/material.dart';
import 'package:projeto_escola/controllers/aluno_controller.dart';
import 'package:projeto_escola/core/escola_ds.dart';
import 'package:projeto_escola/models/aluno.dart';

import '../widgets/escola_botao.dart';
import '../widgets/escola_cartao.dart';
import '../widgets/escola_link.dart';
import '../widgets/escola_pagina.dart';
import '../widgets/escola_tabela.dart';
import 'tela_form_aluno.dart';

/// Tela de listagem. É Stateful porque a tabela muda após cadastrar ou excluir.
class TelaAlunos extends StatefulWidget {
  const TelaAlunos({super.key});

  @override
  State<TelaAlunos> createState() => _TelaAlunosState();
}

class _TelaAlunosState extends State<TelaAlunos> {
  // Mantém os dados e as operações disponíveis para esta tela.
  final controller = AlunoController();

  // Sem aluno: tela de cadastro. Com aluno: tela de edição.
  void abrirForm({Aluno? aluno}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TelaFormAluno(
          controller: controller,
          aluno: aluno,
          aoSalvar: () => setState(() {}), // atualiza a tabela ao voltar
        ),
      ),
    );
  }

  void confirmarExclusao(Aluno aluno) {
    // Exibe uma janela modal para evitar exclusões acidentais.
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Excluir aluno'),
        content: Text('Deseja excluir ${aluno.nome}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              controller.excluir(aluno);
              // Informa ao Flutter que a lista mudou e a tabela deve ser refeita.
              setState(() {});
              Navigator.pop(dialogContext);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtém os dados antes de transformá-los em linhas da tabela.
    final alunos = controller.listar();

    return EscolaPagina(
      titulo: 'Alunos',
      child: EscolaCartao(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lista de Alunos', style: EscolaDS.titulo),
            const SizedBox(height: 16),
            EscolaBotao(
              texto: 'Cadastrar Novo Aluno',
              cor: EscolaDS.verde,
              aoPressionar: () => abrirForm(),
            ),
            const SizedBox(height: 24),
            EscolaTabela(
              colunas: const ['ID', 'Nome', 'CPF', 'Telefone'],
              linhas: [
                // Converte cada objeto Aluno em uma lista de textos.
                for (final aluno in alunos)
                  ['${aluno.id}', aluno.nome, aluno.cpf, aluno.telefone],
              ],
              acoes: [
                for (final aluno in alunos)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EscolaLink(
                        texto: 'Editar',
                        aoPressionar: () => abrirForm(aluno: aluno),
                      ),
                      EscolaLink(
                        texto: 'Excluir',
                        cor: EscolaDS.vermelho,
                        aoPressionar: () => confirmarExclusao(aluno),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
