import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAluno extends StatefulWidget {
  const AddAluno({super.key});

  @override
  State<AddAluno> createState() => _AddAlunoState();
}

class _AddAlunoState extends State<AddAluno> {
  final TextEditingController Nome = TextEditingController();
  final TextEditingController Nascimento = TextEditingController();
  final TextEditingController Religiao = TextEditingController();
  final TextEditingController serie = TextEditingController();
  final TextEditingController Turma = TextEditingController();
  final TextEditingController Endereco = TextEditingController();
  final TextEditingController Telefone = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Pai = TextEditingController();
  final TextEditingController Mae = TextEditingController();
  final TextEditingController Alergias = TextEditingController();

  String? imagemPath;

  Future<void> escolherImagem() async {
    final picker = ImagePicker();

    final imagem = await picker.pickImage(source: ImageSource.gallery);

    if (imagem != null) {
      setState(() {
        imagemPath = imagem.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Aluno")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "DADOS PESSOAIS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            GestureDetector(
              onTap: escolherImagem,
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    imagemPath != null ? FileImage(File(imagemPath!)) : null,
                child: imagemPath == null ? const Icon(Icons.camera_alt) : null,
              ),
            ),

            const SizedBox(height: 20),

            _buildCampo("Nome", Nome),
            _buildCampo("Nascimento", Nascimento),
            _buildCampo("Religião", Religiao),
            _buildCampo("Série", serie),
            _buildCampo("Turma", Turma),
            _buildCampo("Endereço", Endereco),
            _buildCampo("Telefone", Telefone),
            _buildCampo("Email", Email),
            _buildCampo("Pai", Pai),
            _buildCampo("Mãe", Mae),
            _buildCampo("Alergias", Alergias),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (Nome.text.trim().isNotEmpty) {
                    Navigator.pop(context, {
                      "nome": Nome.text,
                      "foto": imagemPath,
                    });
                  }
                },
                child: const Text("Salvar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
