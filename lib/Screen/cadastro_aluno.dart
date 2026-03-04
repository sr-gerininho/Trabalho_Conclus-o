import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAlunoScreen extends StatefulWidget {
  const AddAlunoScreen({super.key});

  @override
  State<AddAlunoScreen> createState() => _AddAlunoScreenState();
}

class _AddAlunoScreenState extends State<AddAlunoScreen> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final nascimentoController = TextEditingController();
  final religiaoController = TextEditingController();
  final serieController = TextEditingController();
  final turmaController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final paiController = TextEditingController();
  final maeController = TextEditingController();
  final alergiasController = TextEditingController();

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

  Widget campo(
    String label,
    TextEditingController controller, {
    TextInputType? tipo,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: tipo,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Campo obrigatório";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.blue.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Aluno"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: escolherImagem,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage:
                      imagemPath != null ? FileImage(File(imagemPath!)) : null,
                  child:
                      imagemPath == null
                          ? const Icon(Icons.camera_alt, size: 30)
                          : null,
                ),
              ),
              const SizedBox(height: 20),

              campo("Nome", nomeController),
              campo("Data de Nascimento", nascimentoController),
              campo("Religião", religiaoController),
              campo("Série", serieController),
              campo("Turma", turmaController),
              campo("Endereço", enderecoController),
              campo("Telefone", telefoneController, tipo: TextInputType.phone),
              campo("Email", emailController, tipo: TextInputType.emailAddress),
              campo("Nome do Pai", paiController),
              campo("Nome da Mãe", maeController),
              campo("Alergias", alergiasController),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        "nome": nomeController.text,
                        "foto": imagemPath,
                        "serie": serieController.text,
                        "turma": turmaController.text,
                      });
                    }
                  },
                  child: const Text(
                    "Salvar Aluno",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
