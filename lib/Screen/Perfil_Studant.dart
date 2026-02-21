import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';
import 'package:job/Screen/TelaPei.dart';

class PerfilStudant extends StatelessWidget {
  final Aluno aluno;

  const PerfilStudant({super.key, required this.aluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(aluno.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${aluno.nome}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            Text("Série: ${aluno.serie}º"),
            const SizedBox(height: 10),

            Text("Turma: ${aluno.turma}"),
            const SizedBox(height: 10),

            Text("Turno: ${aluno.turno}"),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPei(aluno: aluno),
                  ),
                );
              },
              child: const Text("Abrir PEI"),
            ),
          ],
        ),
      ),
    );
  }
}
