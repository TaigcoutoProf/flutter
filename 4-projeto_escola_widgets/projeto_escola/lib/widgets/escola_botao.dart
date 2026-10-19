import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';


class EscolaBotao extends StatelessWidget {
  const EscolaBotao({super.key, required this.texto, this.aoPressionar});

  final String texto;
  final VoidCallback? aoPressionar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        // null desabilita tanto o comportamento quanto a aparência.
        onPressed: aoPressionar,
        style: ElevatedButton.styleFrom(
          backgroundColor: EscolaDS.azul,
          foregroundColor: EscolaDS.superficie,
          disabledBackgroundColor: EscolaDS.desabilitado,
          disabledForegroundColor: EscolaDS.textoDesabilitado,
          textStyle: EscolaDS.botao,
          minimumSize: const Size(88, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: EscolaDS.s16,
            vertical: 14,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(EscolaDS.raioBotao),
          ),
        ),
        child: Text(texto),
      ),
    );
  }
}
