class Tarefa {
  int id;
  String descricao;
  String data;
  String hora;
  int situacao; // 0 - pendente, 1 - concluído
  String detalhes;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.data,
    required this.hora,
    required this.detalhes,
    this.situacao=0
  });

  Map<String ,dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'data': data,
      'hora': hora,
      'detalhes': detalhes
    };
  }

  @override
  String toString() {
    return 'Task{$id, $descricao, $data, $hora, $detalhes}';
  }


}