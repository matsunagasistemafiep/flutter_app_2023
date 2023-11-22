
import 'package:my_flutter_app/modules/users/models/usuario_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'abstract_usuario_repository.dart';

class UsuarioRepository extends AbstractUsuarioRepository {
  late Future<Database> database;
  final String tableName = "users";

  UsuarioRepository() {
    // Instanciar o objeto da classe
    database = init();
  }

  /// Remove o banco de dados
  Future<void> deleteDatabase(String path) => databaseFactory.deleteDatabase(path);

  Future<Database> init() async {
    // Cria o banco de dados e configura a tabela
    // print(await getDatabasesPath());
    // deleteDatabase(join(await getDatabasesPath(), 'task_database.db'));
    return openDatabase(
      // Diretório do banco de dados
      join(await getDatabasesPath(), 'user_database.db'),
      // Na criação do banco de dados, criar a tabela
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName(nome TEXT, urlFoto TEXT, dataNascimento TEXT, email TEXT, telefone TEXT)"
        );
      },
      version: 1
    );
  }

  @override
  Future<List<Usuario>> getAll() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);
    List<Usuario> lista = List.generate(
      maps.length, 
      (index) {
        return Usuario(
          nome: maps[index]['nome'], 
          email: maps[index]['email'], 
          telefone: maps[index]['telefone'], 
          urlFoto: maps[index]['urlFoto'], 
          dataNascimento: DateTime.tryParse(maps[index]['dataNascimento'])!
        );
      }
    );
    return lista;
  }

  @override
  Future<void> store(Usuario usuario) async {
    // Referenciar o objeto
    final db = await database;
    await db.insert(
      tableName, 
      usuario.toMap()
    );
  }


}