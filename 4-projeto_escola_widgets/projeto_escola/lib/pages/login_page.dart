import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';

import '../widgets/escola_botao.dart';
import '../widgets/escola_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _senha = TextEditingController();

  bool get _podeEntrar =>
      _email.text.trim().isNotEmpty && _senha.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _email.addListener(_atualizar);
    _senha.addListener(_atualizar);
  }

  void _atualizar() => setState(() {});

  void _entrar() {
    // A mesma regra vale para o botão e para a tecla concluir.
    if (!_podeEntrar) return;
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(
            'Formulário preenchido. Integração com a API em uma próxima aula.',
          ),
        ),
      );
  }

  @override
  void dispose() {
    _email.removeListener(_atualizar);
    _senha.removeListener(_atualizar);
    _email.dispose();
    _senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EscolaDS.fundo,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 30,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 520),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              decoration: EscolaDS.cartao,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Acesso ao\nSistema Escolar',
                                    style: EscolaDS.titulo,
                                  ),
                                  const SizedBox(height: 24),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    decoration: EscolaDS.cartao,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        EscolaInput(
                                          rotulo: 'E-mail',
                                          dica: '',
                                          controller: _email,
                                          teclado: TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 20),
                                        EscolaInput(
                                          rotulo: 'Senha',
                                          dica: '',
                                          controller: _senha,
                                          ocultarTexto: true,
                                          acaoTeclado: TextInputAction.done,
                                          aoEnviar: (_) => _entrar(),
                                        ),
                                        const SizedBox(height: 20),
                                        EscolaBotao(
                                          texto: 'Entrar',
                                          aoPressionar: _podeEntrar
                                              ? _entrar
                                              : null,
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
                      const Spacer(),
                      Container(
                        color: EscolaDS.azulEscuro,
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Sistema Escolar\nAplicativo mobile',
                          textAlign: TextAlign.center,
                          style: EscolaDS.corpo.copyWith(
                            fontSize: 14,
                            height: 22 / 14,
                            color: EscolaDS.superficie,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
