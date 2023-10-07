import 'package:cadastro_tasks/modules/tasks/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'abstract_task_repository.dart';

class DatabaseTaskRepository extends AbstractTaskRepository {
  
  late Future<Database> database;
  final String tableName = "tasks";

  DatabaseTaskRepository() {
    // Instanciar o objeto da classe
    database = init();
  }

  Future<Database> init() async {
    // Cria o banco de dados e configura a tabela
    print(await getDatabasesPath());
    return openDatabase(
      // Diretório do banco de dados
      join(await getDatabasesPath(), 'task_database.db'),
      // Na criação do banco de dados, criar a tabela
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName(id TEXT PRIMARY KEY, descricao TEXT, data TEXT, hora TEXT, detalhes TEXT, situacao INTEGER)"
        );
      }
    );
  }

  
  @override
  Future<List<Task>> getAll() async {
    // Referenciar o objeto
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);

    // Usar o gerador de lista
    return List.generate(
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

  }

  @override
  Future<void> store(Task task) async {
    // Referenciar o objeto
    final db = await database;
    await db.insert(
      tableName, 
      task.toMap()
    );
  }
  
}