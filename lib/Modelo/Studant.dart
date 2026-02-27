class Aluno {
  final String nome;
  final int serie;
  final String turma;
  final String turno;
  final String? foto;

  //Dados pedagógicos (PEI)
  final String? diagnostico;
  final String? nivelSuporte;
  final String? objetivos;
  final String? estrategias;
  final String? observacoes;

  Aluno({
    required this.nome,
    required this.serie,
    required this.turma,
    required this.turno,
    this.foto,
    this.diagnostico,
    this.nivelSuporte,
    this.objetivos,
    this.estrategias,
    this.observacoes,
  });
}
