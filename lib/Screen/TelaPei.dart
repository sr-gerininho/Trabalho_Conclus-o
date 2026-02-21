import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';

class TelaPei extends StatelessWidget {
  final Aluno aluno;

  const TelaPei({super.key, required this.aluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PEI - ${aluno.nome}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aluno: ${aluno.nome}"),
            const SizedBox(height: 10),
            Text("Série: ${aluno.serie}º"),
            Text("Turma: ${aluno.turma}"),
            Text("Turno: ${aluno.turno}"),
          ],
        ),
      ),
    );
  }
}
