import 'dart:io';
import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';
import 'Tela_Pei.dart';

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
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  aluno.foto != null ? FileImage(File(aluno.foto!)) : null,
              child:
                  aluno.foto == null
                      ? const Icon(Icons.person, size: 40)
                      : null,
            ),

            const SizedBox(height: 20),

            Text("Série: ${aluno.serie}º"),
            Text("Turma: ${aluno.turma}"),
            Text("Turno: ${aluno.turno}"),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPei(Studant: aluno.nome),
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
