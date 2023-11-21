class Usuario {
  /// Atributos da classe obrigatórios
  String nome;
  String urlFoto;
  /// Atributos não obrigatórios
  String email;
  String? telefone;
  DateTime dataNascimento;

  /// Construtor da classe
  Usuario({
    required this.nome,
    required this.urlFoto,
    required this.dataNascimento,
    this.email = "usuario@mail.com",
    this.telefone = "(43)3344-5566",
  });

}