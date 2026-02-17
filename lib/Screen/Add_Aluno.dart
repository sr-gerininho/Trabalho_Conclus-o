import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAluno extends StatefulWidget {
  const AddAluno({super.key});

  @override
  State<AddAluno> createState() => _AddAlunoState();
}

class _AddAlunoState extends State<AddAluno> {
  final TextEditingController editor = TextEditingController();
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
      appBar: AppBar(title: const Text("Adicionar Aluno")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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

            TextField(
              controller: editor,
              decoration: const InputDecoration(
                labelText: "Nome do Aluno",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (editor.text.trim().isNotEmpty) {
                    Navigator.pop(context, {
                      "nome": editor.text,
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
}
