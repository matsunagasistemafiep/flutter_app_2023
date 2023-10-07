import 'package:cadastro_tasks/models/tarefa_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  /// Objeto que representa o banco de dados
  late Future<Database> database;

  TaskRepository() {
    database = init();
    insert(Tarefa(id: 2, descricao: "descricao 2", data: "12/11", hora: "13:00", detalhes: "outro"));
  }

  Future<Database> init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'task_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, descricao TEXT, data TEXT, hora TEXT, situacao INTEGER, detalhes TEXT)"
        );
      },
      version: 1
    );
  }

  Future<void> insert(Tarefa task) async {
    final db = await database;
    await db.insert('tasks', task.toMap());
  }

  Future<List<Tarefa>> getAll() async {
    final db = await database;
    /// Consutlar o banco de dados e trazer todos os registros
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (index) {
      return Tarefa(
        id: maps[index]['id'], 
        descricao: maps[index]['descricao'], 
        data: maps[index]['data'], 
        hora: maps[index]['hora'], 
        detalhes: maps[index]['detalhes'], 
      );
    });

  }

}