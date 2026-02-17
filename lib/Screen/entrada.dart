import 'package:flutter/material.dart';
import 'Add_Aluno.dart';
import 'Tela_Pei.dart';

class Entrada extends StatefulWidget {
  const Entrada({super.key});

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final List<String> Studant = ["João", "Maria"];

  void AdicionarAluno(String nome) {
    setState(() {
      Studant.add(nome);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Alunos")),
      body: ListView.builder(
        itemCount: Studant.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(Studant[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TelaPei(Studant: Studant[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddAluno()),
          );
          if (novo != null) {
            AdicionarAluno(novo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
