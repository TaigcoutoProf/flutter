import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';

import 'views/tela_login.dart';

// Ponto de entrada do aplicativo. runApp coloca o primeiro widget na tela.
void main() => runApp(const EscolaApp());

/// Widget principal: configura o tema e define a primeira tela do aplicativo.
class EscolaApp extends StatelessWidget {
  const EscolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Escola',
      // Remove a faixa "DEBUG" exibida durante o desenvolvimento.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Gera as cores do tema do Material a partir do azul do Design System.
        colorScheme: ColorScheme.fromSeed(seedColor: EscolaDS.azul),
      ),
      // A tela de login é a primeira tela apresentada ao usuário.
      home: const TelaLogin(),
    );
  }
}
