import 'package:flutter/material.dart';

class TelaPei extends StatelessWidget {
  final String Studant;
  //------------------------------------------------------------------------------//
  const TelaPei({super.key, required this.Studant});
  //------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pei - $Studant")),
      //------------------------------------------------------------------------------//
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Plano Educacional Individualizado ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Text("Aluno: $Studant"),
            const SizedBox(height: 10),
            const Text("Objetivos"),
            const Text("- Desenvolver autonomia"),
            const Text("- Melhorar socialização"),
          ],
        ),
      ),
    );
  }
}
