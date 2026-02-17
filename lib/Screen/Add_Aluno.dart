import 'package:flutter/material.dart';

class AddAluno extends StatelessWidget {
  const AddAluno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Aluno")),
      body: const Center(
        child: Text("Tela de Cadastro", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
