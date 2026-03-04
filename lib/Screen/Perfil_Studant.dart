import 'dart:io';
import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';
import 'package:job/Modelo/user_model.dart';
import 'TelaPei.dart';

class PerfilAlunoScreen extends StatelessWidget {
  final AlunoModel aluno;
  final UserModel usuario;

  const PerfilAlunoScreen({
    super.key,
    required this.aluno,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aluno.nome),
        backgroundColor: Colors.blue.shade700,
      ),
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
            const SizedBox(height: 16),

            Text(
              "${aluno.serie} - ${aluno.turma}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.menu_book),
                label: const Text("Acessar PEI"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PeiScreen(aluno: aluno, usuario: usuario),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
