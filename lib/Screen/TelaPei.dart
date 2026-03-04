import 'package:flutter/material.dart';
import 'package:job/Modelo/Studant.dart';
import 'package:job/Modelo/pei_entry_model.dart';
import 'package:job/Modelo/user_model.dart';

class PeiScreen extends StatefulWidget {
  final AlunoModel aluno;
  final UserModel usuario;

  const PeiScreen({super.key, required this.aluno, required this.usuario});

  @override
  State<PeiScreen> createState() => _PeiScreenState();
}

class _PeiScreenState extends State<PeiScreen> {
  final TextEditingController descricaoController = TextEditingController();

  Color corPorTipo(String tipo) {
    switch (tipo) {
      case "Professor":
        return Colors.blue.shade100;
      case "AEE":
        return Colors.green.shade100;
      case "Psicóloga":
        return Colors.purple.shade100;
      case "Coordenador":
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  void adicionarRegistro() {
    if (descricaoController.text.isEmpty) return;

    final novoRegistro = PeiEntryModel(
      autor: widget.usuario.nome,
      tipo: widget.usuario.tipo,
      descricao: descricaoController.text,
      data: DateTime.now(),
    );

    setState(() {
      widget.aluno.pei.historico.insert(0, novoRegistro);
      descricaoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PEI - Timeline"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        children: [
          Expanded(
            child:
                widget.aluno.pei.historico.isEmpty
                    ? const Center(child: Text("Nenhum registro ainda"))
                    : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: widget.aluno.pei.historico.length,
                      itemBuilder: (context, index) {
                        final item = widget.aluno.pei.historico[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: corPorTipo(item.tipo),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item.autor} • ${item.tipo}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(item.descricao),
                              const SizedBox(height: 6),
                              Text(
                                "${item.data.day}/${item.data.month}/${item.data.year}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      hintText: "Adicionar registro no PEI...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: adicionarRegistro,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
