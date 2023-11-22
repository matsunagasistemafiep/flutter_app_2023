import 'package:my_flutter_app/modules/users/repositories/abstract_usuario_repository.dart';
import 'package:my_flutter_app/modules/users/repositories/usuario_repository.dart';

import '../models/usuario_model.dart';

class UsuariosService {
  final List<Usuario> _lista = [];
  late AbstractUsuarioRepository repository;

  UsuariosService() {
    repository = UsuarioRepository();
    /*_lista.add(
      Usuario(
        nome:"Fulano de Tal", 
        email:"fulano@mail.com",
        urlFoto:"https://i.pravatar.cc/300?img=1",
        dataNascimento: DateTime.now()
      )
    );
    _lista.add(
      Usuario(
        nome: "Beltrano de Tal", 
        urlFoto: "https://i.pravatar.cc/300?img=12",
        dataNascimento: DateTime.now()
      )
    );
    _lista.add(
      Usuario(
        nome: "Ciclano de Tal",
        urlFoto: "https://i.pravatar.cc/300?img=25",
        email: "ciclano@mail.com",
        dataNascimento: DateTime.now()
      )
    );*/
  }

  Future<void> store(Usuario user) async {
    _lista.add(user);
    repository.store(user);
  }

  Future<List<Usuario>> getAll() async {
    //return Future.value(_lista);
    return repository.getAll();
  }

}