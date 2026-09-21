import 'package:flutter/material.dart';
import 'package:meuprojeto/services/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Gerador de números aleatórios"),
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Center(child: Text(numeroGerado.toString())),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sync),
        onPressed: () {
          setState(() {
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(20);
          });
        },
      ),
    );
  }
}