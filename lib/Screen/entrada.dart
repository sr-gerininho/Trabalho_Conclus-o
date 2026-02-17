import 'package:flutter/material.dart';
import 'Add_Aluno.dart';
import 'Tela_Pei.dart';
import '../Modelo/Studant.dart';

class Entrada extends StatefulWidget {
  const Entrada({super.key});

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final List<Aluno> students = [
    Aluno(nome: "Maitê", caracter: "Fofinha"),
    Aluno(nome: "Luiz", caracter: "Animadasso"),
  ];

  void adicionarAluno(String nome) {
    setState(() {
      students.add(Aluno(nome: nome, caracter: "Sem descrição"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Alunos")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                students[index].nome[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(students[index].nome),
            subtitle: Text(students[index].caracter),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TelaPei(studant: students[index]),
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
            adicionarAluno(novo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
