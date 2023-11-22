import 'package:intl/intl.dart';

class Usuario {
  /// Atributos da classe obrigatórios
  String nome;
  String urlFoto;
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

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'urlFoto': urlFoto,
      'email': email,
      'telefone': telefone,
      'dataNascimento': DateFormat('yyyy-MM-dd').format(dataNascimento)

    };
  }

}