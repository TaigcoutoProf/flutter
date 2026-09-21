import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuprojeto/services/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Gerador de números aleatórios",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight(700),
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
            margin:EdgeInsets.symmetric(horizontal: 20,vertical: 0),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(10),
              boxShadow: [BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 8,
                offset: Offset(0, 5)
              )],
              borderRadius: BorderRadius.circular(20)
              ),
              
            child: Column(
              children: [
                Text("Número de cliques:",
                    style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.indigo,
                    ),
                  ),
                
            Center(
              child: Text(
                quantidadeCliques.toString(),
                style: GoogleFonts.inter(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.indigo,
                ),
              ),
            ),
              ],
            ),
          ),
          Column(
            children: [
              Center(
                child: Text(
                  "Número gerado:",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.indigo,
                  ),
                ),
              ),
          Center(
            child: Text(
              numeroGerado.toString(),
              style: GoogleFonts.inter(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: Colors.indigo,
              ),
            ),
          ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sync),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques + 1;
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(
              20,
            );
          });
        },
      ),
    );
  }
}
