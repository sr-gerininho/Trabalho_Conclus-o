import 'pei.dart';

class AlunoModel {
  String nome;
  String? foto;
  String serie;
  String turma;
  PeiModel pei;

  AlunoModel({
    required this.nome,
    this.foto,
    required this.serie,
    required this.turma,
    PeiModel? pei,
  }) : pei = pei ?? PeiModel();
}
