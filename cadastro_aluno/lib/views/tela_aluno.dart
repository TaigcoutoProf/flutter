import 'package:cadastro_aluno/controllers/aluno_controller.dart';
import 'package:flutter/material.dart';

class TelaAluno extends StatefulWidget {
  const TelaAluno({super.key});

  @override
  State<TelaAluno> createState() => _TelaAlunoState();
}

class _TelaAlunoState extends State<TelaAluno> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cursoController = TextEditingController();

  AlunoController controller = AlunoController();

  String resultado = "";

  void cadastrar() {
    controller.cadastrar(nomeController.text, cursoController.text);

    setState(() {
      resultado = controller.mostrarAluno();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de aluno"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
              controller: nomeController,
              decoration:InputDecoration(
                labelText: "Nome",
              )
          ),
          SizedBox(height: 15),
          TextField(
              controller: cursoController,
              decoration:InputDecoration(
                labelText: "Curso",
              )
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: cadastrar,
                         child: Text("Cadastrar"),
          ),
          SizedBox(height: 20),
          Text(resultado),
        ],
      ),
      ),
    );
  }
}
