class Task {
  String id;
  String descricao;
  String data;
  String hora;
  int situacao; // 0 - pendente, 1 - concluído
  String detalhes;

  Task({
    required this.id,
    required this.descricao,
    required this.data,
    required this.hora,
    required this.detalhes,
    this.situacao=0
  });

}