class Usuario {
  /// Atributos da classe
  String nome;
  String urlFoto;
  String email;

  /// Construtor da classe
  Usuario({
    required this.nome,
    required this.urlFoto,
    this.email = "usuario@mail.com"
  });

}