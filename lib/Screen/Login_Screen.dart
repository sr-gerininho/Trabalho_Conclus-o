import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:job/Modelo/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nomeController = TextEditingController();
  String tipoSelecionado = "Professor";

  void entrar() {
    if (nomeController.text.isEmpty) return;

    final user = UserModel(nome: nomeController.text, tipo: tipoSelecionado);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(usuario: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Sistema Escolar",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: "Seu nome"),
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: tipoSelecionado,
                  items: const [
                    DropdownMenuItem(
                      value: "Professor",
                      child: Text("Professor"),
                    ),
                    DropdownMenuItem(value: "AEE", child: Text("AEE")),
                    DropdownMenuItem(
                      value: "Psicóloga",
                      child: Text("Psicóloga"),
                    ),
                    DropdownMenuItem(
                      value: "Coordenador",
                      child: Text("Coordenador"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      tipoSelecionado = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: entrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                    ),
                    child: const Text("Entrar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
