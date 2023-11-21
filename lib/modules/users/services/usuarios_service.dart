import '../models/usuario_model.dart';

class UsuariosService {
  final List<Usuario> _lista = [];

  UsuariosService() {
    _lista.add(
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
    );
  }

  Future<void> store(Usuario user) async {
    _lista.add(user);
    //repository.store(task);
  }

  Future<List<Usuario>> getAll() async {
    //return repository.getAll();
    return Future.value(_lista);
  }

}