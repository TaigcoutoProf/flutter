import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';

import '../widgets/escola_cartao.dart';
import '../widgets/escola_pagina.dart';

/// Tela inicial exibida após o login. Não possui estado variável.
class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  // Uma lista permite gerar os textos sem repetir vários widgets manualmente.
  static const tecnologias = ['PHP', 'MySQL', 'HTML', 'CSS', 'JavaScript'];

  @override
  Widget build(BuildContext context) {
    return EscolaPagina(
      titulo: 'Sistema Escolar',
      child: EscolaCartao(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sistema Escolar', style: EscolaDS.titulo),
            const SizedBox(height: 16),
            Text('Projeto desenvolvido utilizando:', style: EscolaDS.rotulo),
            const SizedBox(height: 8),
            for (final tecnologia in tecnologias)
              // O for dentro da lista cria um Text para cada tecnologia.
              Text('•  $tecnologia', style: EscolaDS.rotulo),
            const SizedBox(height: 16),
            Text('Banco conectado com sucesso!', style: EscolaDS.rotulo),
          ],
        ),
      ),
    );
  }
}
