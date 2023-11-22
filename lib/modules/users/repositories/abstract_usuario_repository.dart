import '../models/usuario_model.dart';

abstract class AbstractUsuarioRepository {

  Future<List<Usuario>> getAll();

  Future<void> store(Usuario usuario);

}