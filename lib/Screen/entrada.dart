import 'package:flutter/material.dart';
import 'Add_Aluno.dart';

class Entrada extends StatelessWidget {
  const Entrada({super.key});
  final List<String> alunos = const ["João", "Maria"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Alunos")),
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(alunos[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAluno()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
