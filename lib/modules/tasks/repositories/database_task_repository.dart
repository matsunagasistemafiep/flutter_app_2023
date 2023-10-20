import 'package:cadastro_tasks/modules/tasks/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'abstract_task_repository.dart';

/// Armazena os dados em um banco de dados SQLite
/// Documentação oficial: https://docs.flutter.dev/cookbook/persistence/sqlite
class DatabaseTaskRepository extends AbstractTaskRepository {
  
  late Future<Database> database;
  final String tableName = "tasks";

  DatabaseTaskRepository() {
    
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
      join(await getDatabasesPath(), 'task_database.db'),
      // Na criação do banco de dados, criar a tabela
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName(id TEXT PRIMARY KEY, descricao TEXT, data TEXT, hora TEXT, detalhes TEXT, situacao INTEGER)"
        );
      },
      version: 1
    );
  }

  
  @override
  Future<List<Task>> getAll() async {
    // Referenciar o objeto
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);
    print(maps);
    // Usar o gerador de lista
    List<Task> lista = List.generate(
      maps.length, 
      (index) {
        return Task(
          id: maps[index]['id'], 
          descricao: maps[index]['descricao'], 
          data: maps[index]['data'], 
          hora: maps[index]['hora'], 
          detalhes: maps[index]['detalhes'],
          situacao: maps[index]['situacao']
        );
      }
    );
    print(lista);
    return lista;

  }

  /// Armazena um registro de Task na tabela do banco de dados
  @override
  Future<void> store(Task task) async {
    // Referenciar o objeto
    final db = await database;
    await db.insert(
      tableName, 
      task.toMap()
    );
  }
  
  @override
  Future<void> delete(String id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id], // Prevenir SQL Injection
    );

  }
  
  @override
  Future<void> update(String id, Task task) async {
    final db = await database;

    // Update the given Dog.
    await db.update(
      tableName,
      task.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );
  }

  
}