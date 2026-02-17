import 'package:flutter/material.dart';
import 'package:job/Screen/entrada.dart';

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
      home: const Entrada(),
    );
  }
}
