import 'package:flutter/material.dart';
import 'package:job/Modelo/user_model.dart';
import 'cadastro_aluno.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  final UserModel usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool podeCadastrarAluno() {
    return widget.usuario.tipo == "Coordenador";
  }

  void abrirCadastro() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddAlunoScreen()),
    );

    if (resultado != null && mounted) {
      await firestore.collection("alunos").add({
        "nome": resultado["nome"] ?? "",
        "serie": resultado["serie"] ?? "",
        "turma": resultado["turma"] ?? "",
        "foto": resultado["foto"],
        "criadoEm": Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo, ${widget.usuario.nome}"),
        backgroundColor: Colors.blue.shade700,
      ),
      floatingActionButton:
          podeCadastrarAluno()
              ? FloatingActionButton(
                backgroundColor: Colors.blue.shade700,
                onPressed: abrirCadastro,
                child: const Icon(Icons.add),
              )
              : null,
      body: StreamBuilder<QuerySnapshot>(
        stream:
            firestore
                .collection("alunos")
                .orderBy("criadoEm", descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Nenhum aluno cadastrado"));
          }

          final alunos = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: alunos.length,
            itemBuilder: (context, index) {
              final aluno = alunos[index].data() as Map<String, dynamic>;

              return Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(aluno["nome"] ?? ""),
                  subtitle: Text(
                    "${aluno["serie"] ?? ""} - ${aluno["turma"] ?? ""}",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
