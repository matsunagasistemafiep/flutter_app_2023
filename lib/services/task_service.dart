import 'package:cadastro_tasks/models/tarefa_model.dart';
import 'package:cadastro_tasks/repositories/task_repository.dart';

class TaskService {

  TaskRepository repository = TaskRepository();

  Future<void> insertTask(Tarefa task) async {
    await repository.insert(task);
  } 

  Future<List<Tarefa>> getAll() {
    return repository.getAll();
  }

}