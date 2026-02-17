import 'package:flutter/material.dart';
import '../Modelo/Studant.dart';

class TelaPei extends StatelessWidget {
  final Aluno studant;

  const TelaPei({super.key, required this.studant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PEI - ${studant.nome}")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Plano Educacional Individualizado",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text("Aluno: ${studant.nome}"),
            const SizedBox(height: 10),

            Text("Características: ${studant.caracter}"),

            const SizedBox(height: 20),

            const Text("Objetivos"),
            const Text("- Desenvolver autonomia"),
            const Text("- Melhorar socialização"),
          ],
        ),
      ),
    );
  }
}
