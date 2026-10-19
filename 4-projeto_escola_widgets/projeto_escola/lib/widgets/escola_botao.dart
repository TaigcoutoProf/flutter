import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';

class EscolaBotao extends StatelessWidget {
  const EscolaBotao({
    super.key,
    required this.texto,
    this.aoPressionar,
    this.cor = EscolaDS.azul,
  });

  final String texto;
  final VoidCallback? aoPressionar; // null = botão desabilitado
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: aoPressionar,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        foregroundColor: EscolaDS.superficie,
        disabledBackgroundColor: EscolaDS.desabilitado,
        disabledForegroundColor: EscolaDS.textoDesabilitado,
        textStyle: EscolaDS.botao,
        minimumSize: const Size(88, 48),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(EscolaDS.raioBotao),
        ),
      ),
      child: Text(texto),
    );
  }
}
