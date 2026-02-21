import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';
import 'package:job/Screen/Add_Aluno.dart';
import 'package:job/Screen/TelaPei.dart';

class Entrada extends StatefulWidget {
  const Entrada({super.key});

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final TextEditingController searchController = TextEditingController();

  String pesquisa = "";
  int? filtroSerie;
  String? filtroTurma;
  String? filtroTurno;

  List<Aluno> alunos = [
    Aluno(nome: "Ana", serie: 1, turma: "A", turno: "Manhã"),
    Aluno(nome: "Bruno", serie: 2, turma: "B", turno: "Tarde"),
    Aluno(nome: "Carlos", serie: 1, turma: "A", turno: "Manhã"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Aluno> alunosFiltrados =
        alunos.where((aluno) {
          final matchNome = aluno.nome.toLowerCase().contains(
            pesquisa.toLowerCase(),
          );

          final matchSerie = filtroSerie == null || aluno.serie == filtroSerie;

          final matchTurma = filtroTurma == null || aluno.turma == filtroTurma;

          final matchTurno = filtroTurno == null || aluno.turno == filtroTurno;

          return matchNome && matchSerie && matchTurma && matchTurno;
        }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Carômetro")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAluno()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: "Pesquisar aluno",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                pesquisa = value;
              });
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: alunosFiltrados.length,
              itemBuilder: (context, index) {
                final aluno = alunosFiltrados[index];

                return ListTile(
                  title: Text(aluno.nome),
                  subtitle: Text(
                    "${aluno.serie}º ${aluno.turma} - ${aluno.turno}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaPei(aluno: aluno),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
