import 'package:flutter/material.dart';
import 'package:projeto_escola/core/escola_ds.dart';



class EscolaInput extends StatelessWidget {
  const EscolaInput({
    super.key,
    required this.rotulo,
    required this.dica,
    required this.controller,
    this.ocultarTexto = false,
    this.teclado = TextInputType.text,
    this.acaoTeclado = TextInputAction.next,
    this.aoEnviar,
  });

  final String rotulo;
  final String dica;
  final TextEditingController controller;
  final bool ocultarTexto;
  final TextInputType teclado;
  final TextInputAction acaoTeclado;
  final ValueChanged<String>? aoEnviar;

  OutlineInputBorder _borda(Color cor, double espessura) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(EscolaDS.raioCampo),
      borderSide: BorderSide(color: cor, width: espessura),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExcludeSemantics(child: Text(rotulo, style: EscolaDS.rotulo)),
        const SizedBox(height: 5),
        Semantics(
          label: rotulo,
          child: TextField(
            controller: controller,
            obscureText: ocultarTexto,
            obscuringCharacter: '•',
            autocorrect: false,
            enableSuggestions: !ocultarTexto,
            keyboardType: teclado,
            textInputAction: acaoTeclado,
            onSubmitted: aoEnviar,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            style: EscolaDS.corpo,
            cursorColor: EscolaDS.azul,
            decoration: InputDecoration(
              hintText: dica,
              hintStyle: EscolaDS.corpo,
              filled: true,
              fillColor: EscolaDS.campo,
              isDense: true,
              contentPadding: const EdgeInsets.all(12),
              // O próprio TextField acompanha o foco real.
              enabledBorder: _borda(EscolaDS.borda, 1),
              focusedBorder: _borda(EscolaDS.azul, 1),
            ),
          ),
        ),
      ],
    );
  }
}
