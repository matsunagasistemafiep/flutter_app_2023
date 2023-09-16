class Tarefa {
  int id;
  String descricao;
  String data;
  String hora;
  int situacao;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.data,
    required this.hora,
    this.situacao=0
  });

}