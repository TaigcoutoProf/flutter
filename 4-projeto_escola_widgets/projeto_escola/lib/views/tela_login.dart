import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';

import '../widgets/escola_botao.dart';
import '../widgets/escola_cartao.dart';
import '../widgets/escola_input.dart';
import '../widgets/escola_rodape.dart';
import 'tela_home.dart';

/// Tela inicial. Usa estado porque o botão depende do conteúdo dos campos.
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  // Controllers permitem acessar os textos digitados.
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  // Getter calculado: só permite entrar quando os dois campos têm conteúdo.
  bool get podeEntrar =>
      emailController.text.trim().isNotEmpty &&
      senhaController.text.isNotEmpty;

  void entrar() {
    // Abre a Home e retira o Login da pilha de navegação.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const TelaHome()),
    );
  }

  @override
  void dispose() {
    // Libera os controllers quando a tela deixa de existir.
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EscolaDS.fundo,
      bottomNavigationBar: const EscolaRodape(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: EscolaCartao(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acesso ao\nSistema Escolar', style: EscolaDS.titulo),
                    const SizedBox(height: 24),
                    EscolaCartao(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EscolaInput(
                            rotulo: 'E-mail',
                            controller: emailController,
                            teclado: TextInputType.emailAddress,
                            // Reconstrói a tela para atualizar o estado do botão.
                            aoMudar: (_) => setState(() {}),
                          ),
                          const SizedBox(height: 20),
                          EscolaInput(
                            rotulo: 'Senha',
                            controller: senhaController,
                            ocultarTexto: true,
                            aoMudar: (_) => setState(() {}),
                          ),
                          const SizedBox(height: 20),
                          EscolaBotao(
                            texto: 'Entrar',
                            aoPressionar: podeEntrar ? entrar : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
