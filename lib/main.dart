import 'package:flutter/material.dart';

void main() {
  runApp(const Planejamento());
}

class Planejamento extends StatelessWidget {
  const Planejamento({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tentativa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Planejamento(),
    );
  }
}

class Entrada extends StatelessWidget {
  const Entrada({super.key});
  final List<String> alunos = const ["João", "Maria"];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Alunos")),
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          return ListTile(leading: const Icon(Icons.person));
        },
      ),
    );
  }
}
