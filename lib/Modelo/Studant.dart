class Aluno {
  final String nome;
  final int serie;
  final String? foto;
  final String turma;
  final String turno;

  Aluno({
    required this.nome,
    this.foto,
    required this.serie,
    required this.turma,
    required this.turno,
  });
}
